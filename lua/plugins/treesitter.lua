return {
  'nvim-treesitter/nvim-treesitter', branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  config = function ()
      local configs = require('nvim-treesitter.configs')
      configs.setup {
        highlight = {
              enable = true,
        },
        indent = { enable = true },
        autotage = { enable = true },
        ensure_installed = {
            "lua",
            "c",
            "markdown", 
            "markdown_inline",
            "cpp",
        },
        auto_install = true
      }
  end
}
