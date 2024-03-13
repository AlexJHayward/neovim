return {
  "chrisgrieser/nvim-spider",
  keys = {
    {
      "e",
      "<cmd>lua require('spider').motion('e')<cr>",
      mode = { "n", "o", "x" },
      desc = "Spider-e",
    },
    {
      "b",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider-b",
    },
    {
      "w",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider-w",
    },
  },
}
