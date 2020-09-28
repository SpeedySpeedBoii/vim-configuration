let mapleader = " "

" map CapsLock to Esc. This is on you!
" $ setxkbmap -option caps:escape

" Delete search marks.
nnoremap <Leader>h :noh<CR>

" Insert newline below cursor.
nnoremap <Leader>o mzo<Esc>`z

" Copy till end of line.
nnoremap Y y$

" Comfortable navigation in ctrl-n results.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Move between tabs with Ctrl-n and Ctrl-p
nnoremap <C-n> gt
nnoremap <C-p> gT

" Create an close tabs
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>T :tabclose<CR>

" Paste without cutting in visual mode
vnoremap p pgvy

" Makes it easier to select lines and shift them multiple times.
vnoremap > >gv
vnoremap < <gv

" Go to next tag
nnoremap <Leader>] :tn<CR>

nnoremap <Leader>q :cn<CR>
nnoremap <Leader>Q :cp<CR>

" Easy movement in insert mode
inoremap <C-h> <C-Left>
inoremap <C-l> <C-Right>
inoremap <C-j> <Left>
inoremap <C-k> <Right>

" Search for the current selection with * and # in visual mode.
function! s:VSetSearch()
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

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

" Toggle quickfix list
nmap <silent> <leader>E :call ToggleList("Quickfix List", 'c')<CR>
