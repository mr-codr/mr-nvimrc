local configPath = vim.fn.stdpath("config")

if string.sub(configPath, 3, 3) == "\\" then
	return "\\"
else
	return "/"
end
