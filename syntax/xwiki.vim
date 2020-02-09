" xwiki.vim (remotely inspired by mediawiki.vim and markdown.vim)
"
" Vim syntax file
" Language: XWiki
" License: MIT
" Maintainer: This syntax file needs a maintainer in order to ship
"     with Vim. Please contact [[User:Unforgettableid]] if you want
"     to volunteer.
" Home: https://www.xwiki.org
" Last Change: 2020 Feb 09
"
" If you change this file, make sure the tests in tests/basic.xwiki still
" work properly.

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = "xwiki"
endif

syntax case ignore
if v:version >= 700
  syntax spell toplevel
endif

sy sync fromstart

" Catch all, must be defined first
" TODO: check that it doesn't slow down syntax highlighting for big
" preformatted macros
sy match xwikiPreformattedMacroText /./ contained

sy cluster xwikiTopNoBoldAndItalic contains=@Spell,xwikiLink,xwikiUnderline,xwikiStriked,xwikiMonospace,xwikiSuperscript,xwikiSubscript,xwikiSpecialChars,xwikiEscape,xwikiMultilineRegionMarker,xwikiExtraAttribute,xwikiH1,xwikiH2,xwikiH3,xwikiH4,xwikiH5,xwikiH6,xwikiTable,,xwikiListMarker,xwikiListNumberError,xwikiLineMarker,@xwikiAnyMacro
sy cluster xwikiTop contains=@xwikiTopNoBoldAndItalic,xwikiItalic,xwikiBold

sy match xwikiSpecialChars "\\\\"
sy match xwikiSpecialChars "\~\\"
sy match xwikiSpecialChars "\~/"
sy match xwikiSpecialChars "\~\["
sy match xwikiSpecialChars "\~\]"
sy match xwikiSpecialChars "\~\^"
sy match xwikiSpecialChars "\~-"
sy match xwikiSpecialChars "\~("
sy match xwikiSpecialChars "\~)"
sy match xwikiSpecialChars "\~\~"
sy match xwikiSpecialChars "\~|"

sy region xwikiItalic      start="//"   end="^$\|//"   keepend contains=@xwikiTop,xwikiItalicBold
sy region xwikiBold        start="\*\*" end="^$\|\*\*" keepend contains=@xwikiTop,xwikiBoldItalic
" We don't create all the sub-combinations for these ones, sorry...
sy region xwikiUnderline   start="__"   end="^$\|__"   keepend contains=@xwikiTop
sy region xwikiStriked     start="--"   end="^$\|--"   keepend contains=@xwikiTop
sy region xwikiMonospace   start="##"   end="^$\|##"   keepend contains=@xwikiTop
sy region xwikiSuperscript start="\^\^" end="^$\|\^\^" keepend contains=@xwikiTop
sy region xwikiSubscript   start=",,"   end="^$\|,,"   keepend contains=@xwikiTop

sy region xwikiBoldItalic start="//"    end="^$\|//"   keepend contained contains=@xwikiTopNoBoldAndItalic
sy region xwikiItalicBold start="\*\*"  end="^$\|\*\*" keepend contained contains=@xwikiTopNoBoldAndItalic

" Tables
sy region xwikiTable start="^|" end="^$" contains=xwikiTableColumn,xwikiTableColumnBold,@xwikiTop
sy match xwikiTableColumnMarker /|=\?/ contained
sy match xwikiTableColumn /|[^|]*/ contained contains=xwikiTableColumnMarker,xwikiExtraAttribute,@xwikiTop
sy match xwikiTableColumnBold /|=[^|]*/ contained contains=xwikiTableColumnMarker,xwikiExtraAttribute,@xwikiTop

sy match xwikiListNumberError /^\s*[2-9]\+\./
sy match xwikiListMarker /^\s*\*\+ /
sy match xwikiListMarker /^\s*[1*]\+\. /
sy match xwikiListMarker /^[:;]\+ /
sy match xwikiLineMarker /^-----*/

sy match xwikiMultilineRegionMarker /(((/
sy match xwikiMultilineRegionMarker /)))/
sy match xwikiQuotationMarker /^>\+ /

sy match  xwikiAttributeName /\w\+\(\s*=\)\@=/ contained
sy match  xwikiAttributeValue /=\w\+/hs=s+1 contained
sy region xwikiAttributeValue start=/="/hs=s+1 skip=/\\"/ end=/"/ contained keepend extend
sy match xwikiExtraAttributeMarker /(%/ contained
sy match xwikiExtraAttributeMarker /%)/ contained
sy region xwikiExtraAttribute start=/(%/ end=/%)/ keepend contains=xwikiExtraAttributeMarker,xwikiAttributeName,xwikiAttributeValue

