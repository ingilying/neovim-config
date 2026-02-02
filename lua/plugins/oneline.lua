return {
    {
        'kosayoda/nvim-lightbulb',
        opts = {
            autocmd = { enabled = true }
        }
    },
    {
        'nvim-mini/mini.pairs',
        version = false,
        opts = {}
    },
    {
        'xiyaowong/transparent.nvim',
        config = function ()
            local trans = require('transparent')
            trans.clear_prefix('NvimTree')
            -- trans.clear_prefix('lualine')
        end
    }
}
