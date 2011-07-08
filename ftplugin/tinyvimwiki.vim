" Vim filetype plugin file
" Language:         tinyvimwiki
" Maintainer:       Jimmy Wu
" Latest Revision:  2011-07-06

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
