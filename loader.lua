shared.closet = true
shared.badexecs = nil

local isfile = isfile or function(file)
	local suc, res = pcall(function()
		return readfile(file)
	end)
	return suc and res ~= nil and res ~= ''
end
local delfile = delfile or function(file)
	writefile(file, '')
end

local httpService = game:GetService('HttpService')

local function checkLicense()
	local lic = shared.bapeL
	if not lic and isfile('bapevape/profiles/lic.txt') then
		lic = readfile('bapevape/profiles/lic.txt')
	end
	if not lic or lic == '' then
		error('[Bape] No license. Get one at https://bape.lol')
	end

	local mid = game:GetService('RbxAnalyticsService'):GetClientId()
	local ok, raw = pcall(function()
		return game:HttpGet('https://bape-kohl.vercel.app/api/check?l='..lic..'&m='..mid, false)
	end)

	if not ok then
		if isfile('bapevape/profiles/lic.txt') then return end
		error('[Bape] Could not reach auth server')
	end

	local data = httpService:JSONDecode(raw)
	if not data.ok then
		error('[Bape] '..tostring(data.msg or 'Access denied'))
	end

	writefile('bapevape/profiles/lic.txt', lic)
end

local function downloadFile(path, func)
	if not isfile(path) then
		local suc, res = pcall(function()
			return game:HttpGet('https://raw.githubusercontent.com/sessioncodes/bapev4/'..readfile('bapevape/profiles/commit.txt')..'/'..select(1, path:gsub('bapevape/', '')), false)
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

local function wipeFolder(path)
	if not isfolder(path) then return end
	for _, file in listfiles(path) do
		if file:find('loader') then continue end
		if isfile(file) and select(1, readfile(file):find('--This watermark is used to delete the file if its cached, remove it to make the file persist after vape updates.')) == 1 then
			delfile(file)
		end
	end
end

for _, folder in {'bapevape', 'bapevape/games', 'bapevape/profiles', 'bapevape/assets', 'bapevape/libraries', 'bapevape/guis', 'bapevape/cache'} do
	if not isfolder(folder) then
		makefolder(folder)
	end
end

checkLicense()

if not shared.VapeDeveloper then
	local cachedCommit = isfile('bapevape/profiles/commit.txt') and readfile('bapevape/profiles/commit.txt') or ''
	local success, response = pcall(function()
		return game:HttpGet('https://api.github.com/repos/sessioncodes/bapev4/commits/main', false)
	end)
	local commit
	if success then
		local decoded = pcall(function()
			commit = httpService:JSONDecode(response).sha
		end)
		if not decoded or type(commit) ~= 'string' or #commit ~= 40 then commit = nil end
	end
	commit = commit or 'main'
	if commit == 'main' or cachedCommit ~= commit then
		wipeFolder('bapevape')
		wipeFolder('bapevape/games')
		wipeFolder('bapevape/guis')
		wipeFolder('bapevape/libraries')
	end
	writefile('bapevape/profiles/commit.txt', commit)
end

return loadstring(downloadFile('bapevape/main.lua'), 'main')()
