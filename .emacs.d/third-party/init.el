;;; start package.el with emacs

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

; add MELPA to repository list
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
             ("marmalade" . "http://marmalade-repo.org/packages/")
             ("melpa" . "http://melpa.org/packages/")))
               ; install package through package manager
               ; M-x package-list-packages
               ; select package for installlation, type "i"; type "x" to install package
               ; select the package package you want to remove, type "d", then type "x"
;; configure emacs
;; 1. basic setting
;;    a. global linum mode
;;    b. zenburn color theme
;;    c. dired-x mode
;;    d. others
;; 2. IDE related settings
;;    a. cscope
;;    b. speedbar
;;    c. enable windmove
;;    d. add some hooks to enable some minor mode or some key bindings


;;;  (require 'ido)
;;;  
;;;  (setq ido-enable-flex-matching t)
;;;  (setq ido-everywhere t)
;;;  (ido-mode t)
;;;  (setq max-mini-window-height 0.5)
  
;;(add-to-list 'load-path "~/.emacs.d/third-party")
;;(load-file "~/.emacs.d/third-party/my_custom_settings.el")

(add-to-list 'load-path "/usr/share/emacs/25.2/lisp/net")
(add-to-list 'load-path "/usr/share/emacs/25.2/lisp")
(load-file "/usr/share/emacs/25.2/lisp/net/tramp.elc")
(org-babel-load-file  (expand-file-name "~/.emacs.d/third-party/my_settings.org"))