" See test cases to understand the complex skip pattern
sy region xwikiH1 start="^\s*="      end="^$\|=\+" skip='(%.\{-}%)\|{{.\{-}}}' keepend contains=@xwikiTop
sy region xwikiH2 start="^\s*=="     end="^$\|=\+" skip='(%.\{-}%)\|{{.\{-}}}' keepend contains=@xwikiTop
sy region xwikiH3 start="^\s*==="    end="^$\|=\+" skip='(%.\{-}%)\|{{.\{-}}}' keepend contains=@xwikiTop
sy region xwikiH4 start="^\s*===="   end="^$\|=\+" skip='(%.\{-}%)\|{{.\{-}}}' keepend contains=@xwikiTop
sy region xwikiH5 start="^\s*====="  end="^$\|=\+" skip='(%.\{-}%)\|{{.\{-}}}' keepend contains=@xwikiTop
sy region xwikiH6 start="^\s*======" end="^$\|=\+" skip='(%.\{-}%)\|{{.\{-}}}' keepend contains=@xwikiTop

sy match xwikiLinkInternalMarker ">>" contained
sy match xwikiLinkInternalMarker "||" contained
" FIXME: not working
"sy match xwikiLinkParams "||.*" contained contains=xwikiLinkInternalMarker,xwikiAttributeName,xwikiAttributeValue
sy match xwikiLinkParams "\(||\)\@<=.\+\]\]"me=e-2 contained contains=xwikiAttributeName,xwikiAttributeValue
" The ms=e-2 trick allows highlighting [[[foo]]] correctly (i.e. with the link
" inside [ and ] characters)
sy region xwikiLink start="\[*\[\[."ms=e-2,me=e-1 end="\]\]" skip="\~\]" oneline keepend contains=xwikiLinkParams,xwikiLinkInternalMarker
sy region xwikiLink start="\w\+://" end="\W*\_s"me=s-1 oneline
sy match  xwikiLink "mailto:\S\+"
sy match  xwikiLink "image:\S\+"

sy match xwikiMacroStartMarker "{{/\?" contained
sy match xwikiMacroStartMarkerError "{{\s\+"hs=s+2 contained contains=xwikiMacroStartMarker
sy match xwikiMacroEndMarker "/\?}}" contained
sy match xwikiMacroName "\({{/\?\s*\)\@<=\w\+" contained
sy region xwikiMacroTag start="{{" end="}}" keepend contains=xwikiMacroStartMarker,xwikiMacroStartMarkerError,xwikiMacroName,xwikiAttributeName,xwikiAttributeValue,xwikiMacroEndMarker

" Detect wrong closing of some macros known to be inline.
" Must be defined after xwikiMacroTag
sy match xwikiOnelineMacroWrongClosing "}}" contained
sy region xwikiOnelineMacroBad start="{{\(toc\|documentTree\|redirect\|id\)\>" end="[^/]}}" oneline contains=xwikiMacroStartMarker,xwikiMacroName,xwikiAttributeName,xwikiAttributeValue,xwikiOnelineMacroWrongClosing

" Special behavior for known macros
" They are case sensitive to avoid (for example) that {{/Code}} is mistakenly
" used as a closing tag for {{code}}
sy case match

" Include HTML syntax
if exists("b:current_syntax") | unlet b:current_syntax | endif
sy include @xwikiHtmlSyntax syntax/html.vim

" HTML addition: highlight "<pre>" blocks like escaped text
sy match xwikiHtmlPreTag "<pre\>[^>]*>" contained contains=htmlTag
sy region xwikiHtmlPre start="<pre\>[^>]*>" end="</pre>"me=s-1 contained contains=xwikihtmlPreTag

sy match xwikiHtmlMacroStartTag "{{html\>[^}]*}}" contained contains=xwikiMacroTag
" {{html wiki="true"}} behaves the same as {{preformatted}}
" Note that negating the 'wiki=true" part is needed, otherwise for some
" reason xwikiHtmlMacro matches inside xwikiPreformattedMacro
" (via @xwikiTop -> @xwikiAnyMacro)
sy region xwikiHtmlMacro start='{{html\>\( wiki="\?true"\?\)\@![^}]*}}' end="{{/html}}"me=s-1 keepend contains=xwikiHtmlMacroStartTag,@xwikiHtmlSyntax,xwikiHtmlPre
sy region xwikiPreformattedMacro start='{{html wiki="\?true"\?}}' end="{{/html}}"me=s-1 keepend contains=xwikiHtmlMacroStartTag,xwikiPreformattedMacroText,@xwikiTop,@xwikiHtmlSyntax,xwikiHtmlPre
sy region xwikiPreformattedMacro start="{{preformatted}}" end="{{/preformatted}}"me=s-1 keepend contains=xwikiMacroTag,xwikiPreformattedMacroText,@xwikiTop,@xwikiHtmlSyntax,xwikiHtmlPre

sy match  xwikiCodeMacroStartTag "{{code\>[^}]*}}" contained contains=xwikiMacroTag
sy region xwikiCodeMacro start="{{code\>[^}]*}}" end="{{/code}}"me=s-1 keepend contains=xwikiCodeMacroStartTag

sy region xwikiCommentMacro start="{{comment\s*}}" end="{{/comment}}" keepend

" The plantuml syntax is not shipped with Vim, so it is likely missing.
" Load it silently to ignore errors.
if exists("b:current_syntax") | unlet b:current_syntax | endif
sy include @xwikiPlantumlSyntax syntax/plantuml.vim
sy region xwikiPlantumlMacro start="{{plantUML\>[^}]*}}" end="{{/plantUML}}"me=s-1 keepend contains=xwikiMacroTag,@xwikiPlantumlSyntax

if exists("b:current_syntax") | unlet b:current_syntax | endif
sy include @xwikiTexSyntax syntax/tex.vim
sy match  xwikiFormulaMacroStartTag "{{formula\s*}}" contained contains=xwikiMacroTag
sy region xwikiFormulaMacro start="{{formula\s*}}" end="{{/formula}}"me=s-1 keepend contains=xwikiFormulaMacroStartTag,@xwikiTexSyntax

" Restore case insensitive matching
sy case ignore

sy cluster xwikiAnyMacro contains=xwikiMacroTag,xwikiHtmlMacro,xwikiPreformattedMacro,xwikiCodeMacro,xwikiCommentMacro,xwikiPlantumlMacro,xwikiFormulaMacro

" Must be defined after the macros
sy region xwikiEscape start="{{{" end="}}}"

" HTML highlighting

if version < 508
  command! -nargs=+ XwikiHiLink hi link <args>
else
  command! -nargs=+ XwikiHiLink hi def link <args>
endif

" Wiki highlighting

" Note: this relies on the highlighting done in html.vim.
" Not sure if it's a good idea or not...
XwikiHiLink xwikiItalic      htmlItalic
XwikiHiLink xwikiBold        htmlBold
XwikiHiLink xwikiBoldItalic  htmlBoldItalic
XwikiHiLink xwikiItalicBold  htmlBoldItalic
XwikiHiLink xwikiUnderline   htmlUnderline
XwikiHiLink xwikiMonospace   Constant
" Use bold representation for now...
XwikiHiLink xwikiStriked     xwikiBold
XwikiHiLink xwikiSuperscript xwikiBold
XwikiHiLink xwikiSubscript   xwikiBold

XwikiHiLink xwikiH1 Title
XwikiHiLink xwikiH2 Title
XwikiHiLink xwikiH3 Title
XwikiHiLink xwikiH4 Title
XwikiHiLink xwikiH5 Title
XwikiHiLink xwikiH6 Title

XwikiHiLink xwikiSpecialChars Special
XwikiHiLink xwikiLinkInternalMarker Statement
XwikiHiLink xwikiLink Underlined
XwikiHiLink xwikiAttributeName Type
XwikiHiLink xwikiAttributeValue String
XwikiHiLink xwikiMacroName Statement
XwikiHiLink xwikiMacroStartMarker Special
XwikiHiLink xwikiMacroEndMarker Special
XwikiHiLink xwikiListMarker Statement
XwikiHiLink xwikiLineMarker Statement

XwikiHiLink xwikiEscape Constant
XwikiHiLink xwikiCodeMacro xwikiEscape
XwikiHiLink xwikiPreformattedMacroText xwikiEscape
XwikiHiLink xwikiHtmlPre xwikiEscape

XwikiHiLink xwikiCommentMacro Comment
XwikiHiLink xwikiMultilineRegionMarker Special
XwikiHiLink xwikiQuotationMarker Statement
XwikiHiLink xwikiExtraAttributeMarker Statement

XwikiHiLink xwikiListNumberError Error
XwikiHiLink xwikiOnelineMacroWrongClosing Error
XwikiHiLink xwikiMacroStartMarkerError Error

XwikiHiLink xwikiTableColumnMarker Statement
XwikiHiLink xwikiTableColumnBold htmlBold


let b:current_syntax = "xwiki"

delcommand XwikiHiLink

if main_syntax == "xwiki"
  unlet main_syntax
endif

" vim: set et sts=2 sw=2:
