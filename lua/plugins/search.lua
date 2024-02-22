return {
  {
    "nvim-telescope/telescope.nvim",
    -- install fzf native
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<C-g>", "<cmd>Telescope commands<CR>", desc = "Show available commands" },
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<C-t>",
        "<cmd>Telescope buffers<cr>",
        desc = "Recent",
      },
      {
        "<leader>ss",
        "<cmd>Telescope aerial<cr>",
        desc = "Goto Symbol (Aerial)",
      },
    },
    --   opts = {
    --     defaults = {
    --       mappings = {
    --         i = {
    --           ["<C-k>"] = function(...)
    --             return require("telescope.actions").move_selection_previous(...)
    --           end,
    --           ["<C-j>"] = function(...)
    --             return require("telescope.actions").move_selection_next(...)
    --           end,
    --         },
    --       },
    --     },
    opts = function()
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("aerial")
      end)
    end,
  },
  {
    "folke/flash.nvim",
    opts = {
      search = {
        mode = "fuzzy",
      },
      jump = { nohlsearch = true },
    },
  },
}
