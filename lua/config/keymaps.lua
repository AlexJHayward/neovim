-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set(
--   "n",
--   "<cr>",
--   "\"*y:silent! let searchTerm = 'V'.substitute(escape(@*, '/'), \"\n\", '\\n', \"g\") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd(\"search\", searchTerm) <bar> set hls<cr>",
--   { silent = true }
-- )
-- makes * and # work on visual mode too.
-- vim.api.nvim_exec(
--   [[
--   function! g:VSetSearch(cmdtype)
--     let temp = @s
--     norm! gv"sy
--     let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
--     let @s = temp
--   endfunction
--
--   xnoremap <leader><cr> :<C-u>call g:VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
--   ]],
--   false
-- )
vim.keymap.set("n", "<C-q>", ":bdelete<CR>")

-- tmux navigation
local nvim_tmux_nav = require("nvim-tmux-navigation")
vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- language server mappings
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gu", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<S-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- new scratch buffer
vim.api.nvim_exec(
  [[
function! Scratch()
    split
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal nobuflisted
    "lcd ~
    file scratch
endfunction

command! NewScratch silent! execute "call Scratch()"
]],
  false
)

-- mix test convenience commands
vim.api.nvim_create_user_command("MixTest", "terminal mix test", {})
vim.api.nvim_create_user_command("MixTestFailed", "terminal mix test --failed", {})
vim.api.nvim_create_user_command("MixTestFile", "terminal mix test %", {})
vim.api.nvim_create_user_command("MixTestOnly", function()
  local line = vim.fn.line(".")
  vim.api.nvim_command("terminal mix test % --only line:" .. line)
end, {})
-- mix test convenience commands
-- vim.api.nvim_create_user_command("TaskTest", "terminal task test", {})
-- vim.api.nvim_create_user_command("TaskTestFailed", "terminal task test --failed", {})
-- vim.api.nvim_create_user_command("TaskTestFile", "terminal task test %", {})
-- vim.api.nvim_create_user_command("TaskTestOnly", function()
--   local line = vim.fn.line(".")
--   vim.api.nvim_command("terminal task test % --only line:" .. line)
-- end, {})
