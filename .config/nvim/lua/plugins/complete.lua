local format_entry

local plugin = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- sources
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",

    -- snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- formatting
    "onsails/lspkind.nvim",
  },
  config = function(_)
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      preselect = 'None',
      completion = {
        completeopt = 'menuone,noselect',
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lsp_signature_help" },
      }),
      formatting = {
        fields = { "abbr", "menu", "kind" },
        format = lspkind.cmp_format({
          before = format_entry,
        }),
      },
    })
  end,
}

function format_entry(entry, item)
  local name = entry.source.name
  if name == "nvim_lsp" then
    name = "LSP"
  elseif name == "nvim_lua" then
    name = "nvim"
  elseif name == "nvim_lsp_signature_help" then
    name = "signature"
    item.kind = ""
  end

  item.menu = string.format("[%s]", name)

  return item
end

return plugin
