" Vim filetype plugin file
" Language:         tinyvimwiki
" Maintainer:       Jimmy Wu
" Latest Revision:  2011-07-08
" Copyright 2010 Jimmy Wu 
" 
" This file is part of TinyVimwiki.
"
" TinyVimwiki is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
" 
" TinyVimwiki is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with TinyVimwiki.  If not, see <http://www.gnu.org/licenses/>.


"if exists("b:did_ftplugin")
  "finish
"endif
"let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl fo< tw<"

setlocal formatoptions+=tcroql textwidth=78

command! -buffer -bar TVWTags helptags ++t %:p:h | echo 'Tags updated'
setl isk+=45

let &cpo = s:cpo_save
unlet s:cpo_save
