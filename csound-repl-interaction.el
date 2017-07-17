;;; csound-repl-interaction.el --- A major mode for interacting and coding Csound

;; Copyright (C) 2017  Hlöðver Sigurðsson

;; Author: Hlöðver Sigurðsson <hlolli@gmail.com>
;; Version: 0.1.1
;; Package-Requires: ((emacs "25") (shut-up "0.3.2") (multi "2.0.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Here are all the functionalities that can be used
;; when typing a command to the comint (csound-repl)
;; prompt.

;;; Code:


(require 'multi)

(module-load "emacscsnd.so")

(defmulti read-csound-repl (op csound &rest _)
  op)

(defmulti-method read-csound-repl 'i (_ csound args)
  (csoundInputMessage csound  (string-join args " ")))

(defmulti-method read-csound-repl 'f (_ csound args)
  (csoundInputMessage csound  (string-join args " ")))

(provide 'csound-repl-interaction)

;;; csound-repl-interaction.el ends here
