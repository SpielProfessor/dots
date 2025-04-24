-- L S P   C O N F I G U R A T I O N --
local lspconfig = require("lspconfig")

-- Setup nvim-cmp
local cmp = require("cmp")
local lspkind = require('lspkind')
local cmp_nvim_lsp = require("cmp_nvim_lsp")
require('cmp_colors');
cmp.setup({
  snippet = {
    expand = function(args)
      --vim.fn["luasnip#anonymous"](args.body) -- Use vsnip or change to luasnip, etc.
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "calc" },
    { name = "crates" },
    { name = 'nerdfont' },
    { name = 'buffer' },
  }),

  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
})

local capabilities = cmp_nvim_lsp.default_capabilities()

-- rust analyzer
lspconfig.rust_analyzer.setup({capabilities=capabilities}) 
-- C
lspconfig.clangd.setup({capabilities=capabilities})

-- indent blankline
require("ibl").setup()
