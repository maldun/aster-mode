=========
aster-mode
==========

Author: Stefan Reiterer
Date: 
06/17/2013

Vers: 0.3

===========


This is the aster-mode for emacs. Currently it only
supports syntax highlighting, and automatic recognition
of .comm and .mess files.
It is derived from Python-mode and thus supports
Python syntax.
It also comes with a broad collection of snippets for ya snippet.

===========

Installing:

===========

Mode: 

Extract aster-mode.el in to a folder and add the lines

(setq asterDir "/opt/aster") ;; Dir to aster. Change if necessary!
(load "/dir/to/folder/aster-mode")

to your ~/.emacs

==========

snippets:

Install YA snippet https://github.com/capitaomorte/yasnippet 
and add contents of snippets in the folder 

/dir/to/yasnippet/snippets/aster-mode

by copying the files or making a link with

ln -s /dir/to/aster-mode/snippets /dir/to/yasnippet/snippets/aster-mode

==========

setup example (in bash using git):

cd ~/.emacs.d/
mkdir plugins
cd plugins
git clone https://github.com/maldun/aster-mode.git aster-mode
git clone --recursive https://github.com/capitaomorte/yasnippet yasnippet
ln -s aster-mode/snippets yasnippet/snippets/aster-mode

Now open or create ~/.emacs and add the following lines:
(setq asterDir "/opt/aster/")
(load "~/.emacs.d/plugins/aster-mode/aster-mode.el")

License
=======

Maintainer: Stefan Reiterer <stefan.harald.reiterer@gmail.com>

Copyright (C) 2014 Stefan Reiterer

Author: 2014 Stefan Reiterer

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
