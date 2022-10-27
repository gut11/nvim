local lsps = require("plugins.lsps").list


require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lsps,
	automatic_installation = true,
})
