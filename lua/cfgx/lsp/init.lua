----M = {}
--local status_ok, _ = pcall(require, "lspconfig")
--if not status_ok then
  --return
--end
----M.server_capabilities = function()
  ----local active_clients = vim.lsp.get_active_clients()
  ----local active_client_map = {}

  ----for index, value in ipairs(active_clients) do
    ----active_client_map[value.name] = index
  ----end

  ----vim.ui.select(vim.tbl_keys(active_client_map), {
    ----prompt = "Select client:",
    ----format_item = function(item)
      ----return "capabilites for: " .. item
    ----end,
  ----}, function(choice)
    ------ print(active_client_map[choice])
    ------ print(vim.inspect(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities.executeCommandProvider))
    ----vim.pretty_print(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities)
  ----end)
----end


--require "cfgx.lsp.lsp-signature"
--require "cfgx.lsp.servers"
--require("cfgx.lsp.handlers").setup()
--require "cfgx.lsp.null-ls"
----return M

local present, lspconfig = pcall(require, "lspconfig")
if not present then
   return
end

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local vim_version = vim.version()

   if vim_version.minor > 7 then
      -- nightly
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
   else
      -- stable
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
   end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

--lspconfig.golangci_lint_ls.setup{
    --capabilities = capabilities,
    --on_attach = on_attach,
    --flags = lsp_flags,
--}

lspconfig.gopls.setup{
	cmd = {'gopls'},
      settings = {
        gopls = {
          analyses = {
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          experimentalPostfixCompletions = true,
          gofumpt = true,
          staticcheck = true,
          usePlaceholders = true,
        },
      },
	on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.tsserver.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

local rs_opts = {
  -- rust-tools options
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
      },
    },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
  -- https://rust-analyzer.github.io/manual.html#features
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importEnforceGranularity = true,
          importPrefix = "crate"
          },
        cargo = {
          allFeatures = true
          },
        checkOnSave = {
          -- default: `cargo check`
          command = "clippy"
          },
        },
        inlayHints = {
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true
          },
        },
      }
    },
}
require('rust-tools').setup(rs_opts)

lspconfig.yamlls.setup {
-- other configuration for setup {}
    capabilities = capabilities,
  settings = {
    yaml = {
      -- other settings. note this overrides the lspconfig defaults.
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/kustomization.json"] = "kustomize.yaml",
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
        ["https://raw.githubusercontent.com/istio/api/master/kubernetes/customresourcedefinitions.gen.yaml"] = "gateway.yaml", "virtualservice.yaml", "vscv.yaml", "gw.yaml",
      },
    },
  }
}

lspconfig.vimls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags= lsp_flags,
}

lspconfig.jsonls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags= lsp_flags,
}

lspconfig.dockerls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags= lsp_flags,
}

lspconfig.sqlls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags= lsp_flags,
}

lspconfig.bashls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags= lsp_flags,
}
