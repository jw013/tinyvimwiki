.. *tinyvimwiki*

===============
 Tiny Vim Wiki
===============

:Version: 0.5
:URL: https://github.com/jw013/tinyvimwiki

.. contents::
.. .. sectnum::

.. Contents
.. .. |tinyvimwiki-goals|
.. .. |tinyvimwiki-usage|
.. .. |tinyvimwiki-overview|

TinyVimWiki is a minimalist personal Vim wiki based on Vim's built-in
helptags system.  Anyone who has navigated Vim's online help files
should be familiar with the system. See ``:help helptags`` for more
details.

.. *tinyvimwiki-goals*
.. _tinyvimwiki-goals:

Goals
=====

* *Be small*

  For some, there's a certain allure to minimalism.  TinyVimWiki in its
  current form consists of a filetype plugin, a total of 2 files and
  less than 30 lines of VimL.

* *Be minimally intrusive*

  This means TinyVimWiki does not define any mappings or do anything
  else that could conflict with existing user customizations.  

  Full-fledged, feature-filled vim personal wikis already exist (see
  e.g.  `Viki`_, `vimwiki`_ and `potwiki.vim`_).  Most of them come
  packaged with a large pre-defined set of actions and mappings, which
  one may or may not like.  
  
  TinyVimWiki's purpose is not to create yet another pre-packaged wiki,
  but instead to provide the basic underlying link mechanism so you can
  create your own.  It does not even provide its own syntax highlighting
  rules, instead leaving the choice of markup to the user.  Vim supports
  dual filetypes with the ``set filetype=type1.type2`` syntax.  This
  means you could even have a different markup system per page, as long
  as filetype detection supports it.

* *Be standalone*  

  This means not relying on external plugins or programs like ctags, and
  is the reason for choosing to use helptags instead of some other
  system, despite its limitations.

The feature list of TinyVimWiki can be summed in one word: tags.  The
rest is up to you.  If you need more convenience features (like task
management, automatic page creation, extra convenience navigational
mappings) and don't want to implement them yourself, perhaps try one of
the other more full-featured wikis mentioned above.

.. _Viki: http://www.vim.org/scripts/script.php?script_id=861
.. _vimwiki: http://www.vim.org/scripts/script.php?script_id=2226
.. _potwiki.vim: http://www.vim.org/scripts/script.php?script_id=1018


.. *tinyvimwiki-usage*
.. _tinyvimwiki-usage:

TinyVimWiki Usage Notes
=======================

If you know how to navigate tags in Vim, then you know how to use
TinyVimWiki.  If not, help can be found at ``:help tags``.  The basic
commands are the built-in ``Ctrl-]``, ``Ctrl-T``, and ``:tag`` for
jumping to and from tags, and the TinyVimWiki wrapper command
``:TVWTags`` to rebuild the "tags" file.

The hardcoded ``helptags`` command is a bit limited, so most of what the
TinyVimWiki filetype plugin does is to add some workarounds to make its
behavior more suitable for a personal wiki.

* The built-in ``helptags`` command works on a single directory only,
  and does not do recursive traversal.  Thus, you will have to designate
  a directory for your wiki pages and keep all of them in a flat
  directory structure.  In practice, it is easier to organize wikis by
  tags than files anyways so this it can turn out to be more convenient
  this way.  It is possible to rely exclusively on tags for navigation,
  so the only time you ever need to deal with a filename is when opening
  the first page, or creating / deleting files.

* The ``helptags`` command only recognizes \*.txt file extensions (as
  well as \*.??x for translated help files).  All personal wiki pages
  you want it to index must therefore end in ".txt".  TinyVimWiki
  recognizes all files ending in ".wiki.txt" as wiki pages, but keep in
  mind that ``helptags`` will index all \*.txt files in your wiki
  directory.

* Any word in between \* will be recognized as a tag by ``helptags``.
  Since duplicate tags are an error, Keep this in mind in case you want
  to use \* for emphasis or other markup.  Spaces within \* can be used
  to break up the word and prevent it from being recognized as a tag,
  but most other non-space characters except \* itself and | will be
  tagged.

* A large number of built-in Vim commands use the ``'iskeyword'`` option
  to delimit "words".  This includes the basic Vim ``word`` text object,
  as well as the tag recognition used by commands like ``Ctrl-]`` to
  jump to the tag under the cursor.  The default Vim help file has a
  very broad ``'isk'`` setting which includes many characters.  This is
  so one can successfully use ``Ctrl-]`` and other commands to jump to
  typical help tags with a lot of punctuation, like ``<S-F1>``, for
  example.  However, this makes it harder to use the ``word`` text
  object since it will span too many characters.  

  TinyVimWiki's approach is to not use the Vim help's setting for
  ``'isk'``, but rather to use the more natural default setting, with
  the addition of the ``-`` character which is frequently used in Vim
  help tags to delimit words.  

Usage Details
-------------
  
Update tags with the following command::

    :TVWTags

Most customization can be done by using Vim's ``after`` directory
system: simply put your customizations in
``after/ftplugin/tinyvimwiki.vim``, with the ``after`` directory being
somewhere in your ``'runtimepath'``.


.. *tinyvimwiki-overview*
.. _tinyvimwiki-overview:

TinyVimWiki Overview
====================

A terse overview of how TinyVimWiki works.

New filetype::

    :help new-filetype
    " option A (ftdetect)

The entire setup consists of these files::

    ~/.vim/
     +- ftdetect/
     |	 `- tinyvimwiki.vim
     `- ftplugin/
         `- tinyvimwiki.vim

Misc
====

This `blog post`__ by `Abhijit Nadgouda`__ was the initial inspiration
for TinyVimWiki.

__ http://ifacethoughts.net/2008/05/02/vim-as-a-personal-wiki/
__ http://ifacethoughts.net/about/author/

Contact
=======

    | Current maintainer: Jimmy Wu (jw013)  
    | https://github.com/jw013  

For bug reports, feature requests, patches, or other suggestions, send
me a message on github or via email at the address above.  If you use
email, prepend "[TinyVimWiki]" to the subject line to make it easier to
find your message.

Copying
=======

Copyright © 2011 Jimmy Wu (jw013)

TinyVimWiki is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

TinyVimWiki is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with TinyVimWiki.  If not, see <http://www.gnu.org/licenses/>.

.. |tinyvimwiki-usage|	 replace:: TinyVimWiki Usage
.. |tinyvimwiki-overview|    replace:: TinyVimWiki Overview
