" Here is a list of supported Pygments short names:
" http://pygments.org/docs/lexers/
let s:xwiki_wikilang_to_vim = {
            \ 'abap': 'abap',
            \ 'ada': 'ada',
            \ 'ada95': 'ada',
            \ 'ampl': 'ampl',
            \ 'antlr': 'antlr',
            \ 'apache': 'apache',
            \ 'arduino': 'arduino',
            \ 'asm': 'asm',
            \ 'autohotkey': 'autohotkey',
            \ 'autoit': 'autoit',
            \ 'awk': 'awk',
            \ 'bash': 'sh',
            \ 'basic': 'basic',
            \ 'bat': 'dosbatch',
            \ 'batch': 'dosbatch',
            \ 'bc': 'bc',
            \ 'bib': 'bib',
            \ 'bibtex': 'bib',
            \ 'bsdmake': 'make',
            \ 'bst': 'bst',
            \ 'c#': 'cs',
            \ 'c': 'c',
            \ 'c++': 'cpp',
            \ 'cfg': 'dosini',
            \ 'chai': 'chaiscript',
            \ 'chaiscript': 'chaiscript',
            \ 'cheetah': 'cheetah',
            \ 'cl': 'lisp',
            \ 'clean': 'clean',
            \ 'clipper': 'clipper',
            \ 'clj': 'clojure',
            \ 'clojure': 'clojure',
            \ 'cmake': 'cmake',
            \ 'cobol': 'cobol',
            \ 'common-lisp': 'lisp',
            \ 'cpp': 'cpp',
            \ 'csh': 'csh',
            \ 'csharp': 'csharp',
            \ 'css': 'css',
            \ 'cucumber': 'cucumber',
            \ 'cuda': 'cuda',
            \ 'd': 'd',
            \ 'debcontrol': 'debcontrol',
            \ 'debsources': 'debsources',
            \ 'diff': 'diff',
            \ 'django': 'django',
            \ 'dosbatch': 'dosbatch',
            \ 'dosini': 'dosini',
            \ 'dtd': 'dtd',
            \ 'dylan': 'dylan',
            \ 'dylan-lid': 'dylanlid',
            \ 'eiffel': 'eiffel',
            \ 'erlang': 'erlang',
            \ 'forth': 'forth',
            \ 'fortran': 'fortran',
            \ 'foxpro': 'foxpro',
            \ 'gnuplot': 'gnuplot',
            \ 'go': 'go',
            \ 'groff': 'groff',
            \ 'groovy': 'groovy',
            \ 'haml': 'haml',
            \ 'haskell': 'haskell',
            \ 'html': 'html',
            \ 'html+cheetah': 'htmlcheetah',
            \ 'html+django': 'htmldjango',
            \ 'htmlcheetah': 'htmlcheetah',
            \ 'htmldjango': 'htmldjango',
            \ 'idl': 'idl',
            \ 'ini': 'dosini',
            \ 'j': 'j',
            \ 'java': 'java',
            \ 'javascript': 'javascript',
            \ 'jproperties': 'jproperties',
            \ 'js': 'javascript',
            \ 'json': 'json',
            \ 'jsp': 'jsp',
            \ 'kconfig': 'kconfig',
            \ 'ksh': 'sh',
            \ 'latex': 'tex',
            \ 'less': 'less',
            \ 'liquid': 'liquid',
            \ 'lisp': 'lisp',
            \ 'logtalk': 'logtalk',
            \ 'lsl': 'lsl',
            \ 'lua': 'lua',
            \ 'make': 'make',
            \ 'makefile': 'make',
            \ 'man': 'man',
            \ 'mason': 'mason',
            \ 'matlab': 'matlab',
            \ 'mf': 'make',
            \ 'mma': 'mma',
            \ 'modula2': 'modula2',
            \ 'moo': 'moo',
            \ 'moocode': 'moo',
            \ 'mupad': 'mupad',
            \ 'mysql': 'mysql',
            \ 'nasm': 'nasm',
            \ 'nroff': 'nroff',
            \ 'nsis': 'nsis',
            \ 'obj-c': 'objc',
            \ 'obj-c++': 'objcpp',
            \ 'objc': 'objc',
            \ 'objc++': 'objcpp',
            \ 'objective-c': 'objc',
            \ 'objective-c++': 'objcpp',
            \ 'objectivec': 'objc',
            \ 'objectivec++': 'objcpp',
            \ 'ocaml': 'ocaml',
            \ 'pascal': 'pascal',
            \ 'perl': 'perl',
            \ 'perl6': 'perl6',
            \ 'php': 'php',
            \ 'php3': 'php',
            \ 'php4': 'php',
            \ 'php5': 'php',
            \ 'pike': 'pike',
            \ 'po': 'po',
            \ 'postscr': 'postscr',
            \ 'postscript': 'postscr',
            \ 'pov': 'pov',
            \ 'progress': 'progress',
            \ 'prolog': 'prolog',
            \ 'proto': 'proto',
            \ 'protobuf': 'proto',
            \ 'py': 'python',
            \ 'py3': 'python',
            \ 'python': 'python',
            \ 'python3': 'python',
            \ 'r': 'r',
            \ 'registry': 'registry',
            \ 'rnc': 'rnc',
            \ 'rng-compact': 'rnc',
            \ 'rst': 'rst',
            \ 'ruby': 'ruby',
            \ 'rust': 'rust',
            \ 'sage': 'python',
            \ 'sas': 'sas',
            \ 'sass': 'sass',
            \ 'scala': 'scala',
            \ 'scheme': 'scheme',
            \ 'scilab': 'scilab',
            \ 'scss': 'scss',
            \ 'sh': 'sh',
            \ 'shell': 'sh',
            \ 'sml': 'sml',
            \ 'snobol': 'snobol4',
            \ 'spec': 'spec',
            \ 'sql': 'sql',
            \ 'squid': 'squid',
            \ 'squid.conf': 'squid',
            \ 'squidconf': 'squid',
            \ 'st': 'st',
            \ 'tads3': 'tads',
            \ 'tasm': 'tasm',
            \ 'tcl': 'tcl',
            \ 'tcsh': 'tcsh',
            \ 'teraterm': 'teraterm',
            \ 'terminfo': 'terminfo',
            \ 'tex': 'tex',
            \ 'treetop': 'treetop',
            \ 'udiff': 'diff',
            \ 'vb.net': 'vb',
            \ 'vbnet': 'vb',
            \ 'verilog': 'verilog',
            \ 'vim': 'vim',
            \ 'wdiff': 'wdiff',
            \ 'winbatch': 'dosbatch',
            \ 'xml': 'xml',
            \ 'xq': 'xquery',
            \ 'xql': 'xquery',
            \ 'xqm': 'xquery',
            \ 'xquery': 'xquery',
            \ 'xqy': 'xquery',
            \ 'xslt': 'xslt',
            \ 'xwiki': 'xwiki',
            \ 'yaml': 'yaml',
            \ 'zsh': 'zsh'
            \ }

