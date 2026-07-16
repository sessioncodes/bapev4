local commit = readfile('bapevape/profiles/commit.txt')
local url = 'https://raw.githubusercontent.com/sessioncodes/bapev4/'..commit..'/games/bape.lua'
local success, source = pcall(function()
	return game:HttpGet(url, true)
end)

if not success or source == '404: Not Found' then
	error('Failed to download games/bape.lua: '..tostring(source))
end

local module, loadError = loadstring(source, 'bape')
if not module then
	error('Failed to compile games/bape.lua: '..tostring(loadError))
end

return module(...)
