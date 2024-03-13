-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- turn word wrapping on
vim.wo.wrap = true

-- enable spellchecker
vim.wo.spell = true
vim.bo.spelllang = "en_us"

vim.o.termguicolors = true
