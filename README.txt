=========
aster-mode
==========

Author: Stefan Reiterer
Date: 
06/17/2013

Vers: 0.1

License
=======

Maintainer: Stefan Reiterer <maldun.finsterschreck@gmail.com> or <stefan.reiterer@magnasteyr.com>

Copyright (C) 2013 Stefan Reiterer

Author: 2013 Stefan Reiterer

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


===========


This is the aster-mode for emacs. Currently it only
supports syntax highlighting, and automatic recognition
of .comm files.
It is derived from Python-mode and thus supports
Python syntax.

===========

Installing:

===========

Mode: 

Extract aster-mode.el it to a folder and add the lines

(setq asterDir "/opt/aster") ;; Dir to aster. Change if necessary!
(load "/dir/to/folder/aster-mode")

to your ~/.emacs

==========

snippets:

Install YA snippet and add contents of snippets
in the folder /dir/to/yasnippet/snippets/aster-mode
