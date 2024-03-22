local loaded_plenary, Path = pcall(require, "plenary.path")
if loaded_plenary then
	return Path.path.sep
end

if package.config:sub(1, 1) == "\\" then
	return "\\"
else
	return "/"
end
