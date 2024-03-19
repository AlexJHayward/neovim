return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "jfpedroza/neotest-elixir",
    "marilari88/neotest-vitest",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-elixir"),
        require("neotest-vitest"),
      },
    })
  end,
}
