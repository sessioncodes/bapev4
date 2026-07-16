shared.closet = true

repeat task.wait() until game:IsLoaded()
if shared.vape then shared.vape:Uninject() end
if shared.badexecs then return end

local vape
local loadstring = function(...)
	local res, err = loadstring(...)
	if err and vape then
		vape:CreateNotification('Bape', 'Failed to load : '..err, 30, 'alert')
	end
	return res
end
local queue_on_teleport = queue_on_teleport or queueonteleport or function() end
local isfile = isfile or function(file)
	local suc, res = pcall(function()
		return readfile(file)
	end)
	return suc and res ~= nil and res ~= ''
end
local cloneref = cloneref or function(obj)
	return obj
end
local playersService = cloneref(game:GetService('Players'))

local function downloadFile(path, func)
	if not isfile(path) then
		local suc, res = pcall(function()
			return game:HttpGet('https://raw.githubusercontent.com/sessioncodes/bapev4/'..readfile('newvape/profiles/commit.txt')..'/'..select(1, path:gsub('newvape/', '')), true)
		end)
		if not suc or res == '404: Not Found' then
			error(res)
		end
		if path:find('.lua') then
			res = '--This watermark is used to delete the file if its cached, remove it to make the file persist after vape updates.\n'..res
		end
		writefile(path, res)
	end
	return (func or readfile)(path)
end

local function finishLoading()
	vape.Init = nil
	vape:Load()
	task.spawn(function()
		repeat
			vape:Save()
			task.wait(10)
		until not vape.Loaded
	end)

	local teleportedServers
	vape:Clean(playersService.LocalPlayer.OnTeleport:Connect(function()
		if (not teleportedServers) and (not shared.VapeIndependent) then
			teleportedServers = true
			local teleportScript = [[
				shared.vapereload = true
				if shared.VapeDeveloper then
					loadstring(readfile('newvape/loader.lua'), 'loader')()
				else
					loadstring(game:HttpGet('https://raw.githubusercontent.com/sessioncodes/bapev4/'..readfile('newvape/profiles/commit.txt')..'/loader.lua', true), 'loader')()
				end
			]]
			if shared.VapeDeveloper then
				teleportScript = 'shared.VapeDeveloper = true\n'..teleportScript
			end
			if shared.closet then
				teleportScript = 'shared.closet = true\n'..teleportScript
			end
			if shared.VapeCustomProfile then
				teleportScript = 'shared.VapeCustomProfile = "'..shared.VapeCustomProfile..'"\n'..teleportScript
			end
			vape:Save()
			queue_on_teleport(teleportScript)
		end
	end))

	if not shared.vapereload then
		if not vape.Categories then return end
		if vape.Categories.Main.Options['GUI bind indicator'].Enabled then
			vape:CreateNotification('Finished Loading', vape.VapeButton and 'Press the button in the top right to open GUI' or 'Press '..table.concat(vape.Keybind, ' + '):upper()..' to open GUI', 5)
		end
	end
end

if not isfile('newvape/profiles/gui.txt') then
	writefile('newvape/profiles/gui.txt', 'new')
end
local gui = readfile('newvape/profiles/gui.txt')

if not isfolder('newvape/assets/'..gui) then
	makefolder('newvape/assets/'..gui)
end
vape = loadstring(downloadFile('newvape/guis/'..gui..'.lua'), 'gui')()
shared.vape = vape

local urlpath
if not shared.VapeIndependent then
	local universalModule, universalLoadError = loadstring(downloadFile('newvape/games/universal.lua'), 'universal')
	if universalModule then
		local universalSuccess, universalRuntimeError = pcall(universalModule)
		if not universalSuccess then
			warn('[Bape] Universal module error: '..tostring(universalRuntimeError))
			vape:CreateNotification('Universal module error', tostring(universalRuntimeError), 10, 'alert')
		end
	else
		warn('[Bape] Universal module compile error: '..tostring(universalLoadError))
	end
	local gameModuleId = game.GameId == 2619619496 and 6872274481 or game.PlaceId
	vape.Place = gameModuleId
	local function loadGameModule(source)
		local module, loadError = loadstring(source, tostring(gameModuleId))
		if not module then
			warn('[Bape] Failed to compile game module '..gameModuleId..': '..tostring(loadError))
			vape:CreateNotification('Game module failed', 'Compile error: '..tostring(loadError), 10, 'alert')
			return
		end

		local success, runtimeError = pcall(module)
		if not success then
			warn('[Bape] Failed to run game module '..gameModuleId..': '..tostring(runtimeError))
			vape:CreateNotification('Game module failed', tostring(runtimeError), 10, 'alert')
		end
	end
	task.spawn(function(...)
		if isfile('newvape/games/'..gameModuleId..'.lua') then
			loadGameModule(readfile('newvape/games/'..gameModuleId..'.lua'))
		else
			if not shared.VapeDeveloper then
				local suc, res = pcall(function()
					return game:HttpGet('https://raw.githubusercontent.com/sessioncodes/bapev4/'..readfile('newvape/profiles/commit.txt')..'/games/'..gameModuleId..'.lua', true)
				end)
				if suc and res ~= '404: Not Found' then
					loadGameModule(downloadFile('newvape/games/'..gameModuleId..'.lua'))
				end
			end
		end
		finishLoading()
	end)
else
	vape.Init = finishLoading
	return vape
end
