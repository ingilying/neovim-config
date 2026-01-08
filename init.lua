-- init plugin manager
require("config.lazy")

-- load basic config
require('config.options')
require('config.keymap')


-- set the colorscheme
vim.cmd [[colorscheme tokyonight]]
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
