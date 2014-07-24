set nocompatible

set autoindent
set tabstop=4
set shiftwidth=4

set history=1000 "Remembers last 1000 commands

set wildmode=list:longest "Completion of commands using tab like bash and also shows options.

"Turn on line numbering. Turn it off with "set nonu" 
set number

" Set syntax on
syntax on

" Case insensitive search
set ignorecase " Until there is a capital
set smartcase " *-style search will be case-sensitive

" Higlhight search
set hls

" To disable search highlight after use using esc (Causes problems with arrow keys)
" nnoremap <Esc> :noh<return><esc> 

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" autocomplete parenthesis, brackets and braces
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
	     
" autocomplete quotes
inoremap	'  '<Esc>:call QuoteInsertionWrapper("'")<CR>a
inoremap	"  "<Esc>:call QuoteInsertionWrapper('"')<CR>a
inoremap	`  `<Esc>:call QuoteInsertionWrapper('`')<CR>a
				   
function! QuoteInsertionWrapper (quote)
	let col = col('.')
	if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
		normal ax
		exe "normal r".a:quote."h"
	end
endfunction

"Change modes using jj 
imap jj <Esc>

""""""""""""""""""""""""HTML"""""""""""""""""""""""
""""""" Basic html boilerplate for starting a file
imap ;ht<CR> <!DOCTYPE html><CR><CR><html><CR><c-t><head><CR><c-t><title></title><CR><c-d></head><CR><body><CR><CR></body><CR><c-d></html><Up><Up><Up><Up><Up><Right><Right><Right><Right><Right><Right><Right><Right>

""""""" HTML Tags completion
inoremap <> <><left>
inoremap %% %%<left>
inoremap <strong> <strong></strong><left><left><left><left><left><left><left><left><left>
inoremap <li> <li></li><left><left><left><left><left>
inoremap <p> <p></p><left><left><left><left>
inoremap <h1> <h1></h1><left><left><left><left><left>
inoremap <ul> <ul><CR><CR></ul><Up>
inoremap {e {% extends '' %}<left><left><left><left>
inoremap {b {% block  %}<left><left><left>
inoremap {eb {% endblock %}
inoremap {l {% load static %}
inoremap {ei {% endif %}
inoremap {ef {% endfor %}
inoremap ;rr return render(request, '')<left><left>
"" Html Comments
inoremap ;htc <!-- --><left><left><left>		

""""""""""""""""""""""""Tabs Manouvre"""""""""""""""""""""""" 
" Go to previous or next tab
nnoremap <C-Left> :tabprevious<CR> 
nnoremap <C-Right> :tabnext<CR>
" Move the current tab left or right
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>)''))''

" Commenting out lines
vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>
