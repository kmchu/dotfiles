-- Reference .vimrc
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Set completeopt for desired menu behavior
--vim.opt.completeopt = "menu,menuone,noselect"

-- Set up nvim-cmp
local cmp = require('cmp')

cmp.setup({
  -- Configure snippet support if using a snippet engine
  snippet = {
    expand = function(args)
        vim.snippet.expand(args.body)
    end,
  },

  -- Define key mappings for navigation and actions
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Select previous item
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Select next item
    ['<C-j>'] = cmp.mapping.complete(),     -- Trigger completion manually
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    ['<C-e>'] = cmp.mapping.abort(),            -- Abort completion
  }),

  -- Configure sources for completion results
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- LSP completion
    { name = 'pandoc_references' }, 
  }),
})

-- Get default LSP capabilities and pass them to LSP servers for nvim-cmp integration
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP setup
-- vim.lsp.config("marksman", {
--   on_attach = LspOnAttach,
--   capabilities = LspCapabilities,
-- })
-- vim.lsp.enable({marksman, html, cssls, ts_ls})
-- LSP setup
vim.lsp.config('marksman', {
  on_attach = LspOnAttach,
  capabilities = LspCapabilities,
})
vim.lsp.enable({"marksman", "html", "cssls", "ts_ls"})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
