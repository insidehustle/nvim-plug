local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
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
require('lspconfig')['golangci_lint_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['gopls'].setup{
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
}
--require('lspconfig')['gopls'].setup{
    --on_attach = on_attach,
    --flags = lsp_flags,
--}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
local opts = {
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
require('rust-tools').setup(opts)
--require('lspconfig')['rust_analyzer'].setup{
    --on_attach = on_attach,
    --flags = lsp_flags,
    ---- Server-specific settings...
    --settings = {
            --["rust-analyzer"] = {
                ---- enable clippy on save
                --checkOnSave = {
                    --command = "clippy"
                --},
            --}
    --}
--}
--require('rust-tools').setup({})
------ set inlay hints
--require('rust-tools.inlay_hints').set_inlay_hints()
--require'rust-tools.hover_actions'.hover_actions()
require'lspconfig'.sumneko_lua.setup {
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

require('lspconfig').yamlls.setup {
-- other configuration for setup {}
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
require('lspconfig')['vimls'].setup{
    on_attach = on_attach,
    flags= lsp_flags,
}
require('lspconfig')['jsonls'].setup{
    on_attach = on_attach,
    flags= lsp_flags,
}
require('lspconfig')['dockerls'].setup{
    on_attach = on_attach,
    flags= lsp_flags,
}
require('lspconfig')['sqlls'].setup{
    on_attach = on_attach,
    flags= lsp_flags,
}

require('lspconfig')['bashls'].setup{
    on_attach = on_attach,
    flags= lsp_flags,
}
