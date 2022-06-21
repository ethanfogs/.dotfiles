------------------------------------------------------------------------------

vim.o['completeopt'] = 'menu,menuone,noselect'

------------------------------------------------------------------------------

local cmp = require('cmp')
    local config = cmp.config
    local mapping = cmp.mapping

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    window = {
        completion = config.window.bordered(),
        bordered = config.window.bordered()
    },
    --[[
    mappings = {
        ['<C-e>'] = mapping({
          i = mapping.abort(),
          c = mapping.close(),
        }),
        ['<C-d>'] = mapping(mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = mapping(mapping.scroll_docs(4), { 'i', 'c' }),
    },
    ]]--
    sources = config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'luasnip' },
    }, {
        { name = 'buffer' }
    })
})

------------------------------------------------------------------------------

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

------------------------------------------------------------------------------

--[[
cmp.setup({
    mappings = {
        ['<Tab>'] = cmp.mapping.complete({
            config = {
                sources = {
                    { name = 'nvim_lsp' },
               }
            }
        })
    }
})

------------------------------------------------------------------------------

cmp.setup({
    mappings = {
        ['<Home>'] = mapping(mapping.select_prev_item(), { 'i', 'c' }),
        ['<End>'] = mapping(mapping.select_next_item(), { 'i', 'c' }),
    }
})

cmp.setup({
    mappings = {
        ['<End>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end
    }
})

------------------------------------------------------------------------------

cmp.setup.filetype('gitcommit', {
    sources = config.sources({
        { name = 'cmp_git' },
    }, {
        { name = 'buffer' },
    })
})
--]]

------------------------------------------------------------------------------

local lspkind = require('lspkind')
    lspkind.init()
