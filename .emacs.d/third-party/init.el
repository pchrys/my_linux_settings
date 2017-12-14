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

(global-linum-mode t)
(setq linum-format "%d ")
(global-set-key (kbd "C-c l n") 'linum-mode)

;;; load built-in library dired-x
(require 'dired-x)

;;show row/column in the mode line
(setq column-number-mode t)

;;; remove trailling whitespace
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq case-fold-search t)   ; make searches case insensitive

;;;  (require 'ido)
;;;  
;;;  (setq ido-enable-flex-matching t)
;;;  (setq ido-everywhere t)
;;;  (ido-mode t)
;;;  (setq max-mini-window-height 0.5)
  
;;(add-to-list 'load-path "~/.emacs.d/third-party")
(load-file "~/.emacs.d/third-party/my_helm_config.el")
(load-file "~/.emacs.d/third-party/my_custom_settings.el")

;;;==========================================================
;;;; settings for org mode
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)
;;;;The following lines are always needed. Choose your own keys.
(global-set-key (kbd "C-c o s ") 'org-store-link)
(global-set-key (kbd "C-c o a") 'org-agenda)
(global-set-key (kbd "C-c o c") 'org-capture)
(global-set-key (kbd "C-c o b") 'org-iswitchb)
(setq org-log-done 'time)


;;;  (add-to-list 'load-path "~/.emacs.d/third-party/org-bullets")
;;;  (require 'org-bullets)
;;;  (add-hook 'org-mode-hook (lambda () (org-bullets-mode t)))
;;;  (setq org-hide-leading-stars t)
;;;  (setq org-ellipsis "\ldots")

(defun  my-org-mode-hook()
      (local-set-key (kbd "C-c o i")        'org-insert-link)
      (local-set-key (kbd "C-c o n t" )     'org-insert-todo-heading)
      (local-set-key (kbd "C-c o n h" )     'org-insert-heading)
      (local-set-key (kbd "C-c o o")        'org-open-at-point)

      (local-set-key (kbd "C-c o h")    'outline-promote)
      (local-set-key (kbd "C-c o l")    'outline-demote)
      (local-set-key (kbd "C-c o k")    'outline-move-subtree-up)
      (local-set-key (kbd "C-c o j")    'outline-move-subtree-down)

      (local-set-key (kbd "C-S-<left>")       'outline-promote)
      (local-set-key (kbd "C-S-<right>")      'outline-demote)
      (local-set-key (kbd "C-M-<up>")         'outline-move-subtree-up)
      (local-set-key (kbd "C-M-<down>")       'outline-move-subtree-down)
)

      

(add-hook 'org-mode-hook   'my-org-mode-hook)

;;;==========================================================
;;speed bar
(require 'sr-speedbar)

(setq speedbar-show-unknown-files t) ; show all files
(setq speedbar-use-images nil) ; use text for buttons
(setq sr-speedbar-right-side nil) ; put on left side
(setq speedbar-tag-hierarchy-method nil)    ;; expand all tags
(setq speedbar-sort-tags t)     ;;;sort tags

;;;enable case insensitive search in the speedbar window
(add-hook 'speedbar-mode-hook
	  (lambda ()
	  (setq case-fold-search t)))

;; ;;expand current file
;; (defun sb-expand-curren-file ()
;;   "Expand current file in speedbar buffer"
;;   (interactive)
;;   (setq current-file (buffer-file-name))
;;   (sr-speedbar-refresh)
;;   (switch-to-buffer-other-frame "*SPEEDBAR*")
;;   ;(switch-to-buffer "*SPEEDBAR*")
;;   ;(set-buffer "*SPEEDBAR*")
;;   ;(speedbar-find-selected-file current-file)
;;   (speedbar-expand-line)
;;   ;(find-file current-file) 
;;   )

;;expand current file
(defun sb-expand-curren-file ()
  "Expand current file in speedbar buffer"
  ;; (interactive)
  (setq current-file (buffer-file-name))
  (sr-speedbar-refresh)
  (select-window (get-buffer-window "*SPEEDBAR*"))
  (speedbar-find-selected-file current-file)
  (speedbar-expand-line)
)

;;show tags for current file
 (defun sb-show-tags-for-curren-file ()
  "show tags for current file in speedbar buffer"
  (interactive)

  (setq current-file-buffer (buffer-name))
  (if (not (sr-speedbar-exist-p))
      (sr-speedbar-open))

  ;; return to the window which displays the current file
  (select-window (get-buffer-window current-file-buffer))
  (sb-expand-curren-file)

  (select-window (get-buffer-window current-file-buffer))
 )

;;show tags for current file
 (defun sb-toggle-tags-for-curren-file ()
  "toggle tags in speedbar buffer"
  (interactive)

  (if (sr-speedbar-exist-p)
      (sr-speedbar-close)
   (sb-show-tags-for-curren-file)    
  ))

(global-set-key (kbd "<f3>")  'sb-toggle-tags-for-curren-file)
;(global-set-key (kbd "<f3>")  'sr-speedbar-toggle)
(global-set-key (kbd "C-c t l") 'sb-show-tags-for-curren-file)

;; ;;;==========================================================
;; move between different windows
;; using windmove command
;; move between windows using Shift + left/right/up/down arrorw key
;(when (fboundp 'windmove-default-keybindings)
;  (windmove-default-keybindings))
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-c w h") 'windmove-left)
(global-set-key (kbd "C-c w l") 'windmove-right)
(global-set-key (kbd "C-c w k") 'windmove-up)
(global-set-key (kbd "C-c w j") 'windmove-down)
(global-set-key (kbd "<f2>")  'other-window)

;;; on the terminal C-x z will suspend emacs
;; so we remap keys
;;; bound C-c z to reapt
;;; press C-c Z to repeat the prevous command
(global-set-key (kbd "C-c z")  'repeat)

;;; set for tramp mode
;(setq tramp-default-method "plink")  ;;; for windows, install putty
(setq tramp-default-method "ssh") ;;; for linux

;;;; define tab width
(defun my-tab-width()
 (c-set-offset 'substatement-open 0)
 (setq c-basic-offset 4)
 (setq c-default-style "linux")
 (setq c-indent-level 4)
 (setq tab-width 4)
 (setq indent-tabs-mode nil)
)

;;; use space for c/c++ instead of tab
(add-hook 'c++-mode-hook    'my-tab-width)
(add-hook 'c-mode-hook      'my-tab-width)

;;enable cscope mode on C/C++ file
;; using add-hook function
(add-hook 'c++-mode-hook    'cscope-minor-mode)
(add-hook 'c-mode-hook  'cscope-minor-mode)

;;;key bindings for cscope
;;;   C-c s s Find symbol.
;;;   C-c s = Find assignments to this symbol
;;;   C-c s d Find global definition.
;;;   C-c s g Find global definition (alternate binding).
;;;   C-c s G Find global definition without prompting.
;;;   C-c s c Find functions calling a function.
;;;   C-c s C Find called functions (list functions called from a function).
;;;   C-c s t Find text string.
;;;   C-c s e Find egrep pattern.
;;;   C-c s f Find a file.
;;;   C-c s i Find files #including a file.

;;;   C-c s a Set initial directory.
;;;   C-c s A Unset initial directory.

;;;   C-c s b Display cscope buffer.
;;;   C-c s B Auto display cscope buffer toggle.
;;;   C-c s n Next symbol.
;;;   C-c s N Next file.
;;;   C-c s p Previous symbol.
;;;   C-c s P Previous file.
;;;   C-c s u Pop mark.
;;;   
;;;   C-c s L Create list of files to index.
;;;   C-c s I Create list and index.
;;;   C-c s E Edit list of files to index.
;;;   C-c s W Locate this buffer’s cscope directory (“W” –> “where”).
;;;   C-c s S Locate this buffer’s cscope directory. (alternate binding: “S” –> “show”).
;;;   C-c s T Locate this buffer’s cscope directory. (alternate binding: “T” –> “tell”).
;;;   C-c s D Dired this buffer’s directory.

;;;  on windows, using command in windows command prompt 
;;;  dir /S /B *.h *.cpp *.hpp *.c  > cscope.files
;;;  to list files,  
;;;  then use the following command to build cscope database
;;;  cscope.exe -b -i cscope.files -f cscope.out


;;;python mode indent a block
;;; C-c <       ;;shift the region 4 space to the left
;;; C-c >       ;;shift the region 4 space to the right 
;;;set tab to 2 for python code
(add-hook 'python-mode-hook '(lambda () 
 (setq python-indent 4)))

;;;=============================================================
;;;;hide-and-show minor mode
(defun  my-hs-folding-hook()
      (local-set-key (kbd "C-c z o") 'hs-show-block)
      (local-set-key (kbd "C-c z O") 'hs-show-all)
      (local-set-key (kbd "C-c z c") 'hs-hide-block)
      (local-set-key (kbd "C-c z C") 'hs-hide-all)
      (local-set-key (kbd "C-c SPC") 'hs-toggle-hiding)
      (hs-minor-mode t))

;;;;outline minor  mode
(defun  my-outline-minor-mode-hook()
      (local-set-key (kbd "C-c z r") 'outline-show-subtree)
      (local-set-key (kbd "C-c z m") 'outline-hide-subtree)
      (local-set-key (kbd "C-c z R") 'outline-show-all)
      (local-set-key (kbd "C-c z M") 'outline-hide-other)
      (local-set-key (kbd "C-c z SPC") 'outline-toggle-children)
      (outline-minor-mode t))

(defun  my-folding-hook()
    (my-hs-folding-hook)
    (my-outline-minor-mode-hook)
)

(add-hook 'c-mode-common-hook   'my-folding-hook)
(add-hook 'emacs-lisp-mode-hook 'my-folding-hook)
(add-hook 'java-mode-hook       'my-folding-hook)
(add-hook 'lisp-mode-hook       'my-folding-hook)
(add-hook 'perl-mode-hook       'my-folding-hook)
(add-hook 'sh-mode-hook         'my-folding-hook)
(add-hook 'python-mode-hook     'my-folding-hook)
;;;=============================================================

;;force horizontally splitting windows
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;;;show fullpath
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;;;
;; make backup to a designated dir, mirroring the full path
;; http://ergoemacs.org/emacs/emacs_set_backup_into_a_directory.html
;; (defun my-backup-file-name (fpath)
;;   "Return a new file path of a given file path.
;;    If the new path's directories does not exist, create them."
;;   (let* (
;; 	 (backupRootDir "~/.emacs.d/emacs-backup/")
;; 	 (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, for example, “C:”
;; 	 ;;(backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
;; 	 (backupFilePath (replace-regexp-in-string "\\\\" "/" (concat backupRootDir filePath "~") ))
;; 	 )
;;     (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
;;     backupFilePath
;;     )
;;   )
 
;; (setq make-backup-file-name-function 'my-backup-file-name)

(setq debug-on-error t)
(setq backupDir "~/.emacs.backup")

(if (not (file-directory-p backupDir)) 
    (make-directory backupDir))

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
   `(("." . ,backupDir))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;;; set up clang format
(require 'clang-format)
;;; (global-set-key (kbd "C-c i") 'clang-format-region)
;;; (global-set-key (kbd "C-c u") 'clang-format-buffer)
(global-set-key (kbd "C-c c r") 'clang-format-region)
(global-set-key (kbd "C-c c b") 'clang-format-buffer)

;;(setq clang-format-style-option "llvm")
(setq clang-format-style-option "file")

;;;set YCM
;;; setup ycmd
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)
;(add-hook 'c++-mode-hook 'ycmd-mode)

(set-variable 'ycmd-min-num-chars-for-completion 0)
(set-variable 'ycmd-max-num-identifier-candidates 20)
(set-variable 'ycmd-extra-conf-whitelist '("~/*"))

;; specify how to run ycmd server
;; cannot use ~
;;(set-variable 'ycmd-server-command '("python" "~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"))
;; (set-variable 'ycmd-server-command '("python" "/home/shaobo/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"))

;;note that we need use backquote "`" in the following command
(set-variable 'ycmd-server-command `("python" ,(concat (getenv "HOME") 
                                                      "/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd")))

;;;specify a global emacs configuration
;; cannot use ~
;; (set-variable 'ycmd-global-config '("/usr/bin/python" "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
;; (set-variable 'ycmd-global-config `("/usr/bin/python" ,(concat (getenv "HOME") 
;;                                                                "/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py")))

;;; debug ycmd mode: M-x ycmd-show-debug-info
;;;completion framework
(require 'company-ycmd)
(company-ycmd-setup)
(add-hook 'after-init-hook #'global-company-mode)


;;;; Enable flycheck
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;;; Set always complete immediately
(setq company-idle-delay 0)



;;;;tramp mode
;;; You can refer to files on other machines using a special file name syntax: 
;;;   /host:filename
;;;   /user@host:filename
;;;   /user@host#port:filename
;;;   /method:user@host:filename
;;;   /method:user@host#port:filename

(if (eq window-system 'w32)
  	(setq tramp-default-method "plink")
  (setq tramp-default-method "ssh")
)

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
)
