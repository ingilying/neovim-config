vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local kmaps = function(keys, func, desci, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "Lsp: " .. desci })
        end
        -- rename
        kmaps('<leader>rn', vim.lsp.buf.rename, "Rename")
        -- goto
        kmaps('gd', require("telescope.builtin").lsp_definitions, "Goto definition")
        kmaps('gh', vim.lsp.buf.hover, "Hover")
        kmaps('gD', vim.lsp.buf.declaration, "Goto declaration")
        kmaps('gi', require("telescope.builtin").lsp_implementations, "Goto implementation")
        kmaps('gr', require("telescope.builtin").lsp_references, "Goto references")
        -- diagnostic
        kmaps('go', vim.diagnostic.open_float, "Open diagnostic")
        kmaps('gp', function()
            vim.diagnostic.jump({ count = 1 })
        end, "Goto previous diagnostic")
        kmaps('gn', function ()
            vim.diagnostic.jump({ count = -1 })
        end, "Goto next diagnostic")
        -- format
        kmaps('<leader>.', vim.lsp.buf.format, "Format code")
        -- action ( instead by tiny-code-action
        -- kmaps('ga', vim.lsp.buf.code_action, "Code Action")
    end
})

vim.diagnostic.config {
    severity_sort = true,
    underline = { severity = vim.diagnostic.severity.ERROR },
    float = { border = "rounded", source = "if_many" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ", -- 这里配置“错误”的图标，需要nerd font字体
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        }
    },
    virtual_text = {
        source = "if_many",
        spacing = 2,
        severity = vim.diagnostic.severity.ERROR,
        format = function(diagnostic)
            local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
        end,
    },

}

--vim.api.nvim_create_autocmd("CursorHold", {
--    pattern = "*",
--    callback = function()
--        vim.diagnostic.open_float(nil, {
--            focusable = false,
--            close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
--            border = "rounded",
--            scope = "cursor",
--        })
--    end
--})

return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
