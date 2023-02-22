require("null-ls").setup {
    sources = {
      require("null-ls").builtins.formatting.prettier.with {
        args = {
          "--tab-width 4",
        },
      },
    },
  }
