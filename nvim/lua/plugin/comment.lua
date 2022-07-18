 require('Comment').setup({
     pre_hook = function(ctx)
         local util   = require('Comment.utils')
         local ts_ctx = require('ts_context_commentstring.utils')

         local location = nil

         if(ctx.ctype == util.ctype.block) then
            location = ts_ctx.get_cursor_location()
        elseif((ctx.cmotion == util.cmotion.v) or (ctx.cmotion == util.cmotion.V)) then
            location = ts_ctx.get_visual_start_location()
         end
         return require('ts_context_commentstring.internal').calculate_commentstring({
             key = ((ctx.ctype == util.ctype.line) and "__default" or "_multiline"),
             location = location
         })
     end,
 })
