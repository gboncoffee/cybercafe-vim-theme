" Name: cybercafe.vim

" Copyright (C) 2023  Gabriel de Brito
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

set background=dark
hi clear

if exists('syntax on')
	syntax reset
endif

let g:colors_name='cybercafe'
set t_Co=256

let s:fg = "#f0f0f0"
let s:altfg = "#bbbbbb"
let s:bg = "#000000"
let s:altbg = "#444444"
let s:red = "#ee0000"
let s:green = "#00ee00"
let s:blue = "#5c5cff"
let s:yellow = "#eeee00"

if !(has('termguicolors') && &termguicolors)
	function! s:match_cterm(cterm)
		let l:c = a:cterm 
		if a:cterm == s:fg
			let l:c = "White"
		elseif a:cterm == s:altfg
			let l:c = "Gray"
		elseif a:cterm == s:bg
			let l:c = "Black"
		elseif a:cterm == s:altbg
			let l:c = "DarkGray"
		elseif a:cterm == s:red
			let l:c = "Red"
		elseif a:cterm == s:green
			let l:c = "Green"
		elseif a:cterm == s:blue
			let l:c = "Blue"
		elseif a:cterm == s:yellow
			let l:c = "Yellow"
		endif
		return l:c
	endfunction

	function! s:hi(group, fg, bg, cterm)
		let l:cmd = ""
		if a:bg != ""
			let l:cmd = l:cmd . ' ctermbg=' . s:match_cterm(a:bg)
		endif
		if a:fg != ""
			let l:cmd = l:cmd . ' ctermfg=' . s:match_cterm(a:fg)
		endif
		if a:cterm != ""
			let l:cmd = l:cmd . ' cterm=' . a:cterm
		endif
		if a:group != ""
			exec "hi " . a:group . l:cmd
		endif
	endfunction
else
	function! s:hi(group, fg, bg, gui)
		let l:cmd = ""
		if a:bg != ""
			let l:cmd = l:cmd . ' guibg=' . a:bg
		endif
		if a:fg != ""
			let l:cmd = l:cmd . ' guifg=' . a:fg
		endif
		if a:gui != ""
			let l:cmd = l:cmd . ' gui=' . a:gui
		endif
		if a:group != ""
			exec "hi " . a:group . l:cmd
		endif
	endfunction
endif

call s:hi("Normal", s:fg, "NONE", "")
call s:hi("Visual", "", s:altbg, "")
call s:hi("ColorColumn", "", s:altbg, "")
call s:hi("Cursor", s:bg, s:fg, "")
call s:hi("lCursor", s:bg, s:fg, "")
call s:hi("CursorIM", s:bg, s:fg, "")
call s:hi("CursorColumn", "", s:altbg, "")
call s:hi("CursorLine", "", s:altbg, "")
call s:hi("Directory", s:blue, "", "bold")
call s:hi("DiffAdd", s:bg, s:green, "")
call s:hi("DiffChange", s:bg, s:yellow, "")
call s:hi("DiffDelete", s:bg, s:red, "")
call s:hi("DiffText", s:fg, s:bg, "")
call s:hi("EndOfBuffer", s:altfg, "", "")
call s:hi("ErrorMsg", s:bg, s:red, "")
call s:hi("WarningMsg", s:bg, s:yellow, "")
call s:hi("VertSplit", s:bg, s:fg, "")
call s:hi("Folded", s:altfg, s:altbg, "")
call s:hi("FoldColumn", s:fg, "", "")
call s:hi("SignColumn", s:fg, "", "")
call s:hi("Search", s:bg, s:yellow, "")
call s:hi("CursorLineNR", s:fg, s:altbg, "bold")
call s:hi("LineNr", s:fg, "", "")
call s:hi("MatchParen", s:bg, s:altfg, "")
call s:hi("NonText", s:altfg, "", "")
call s:hi("Pmenu", s:bg, s:altfg, "")
call s:hi("PmenuSel", s:fg, s:altbg, "")
call s:hi("PmenuSbar", "NONE", s:altbg, "")
call s:hi("PmenuThumb", "NONE", s:altfg, "")
call s:hi("MoreMsg", s:green, "", "")
call s:hi("SpecialKey", s:blue, "", "")
call s:hi("SpellCap", "", s:yellow, "")
call s:hi("SpellLocal", "", s:blue, "")
call s:hi("StatusLine", s:bg, s:fg, "NONE")
call s:hi("StatusLineNC", s:altbg, s:altfg, "")

call s:hi("Comment", s:altfg, "", "italic")
call s:hi("Constant", s:fg, "", "NONE")
call s:hi("Identifier", s:fg, "", "NONE")
call s:hi("Statement", s:fg, "", "bold")
call s:hi("PreProc", s:fg, "", "")
call s:hi("Type", s:fg, "", "bold")
call s:hi("Special", s:fg, "", "")
call s:hi("Underlined", s:fg, "", "underline")
call s:hi("String", s:altfg, "", "")
call s:hi("Number", s:fg, "", "")
call s:hi("Boolean", s:fg, "", "")
call s:hi("Float", s:fg, "", "")
call s:hi("Function", s:fg, "", "")
call s:hi("Operator", s:fg, "", "")
call s:hi("Include", s:fg, "", "")
call s:hi("Delimiter", s:fg, "", "")

hi! link TabLineSel StatusLine
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link Terminal Normal
hi! link SpellBad ErrorMsg
hi! link SpellRare SpellLocal
hi! link WildMenu Pmenu

hi! link Error ErrorMsg
hi! link Todo WarningMsg
hi! link Character String
hi! link Conditional Statement
hi! link Keyword Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link SpecialChar Special
hi! link Tag Type
hi! link SpecialComment Comment
hi! link Debug Special
hi! link Exception Error
hi! link Ignore Comment

hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete
