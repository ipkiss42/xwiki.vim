" This ftplugin provides syntax highlighting for blocks of code surrounded
" with {{code language="..."}} tags. It also provides folding for sections.
"
" By default, only languages present in the current buffer are highlighted.
" You can customize this behavior by defining a few variables in your .vimrc:
"
"   g:xwiki_filetype_highlighting
"       If set to 0, highlighting in the "{{code}}" tag will be disabled.
"       Example:
"           let g:xwiki_filetype_highlighting = 0
"       Default: 1
"
"   g:xwiki_forced_wikilang
"       List of XWiki languages for which highlighting should always be
"       loaded, even if there is no corresponding tag in the current buffer.
"       Example:
"           let g:xwiki_forced_wikilang = ['sql', 'java', 'bash']
"       Default: []
"       Note: Forcing many languages can slow down the opening of xwiki
"       files. If you often use various languages, it may be better to keep
"       the default values, and reload the buffer from time to time with :e
"
"   g:xwiki_ignored_wikilang
"       List of XWiki languages for which no syntax highlighting is desired.
"       If a language is both forced and ignored, it will be ignored.
"       Example:
"           let g:xwiki_ignored_wikilang = ['perl']
"       Default: []
"
"   g:xwiki_wikilang_to_vim_overrides
"       Dictionary allowing to overrides the default language mappings.
"       The key of the dictionary is a XWiki language, and the value is a Vim
"       filetype.
"       Example:
"           let g:xwiki_wikilang_to_vim_overrides = {
"                   \ 'bash': 'zsh',
"                   \ 'some_other_language': 'foobar',
"                   \ }
"       Default: {}
"
"   g:xwiki_folding
"       If set to 0, skip the syntax specific folding
"       Example:
"           let g:xwiki_folding = 0
"       Default: 1

" Set default values
if !exists('g:xwiki_filetype_highlighting')
    let g:xwiki_filetype_highlighting = 1
endif
if !exists('g:xwiki_ignored_wikilang')
    let g:xwiki_ignored_wikilang = []
endif
if !exists('g:xwiki_forced_wikilang')
    let g:xwiki_forced_wikilang = []
endif
if !exists('g:xwiki_wikilang_to_vim_overrides')
    let g:xwiki_wikilang_to_vim_overrides = {}
endif
if !exists('g:xwiki_folding')
    let g:xwiki_folding = 1
endif

if g:xwiki_filetype_highlighting != 0
    " Define autogroups at most once
    let g:xwiki_filetype_highlighting = 0

    augroup xwiki
        autocmd!
        autocmd Syntax xwiki call xwiki#PerformHighlighting()
    augroup END
endif

if g:xwiki_folding != 0
    " Fold by section
    setlocal foldmethod=expr
    setlocal foldexpr=XwikiFold(v:lnum)

    function! XwikiFold(lnum)
        let line = getline(a:lnum)
        if line =~ '^======'
            return ">6"
        elseif line =~ '^====='
            return ">5"
        elseif line =~ '^===='
            return ">4"
        elseif line =~ '^==='
            return ">3"
        elseif line =~ '^=='
            return ">2"
        elseif line =~ '^='
            return ">1"
        endif
        return "="
    endfunction
endif

