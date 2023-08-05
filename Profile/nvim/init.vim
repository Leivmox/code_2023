


"# 输入以下内容, 保存退出
call plug#begin()

" 彩虹括号
Plug 'luochen1990/rainbow'
"高亮显示光标所在的单词
Plug 'itchyny/vim-cursorword'
"coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"UltiSnips（自定义补全代码块）
Plug 'SirVer/ultisnips'


"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"括号补充
"Plug 'ajh17/VimCompletesMe'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }



call plug#end()
"let g:coc_global_extensions = ['coc-tsserver']

"括号补充配置
"let g:deoplete#sources#delimiter = {}
"let g:deoplete#sources#delimiter.enable = ['vim', 'tex', 'plaintex']
"let g:deoplete#enable_auto_complete = v:true
"let g:deoplete#auto_complete_delay = 50

"let g:UltiSnipsExpandTrigger="<C-j>"
"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-k>"




set number
set nocompatible
syntax on
set showmode
set t_Co=256
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"鼠标移动光标
set mouse=a


"nipsSnippetDirectories=["UltiSnips"]

" 设置 Java 文件中的颜色
augroup javahighlight
  autocmd!
  autocmd ColorScheme * highlight javaComment ctermfg=green
  autocmd ColorScheme * highlight javaKeyword ctermfg=blue
  autocmd ColorScheme * highlight javaStorageClass ctermfg=blue
augroup END


