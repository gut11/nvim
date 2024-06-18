-- See {*** Options} for more options

M.config = function ()
  require("neorg").setup({
    load = {
      ["external.templates"] = {
        -- templates_dir = vim.fn.stdpath("config") .. "/templates/norg",
        -- default_subcommand = "add", -- or "fload", "load"
        -- keywords = { -- Add your own keywords.
        --   EXAMPLE_KEYWORD = function ()
        --     return require("luasnip").insert_node(1, "default text blah blah")
        --   end,
        -- },
        -- snippets_overwrite = {},
      }
    }
  })
end
