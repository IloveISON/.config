return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path",   -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim",         -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    vim.api.nvim_set_hl(0, "Pmenu", { bg = '#5E2750', fg = '#111111' })    -- Non-highlighted items
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = '#5E2750', fg = '#E95420' }) -- Highlighted (selected) items
    vim.api.nvim_set_hl(0, "MyNormal", { bg = '#111111', fg = '#5E2750' })
    vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = '#5E2750', fg = '#E95420' })
    vim.api.nvim_set_hl(0, "MyCursorLine", { bg = '#F5B29B', fg = '#111111' })

    -- Customize the text of the item (abbreviation)
    vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = '#E8E9EA', bg = '#5E2750' })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = '#E95420', bold = true }) -- For matched text

    -- Customize the kind of item (e.g., function, variable)
    vim.api.nvim_set_hl(0, "CmpItemKind", { fg = '#F5B29B', bg = '#111111' })

    -- Customize the menu section (from which source the completion is coming)
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = '#772953', bg = '#5E2750' })
    vim.api.nvim_set_hl(0, "MyNormalFloat", { bg = '#5E2750', fg = '#772953' })

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          border = 'rounded', -- or 'single', 'double', 'shadow', etc.
          winhighlight =
          'Normal:MyNormal,NormalFloat:MyNormalFloat,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Pmenu:Pmenu,PmenuSel:PmenuSel,CmpItemAbbr:CmpItemAbbr,CmpItemAbbrMatch:CmpItemAbbrMatch,CmpItemKind:CmpItemKind,CmpItemMenu:CmpItemMenu'
          -- winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder',
        }),
        documentation = cmp.config.window.bordered({
          border = 'rounded', -- or 'single', 'double', 'shadow', etc.
          winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder',
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" },  -- text within current buffer
        { name = "path" },    -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
