local cmp     = require('cmp')
local luasnip = require('luasnip')

require('luasnip/loaders/from_vscode').lazy_load()

cmp.config_opts = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
}

function cmp.mapping.smart_select_prev(fallback)
    if (cmp.visible()) then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end

function cmp.mapping.smart_select_next(fallback)
    if (cmp.visible()) then
        cmp.select_next_item()
    elseif (luasnip.expandable()) then
        luasnip.expand()
    elseif (luasnip.expand_or_jumpable()) then
        luasnip.expand_or_jump()
    else
        fallback()
    end
end

cmp.setup({
    snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    mapping = {
        ["<C-k>"]   = cmp.mapping.select_prev_item(),
        ["<C-j>"]   = cmp.mapping.select_next_item(),
        ["<C-p>"]   = cmp.mapping.select_prev_item(),
        ["<C-n>"]   = cmp.mapping.select_next_item(),
        ["<C-h>"]   = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"]   = cmp.config.disable,
        ["<C-e>"]   = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"]    = cmp.mapping.confirm({ select = true }),
        ["<Up>"]    = cmp.mapping(cmp.mapping.smart_select_prev, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.smart_select_prev, { "i", "s" }),
        ["<Tab>"]   = cmp.mapping(cmp.mapping.smart_select_next, { "i", "s" }),
        ["<Down>"]  = cmp.mapping(cmp.mapping.smart_select_next, { "i", "s" }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s", icons.kind[vim_item.kind])
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip  = "[Snippet]",
                buffer   = "[Buffer]",
                path     = "[Path]",
                cmdline  = "[CMD]",
                nvim_lua = "[NVIM-LUA]",
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        -- ORDER DETERMINES PREFERED PRECEDENCE
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    experimental = {
        ghost_text = true,
    },
    bordered = cmp.config_opts,
    completion = cmp.config_opts
})
