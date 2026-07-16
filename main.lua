shared.closet = true
shared.badexecs = nil

repeat task.wait() until game:IsLoaded()
if shared.vape then shared.vape:Uninject() end

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
			return game:HttpGet('https://raw.githubusercontent.com/sessioncodes/bapev4/'..readfile('bapevape/profiles/commit.txt')..'/'..select(1, path:gsub('bapevape/', '')), true)
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

	local teleportedServers
	vape:Clean(playersService.LocalPlayer.OnTeleport:Connect(function()
		if (not teleportedServers) and (not shared.VapeIndependent) then
			teleportedServers = true
			local teleportScript = [[
				shared.vapereload = true
				if shared.VapeDeveloper then
					loadstring(readfile('bapevape/loader.lua'), 'loader')()
				else
					loadstring(game:HttpGet('https://raw.githubusercontent.com/sessioncodes/bapev4/'..readfile('bapevape/profiles/commit.txt')..'/loader.lua', true), 'loader')()
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

if not isfile('bapevape/profiles/gui.txt') then
	writefile('bapevape/profiles/gui.txt', 'new')
end
local gui = readfile('bapevape/profiles/gui.txt')

if not isfolder('bapevape/assets/'..gui) then
	makefolder('bapevape/assets/'..gui)
end
vape = loadstring(downloadFile('bapevape/guis/'..gui..'.lua'), 'gui')()
shared.vape = vape

local urlpath
if not shared.VapeIndependent then
	local universalModule, universalLoadError = loadstring(downloadFile('bapevape/games/universal.lua'), 'universal')
	if universalModule then
		local universalSuccess, universalRuntimeError = pcall(universalModule)
		if not universalSuccess then
			warn('[Bape] Universal module error: '..tostring(universalRuntimeError))
			vape:CreateNotification('Universal module error', tostring(universalRuntimeError), 10, 'alert')
		end
	else
		warn('[Bape] Universal module compile error: '..tostring(universalLoadError))
	end
	local isBedwars = game.GameId == 2619619496 or game.PlaceId == 6872265039 or game.PlaceId == 6872274481
	local gameModuleId = game.GameId == 2619619496 and 6872274481 or game.PlaceId
	-- Lobby and match modules share one profile without forcing the match module to run in the lobby.
	vape.Place = isBedwars and 6872274481 or gameModuleId
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
		if isfile('bapevape/games/'..gameModuleId..'.lua') then
			loadGameModule(readfile('bapevape/games/'..gameModuleId..'.lua'))
		else
			if not shared.VapeDeveloper then
				local suc, res = pcall(function()
					return game:HttpGet('https://raw.githubusercontent.com/sessioncodes/bapev4/'..readfile('bapevape/profiles/commit.txt')..'/games/'..gameModuleId..'.lua', true)
				end)
				if suc and res ~= '404: Not Found' then
					loadGameModule(downloadFile('bapevape/games/'..gameModuleId..'.lua'))
				end
			end
		end
		finishLoading()
	end)
else
	vape.Init = finishLoading
	return vape
end
