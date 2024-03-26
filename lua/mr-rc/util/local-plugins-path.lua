local path = require("mr-rc.util.path")
local config_path = vim.fn.stdpath("config")
local local_plugins_path = path.normalize_sep(config_path .. "/lua/mr-rc/plugins/local/")

return local_plugins_path
