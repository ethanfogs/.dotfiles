function! CommentLine(linenr=line('.'))
    let l:cmt_str = &commentstring->substitute('%s', '', 'g')
    call setline(a:linenr, l:cmt_str . getline(a:linenr))
endfunction

function! UnCommentLine(linenr=line('.'))
    let l:cmt_str = &commentstring->substitute('%s', '', 'g')
    let l:new_str = getline(a:linenr)
                \ ->substitute('\v^(\s*)' . l:cmt_str, '\1', 'g')
    call setline(a:linenr, l:new_str)
endfunction

function CommentLines(start=line('.'), end=line('.'))
    let l:cmt_str = &commentstring->substitute('%s', '', 'g')

    let l:start = type(a:start) == 1 ? line(a:start) : a:start
    let l:end   = type(a:end)   == 1 ? line(a:end)   : a:end

    let l:lines = { 'all': getline(l:start, l:end) }
    let l:lines.commented = []
    let l:lines.uncommented = []
    let l:lines.null = []

    for l:i in range(l:start, l:end)
        if getline(l:i) == ""
            call add(l:lines.null, l:i)
        elseif (len(matchstr(getline(l:i), '^\s*' . l:cmt_str)) == 0)
            call add(l:lines.uncommented, l:i)
        else
            call add(l:lines.commented, l:i)
        endif
    endfor

    if len(l:lines.commented) >= len(l:lines.uncommented)
        let l:Func = function('UnCommentLine')
        let l:target_lines = l:lines.commented
    else
        let l:Func = function('CommentLine')
        let l:target_lines = l:lines.uncommented
    endif

    for l:linenr in l:target_lines
        call l:Func(l:linenr)
    endfor
endfunction