function! xwiki#FindLanguagesInBuffer()
    let save_cursor = getpos('.')
    let languagesDict = {}
    call cursor('$', 1)
    let flags = 'w'
    while search('{{code\s\+language="\?', flags) > 0
        " Assumes there is only one match per line
        let lang = substitute(getline('.'), '.*{{code\s\+language="\?\(\w\+\).*', '\1', '')
        let languagesDict[lang] = 1
        " Do not wrap search anymore
        let flags = 'W'
    endwhile
    call setpos('.', save_cursor)
    return keys(languagesDict)
endfunction

" Include the syntax file for the given filetype
function! xwiki#IncludeSyntax(filetype, groupName)
    " Most syntax files no nothing if b:current_syntax is defined.
    " Make sure to unset it.
    if exists('b:current_syntax')
        let b:saved_current_syntax = b:current_syntax
        unlet b:current_syntax
    endif

    exe 'syntax include @' . a:groupName . ' syntax/' . a:filetype . '.vim'

    " Restore b:current_syntax
    if exists('b:saved_current_syntax')
        let b:current_syntax = b:saved_current_syntax
        unlet b:saved_current_syntax
    elseif exists('b:current_syntax')
        unlet b:current_syntax
    endif
endfunction

" Define the highlighted region. Must be called after IncludeSyntax()
function! xwiki#DefineRegion(filetype, groupName, wikiLang)
    let macroStartTagName = 'xwiki_' . a:filetype . '_CodeMacroStartTag'
    " Using 'nextgroup' avoids that the {{code}} opening tag gets highlighted
    " with the given filetype
    exe 'syntax match ' . macroStartTagName .
                \ ' "{{code\>[^}]*}}" contained contains=xwikiMacroTag ' .
                \ 'nextgroup=' . a:groupName
    exe 'syntax region xwiki_' . a:filetype . '_region ' .
                \ "start='{{code\\s\\+language=\\(\"\\)\\?" . a:wikiLang . "\\1[^}]*}}' " .
                \ "end='{{/code}}'me=s-1 " .
                \ "keepend contains=" . macroStartTagName . ",@" . a:groupName
    " Re-define groups that may be overridden by the syntax file
    " This one is overridden by the HTML file (since it defines a tag), and
    " any other file which includes it indirectly (e.g. the Java one)
    exe 'syntax region xwikiHtmlPre start="<pre\>[^>]*>" end="</pre>"me=s-1 ' .
                \ "contained contains=xwikihtmlPreTag"
endfunction

" Perform highlighting for a given wiki language
function! xwiki#HighlightWikiLang(wikiLang, filetype, alreadyIncludedFt)
    let groupName = a:filetype . '_group'

    " Include syntax file, if not yet included
    if !has_key(a:alreadyIncludedFt, a:filetype)
        call xwiki#IncludeSyntax(a:filetype, groupName)
        let a:alreadyIncludedFt[a:filetype] = 1
    endif

    call xwiki#DefineRegion(a:filetype, groupName, a:wikiLang)
endfunction

" Perform highlighting
function! xwiki#PerformHighlighting()
    " Apply user overrides
    call extend(s:xwiki_wikilang_to_vim, g:xwiki_wikilang_to_vim_overrides)

    " Convert list into a dict
    let ignoredDict = {}
    for wikiLang in g:xwiki_ignored_wikilang
        let ignoredDict[wikiLang] = 1
    endfor

    let alreadyIncludedFt = {}
    " Load languages
    for wikiLang in xwiki#FindLanguagesInBuffer() + g:xwiki_forced_wikilang
        if has_key(ignoredDict, wikiLang)
            continue
        endif

        " Get corresponding filetype
        if !has_key(s:xwiki_wikilang_to_vim, wikiLang)
            let msg = 'Warning: no filetype mapped to wiki language "' . wikiLang . '"'
            echohl WarningMsg | echom msg | echohl None
            continue
        endif
        let ft = s:xwiki_wikilang_to_vim[wikiLang]

        call xwiki#HighlightWikiLang(wikiLang, ft, alreadyIncludedFt)
    endfor
endfunction

