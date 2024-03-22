local normalizeSep = require("mr-rc.util.normalize_sep").normalize
local configPath = vim.fn.stdpath("config")
local localPluginsPath = normalizeSep(configPath .. "/lua/mr-rc/plugins/local/")

return localPluginsPath
