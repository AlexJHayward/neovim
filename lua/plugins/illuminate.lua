return {
  "RRethy/vim-illuminate",
  opts = {
    filetype_overrides = {
      elixir = {
        providers = {
          "lsp",
          "regex",
        },
      },
    },
  },
}
