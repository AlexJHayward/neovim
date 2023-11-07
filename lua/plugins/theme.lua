return {
  -- schemes
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/everforest" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim" },
  { "rose-pine/neovim" },
  { "EdenEast/nightfox.nvim" },
  { "AlexvZyl/nordic.nvim" },
  { "shaunsingh/nord.nvim" },
  { "ronisbr/nano-theme.nvim" },
  { "kvrohit/mellow.nvim" },
  { "aditya-azad/candle-grey" },
  { "Lokaltog/monotone.nvim", dependencies = { "rktjmp/lush.nvim" } },

  -- load theme on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "candle-grey",
    },
  },
}
