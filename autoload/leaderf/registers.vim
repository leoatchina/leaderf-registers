function! leaderf#registers#source(args) abort
    if has('nvim')
        let reg_lst = split(execute('registers'), '\n')
    else
        redir => reg
        silent registers
        redir END
        let reg_lst = split(reg, '\n')
    endif
    if reg_lst[0][0:3] == 'Type'
        let cut_head = 1
    else
        let cut_head = 0
    endif
    let lst = []
    for reg in reg_lst[1:]
        if cut_head
            let reg = reg[6:]
        endif
        " show only 80
        let reg = reg[:80]
        if reg[0] =~ '+'
            call insert(lst, reg, 0)
        elseif reg[0] =~ '*'
            call insert(lst, reg, 0)
        else
            call add(lst, reg)
        endif
    endfor
    return lst
endfunction

function! leaderf#registers#getreg(line, args) abort
    let args = a:args
    let reg = a:line[0]
    if has_key(args, '--visual') || has_key(args, '-V')
        let cmd = 'gv"' . reg
    else
        let cmd = '"' . reg
    endif
    if has_key(args, '--append') || has_key(args, '-A')
        let cmd = cmd . 'p'
    else
        let cmd = cmd . 'P'
    endif
    call feedkeys(cmd)
endfunction

function! leaderf#registers#preview(orig_buf_nr, orig_cursor, line, args) abort
    " TODO preview selected registers
    " pass
endfunction
