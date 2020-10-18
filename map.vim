" mapleader {{{
let mapleader = " "
" }}}

" map CapsLock to Esc. This is on you!
" $ setxkbmap -option caps:escape

" Delete search marks. {{{
nnoremap <Leader>h :noh<CR>
" }}}

" Insert newline below cursor. {{{
nnoremap <Leader>o mzo<esc>`z
" }}}

" Copy till end of line. {{{
nnoremap Y y$
" }}}

" Comfortable navigation in ctrl-n results. {{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" }}}

" Move between tabs with Ctrl-n and Ctrl-p {{{
nnoremap <C-n> gt
nnoremap <C-p> gT
" }}}

" Create and close tabs {{{
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>T :tabclose<CR>
" }}}

" Paste without cutting in visual mode {{{
vnoremap p pgvy
" }}}

" Delete trailing white spaces {{{
map <silent> <Leader>rs :%s/\v\s+$//g<cr>:noh<cr>
" }}}

" Easy shifting in visual mode {{{
vnoremap > >gv
vnoremap < <gv
" }}}

" Navigation between tags and in quickfix list. {{{
nnoremap <Leader>] :tn<CR>

nnoremap <Leader>q :cn<CR>
nnoremap <Leader>Q :cp<CR>
" }}}

" Easy movement in insert and command mode {{{
inoremap <C-h> <C-Left>
inoremap <C-l> <C-Right>
inoremap <C-j> <Left>
inoremap <C-k> <Right>
cnoremap <C-h> <C-Left>
cnoremap <C-l> <C-Right>
cnoremap <C-j> <Left>
cnoremap <C-k> <Right>
" }}}

" Search for the current selection with * and # in visual mode. {{{
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
" }}}

" Quit and Write typos {{{
:command Q q
:command Qa qa
:command QA qa
:command W w
:command Wa wa
:command WA wa
:command Wq wq
:command WQ wq
:command Wqa wqa
:command WQa wqa
:command WQA wqa
" }}}

" Toggle quickfix list {{{
nmap <silent> <leader>E :call ToggleList("Quickfix List", 'c')<CR>
" }}}

" Grep operator mappings {{{
nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>
" }}}

" Paste new statuses {{{
nnoremap <silent> <Leader>ps :execute "call PasteNewStatuses()"<cr>
" }}}

" Split arguments multiple lines {{{
nnoremap <Leader>s :execute "call SplitArgumentsMultipleLines()"<cr>
" }}}

" Coc maps {{{
nmap <silent> <Leader>jd <Plug>(coc-definition)
nmap <silent> <Leader>js <Plug>(coc-declaration)
nmap <silent> <Leader>jr <Plug>(coc-references-used)
nmap <silent> <Leader>w <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>W <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>rn <Plug>(coc-rename)
" }}}

" Functions {{{
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

function! s:VSetSearch()
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[y`]
    else
        return
    endif

    execute "grep! -r " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register
endfunction

function! PasteNewStatuses()
    let s:file = input('File to copy from: ')
    if !filereadable(s:file)
        echo "\nFile doesn't exist!"
        return
    endif

    let s:pattern = input('Pattern: ')

    execute "grep! -o -e '" . s:pattern . "' " . s:file
    let s:matches = getqflist()
    let s:string_to_paste = ""
    let s:match_history = []

    for s:current_match in s:matches
        let s:match_text = s:current_match['text']
        if -1 == index(s:match_history, s:match_text)
            call add(s:match_history, s:match_text)

            if 0 == search(s:match_text, 'nw')
                let s:string_to_paste = s:string_to_paste . s:match_text . ",\n"
            endif

        endif
    endfor

    let s:register_save = @a
    let @a = s:string_to_paste
    normal! "ap
    let @a = s:register_save

endfunction

function! SplitArgumentsMultipleLines()
    let s:line = trim(getline('.'))
    if count(s:line, ',') <= 1
        return
    endif

    normal! $F)%
    let s:parenthesis_column = col('.')
    let s:newline_with_indent = ",\n" . repeat(" ", s:parenthesis_column)
    let s:new_text = substitute(s:line, ",\ *", s:newline_with_indent, "g") . "\n"

    let s:register_save = @a
    let @a = s:new_text
    normal! "_dd"aP==
    let @a = s:register_save
endfunction
" }}}
