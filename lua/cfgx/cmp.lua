local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
    return
end
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' },
    {name = "crates"},
  },
})
--local cmp = require'cmp'

  --cmp.setup({
    --snippet = {
      --expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      --end,
    --},
    --window = {
       --completion = cmp.config.window.bordered(),
       --documentation = cmp.config.window.bordered(),
    --},
    --mapping = cmp.mapping.preset.insert({
      --['<C-b>'] = cmp.mapping.scroll_docs(-4),
      --['<C-f>'] = cmp.mapping.scroll_docs(4),
      --['<C-Space>'] = cmp.mapping.complete(),
      --['<C-e>'] = cmp.mapping.abort(),
      --['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --}),
    --sources = cmp.config.sources({
      --{ name = 'nvim_lsp' },
      --{ name = 'vsnip' }, -- For vsnip users.
    --}, {
      --{ name = 'buffer' },
    --})
  --})

  ---- Set configuration for specific filetype.
  --cmp.setup.filetype('gitcommit', {
    --sources = cmp.config.sources({
      --{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    --}, {
      --{ name = 'buffer' },
    --})
  --})

  ---- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline('/', {
    --mapping = cmp.mapping.preset.cmdline(),
    --sources = {
      --{ name = 'buffer' }
    --}
  --})

  ---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline(':', {
    --mapping = cmp.mapping.preset.cmdline(),
    --sources = cmp.config.sources({
      --{ name = 'path' }
    --}, {
      --{ name = 'cmdline' }
    --})
  --})

  ---- Setup lspconfig.
  --local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  ---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --capabilities = capabilities
  --}
