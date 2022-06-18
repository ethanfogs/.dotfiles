function! SendToTerm(cmd='')
    let l:term_buf = getbufinfo()->filter('v:val.variables->has_key("terminal_job_id")')[0]
    call chansend(l:term_buf.variables.terminal_job_id, ["clear; ","ls", ""])
endfunction
