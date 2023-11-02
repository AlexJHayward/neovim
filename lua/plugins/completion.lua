return {
  -- disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- behaviour should be:
  -- <tab> to show suggestions
  -- <tab> to go to next suggestions
  -- <s-tab> to go to previous
  -- <cr> to insert selected suggestion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    enabled = function()
      local in_prompt = vim.api.nvim_buf_get_option(0, "buftype") == "prompt"
      if in_prompt then -- this will disable cmp in the Telescope window (taken from the default config)
        return false
      end
      local context = require("cmp.config.context")
      return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
    end,
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Right>"] = cmp.mapping(function(fallback)
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          -- elseif require("copilot.suggestion").is_visible() then
          --   require("copilot.suggestion").accept()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
