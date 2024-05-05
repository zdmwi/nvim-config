local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>pv", vim.cmd.Ex)

-- LSP mappings
map("n", "<leader>rn", vim.lsp.buf.rename)

-- diagnostic key mappings
map("n", "[d", function()
    vim.diagnostic.goto_prev({ wrap = false })
end)
map("n", "]d", function()
    vim.diagnostic.goto_next({ wrap = false })
end)

map("n", "<leader>ws", function()
    require("metals").hover_worksheet()
end)
