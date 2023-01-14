local capability   = require('configs.lsp.lspConf.utils.capability')
local lua          = require('configs.lsp.lspConf.servers.lua')
local lsp          = require('lspconfig')
local jsonls       = require('configs.lsp.lspConf.servers.jsonls')
local css          = require('configs.lsp.lspConf.servers.css')
local yaml         = require('configs.lsp.lspConf.servers.yaml')
local rust         = require('configs.lsp.lspConf.servers.rust')
local capabilities = { capabilities = capability }

-- lang, core
lsp.sumneko_lua.setup(lua) -- lua
lsp.tsserver.setup {} -- js typescript
lsp.html.setup(capabilities)
lsp.jsonls.setup(jsonls)
lsp.cssls.setup(css)
lsp.cssmodules_ls.setup {}
lsp.eslint.setup {}
require('lspconfig').yamlls.setup(yaml)
lsp.bashls.setup(capabilities)
lsp.pyright.setup {}
lsp.rust_analyzer.setup(rust)
lsp.taplo.setup {
  cmd = { "taplo", "lsp", "stdio" }
}
-- framework
lsp.astro.setup {} -- astro
