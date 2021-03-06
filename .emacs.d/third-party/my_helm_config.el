
;; setting for projectile
(projectile-global-mode)

(setq projectile-completion-system 'helm)

(setq projectile-switch-project-action 'helm-projectile)
(setq projectile-enable-caching t)

;;;for windoes
(if (eq window-system 'w32)
	(setq projectile-indexing-method 'alien)
)

(add-to-list 'projectile-globally-ignored-directories ".git")
(add-to-list 'projectile-globally-ignored-directories "3rdparty")
(add-to-list 'projectile-globally-ignored-directories "build")
(add-to-list 'projectile-globally-ignored-directories "lib")

;;; TAB/C-i  will run helm-execute-persistent-action
;(define-key helm-projectile-projects-map (kbd "TAB") 'nil) ;  release tab
;(define-key helm-projectile-projects-map (kbd "C-i") 'helm-execute-persistent-action);

(helm-projectile-on)

;;; a few commands  for projectile
;;; more can be found at https://projectile.readthedocs.io/en/latest/usage/
;;; and https://tuhdo.github.io/helm-projectile.html
;;; C-c p h     helm-projectile     Helm interface to projectile
;;; C-c p p     helm-projectile-switch-project  Switches to another projectile project
;;; C-c p f     helm-projectile-find-file   Lists all files in a project
;;; C-c p F     helm-projectile-find-file-in-known-projects     Find file in all known projects
;;; C-c p g     helm-projectile-find-file-dwim  Find file based on context at point
;;; C-c p d     helm-projectile-find-dir    Lists available directories in current project
;;; C-c p e     helm-projectile-recentf     Lists recently opened files in current project
;;; C-c p a     helm-projectile-find-other-file     Switch between files with same name but different extensions
;;; C-c p i     projectile-invalidate-cache     Invalidate cache
;;; C-c p z     projectile-cache-current-file   Add the file of current selected buffer to cache
;;; C-c p b     helm-projectile-switch-to-buffer    List all open buffers in current project

;;; C-c p !     Runs shell-command in the root directory of the project.
;;; C-c p &     Runs async-shell-command in the root directory of the project.
;;; C-c p C     Runs a standard configure command for your type of project.
;;; C-c p c     Runs a standard compilation command for your type of project.
;;; C-c p s g   helm-projectile-grep    Searches for symbol starting from project root
;;; C-c p s a   helm-projectile-ack     Same as above but using ack
;;; C-c p s s   helm-projectile-ag  Same as above but using ag


;;;   C-c p o     Runs multi-occur on all project buffers currently open.
;;;   C-c p b     Display a list of all project buffers currently open.
;;;   C-c p r     Runs interactive query-replace on all files in the projects.
;;;   C-c p R     Regenerates the projects TAGS file.
;;;   C-c p j     Find tag in project's TAGS file.
;;;   C-c p k     Kills all project buffers.
;;;   C-c p D     Opens the root of the project in dired.


;;;Here's a list of the interactive Emacs Lisp functions, provided by Projectile:
;;;Keybinding  Description
;;;   C-c p f     Display a list of all files in the project. With a prefix argument it will clear the cache first.
;;;   C-c p F     Display a list of all files in all known projects.
;;;   C-c p g     Display a list of all files at point in the project. With a prefix argument it will clear the cache first.
;;;   C-c p 4 f   Jump to a project's file using completion and show it in another window.
;;;   C-c p 4 g   Jump to a project's file based on context at point and show it in another window.
;;;   C-c p 5 f   Jump to a project's file using completion and show it in another frame.
;;;   C-c p 5 g   Jump to a project's file based on context at point and show it in another frame.
;;;   C-c p d     Display a list of all directories in the project. With a prefix argument it will clear the cache first.
;;;   C-c p 4 d   Switch to a project directory and show it in another window.
;;;   C-c p 5 d   Switch to a project directory and show it in another frame.
;;;   C-c p T     Display a list of all test files(specs, features, etc) in the project.
;;;   C-c p l     Display a list of all files in a directory (that's not necessarily a project)
;;;   C-c p s g   Run grep on the files in the project.
;;;   M-- C-c p s g   Run grep on projectile-grep-default-files in the project.
;;;   C-c p v     Run vc-dir on the root directory of the project.
;;;   C-c p V     Browse dirty version controlled projects.
;;;   C-c p b     Display a list of all project buffers currently open.
;;;   C-c p 4 b   Switch to a project buffer and show it in another window.
;;;   C-c p 5 b   Switch to a project buffer and show it in another frame.
;;;   C-c p 4 C-o     Display a project buffer in another window without selecting it.
;;;   C-c p a     Switch between files with the same name but different extensions.
;;;   C-c p 4 a   Switch between files with the same name but different extensions in other window.
;;;   C-c p 5 a   Switch between files with the same name but different extensions in other frame.
;;;   C-c p o     Runs multi-occur on all project buffers currently open.
;;;   C-c p r     Runs interactive query-replace on all files in the projects.
;;;   C-c p i     Invalidates the project cache (if existing).
;;;   C-c p R     Regenerates the projects TAGS file.
;;;   C-c p j     Find tag in project's TAGS file.
;;;   C-c p k     Kills all project buffers.
;;;   C-c p D     Opens the root of the project in dired.
;;;   C-c p 4 D   Opens the root of the project in dired in another window.
;;;   C-c p 5 D   Opens the root of the project in dired in another frame.
;;;   C-c p e     Shows a list of recently visited project files.
;;;   C-c p E     Opens the root dir-locals-file of the project.
;;;   C-c p s s   Runs ag on the project. Requires the presence of ag.el.
;;;   C-c p !     Runs shell-command in the root directory of the project.
;;;   C-c p &     Runs async-shell-command in the root directory of the project.
;;;   C-c p C     Runs a standard configure command for your type of project.
;;;   C-c p c     Runs a standard compilation command for your type of project.
;;;   C-c p P     Runs a standard test command for your type of project.
;;;   C-c p t     Toggle between an implementation file and its test file.
;;;   C-c p 4 t   Jump to implementation or test file in other window.
;;;   C-c p 5 t   Jump to implementation or test file in other frame.
;;;   C-c p z     Adds the currently visited file to the cache.
;;;   C-c p p     Display a list of known projects you can switch to.
;;;   C-c p S     Save all project buffers.
;;;   C-c p m     Run the commander (an interface to run commands with a single key).
;;;   C-c p ESC   Switch to the most recently selected Projectile buffer.

;;======================================================================
;;; configuration or helm
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-unset-key (kbd "C-j"))
(define-key helm-map (kbd "C-j") nil) ;

;;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 60)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)


(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
;;; you may need <right> or C-o to select a command


(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(global-set-key (kbd "C-x C-f") 'helm-find-files)



;;;enable semantic mode to support helm helm semantic-or-imenu
;; (semantic-mode t)

;;; enable fuzzy matching for both semantics and Imenu list
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)


;;enable man page at points
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;;helm-occur
(global-set-key (kbd "C-c h o") 'helm-occur)

;;helm-apropos
(setq helm-apropos-fuzzy-match t)

;;helm-mark-ring
(global-set-key (kbd "C-c h SPC") 'helm-all-mark-rings)

;;helm register
(global-set-key (kbd "C-c h x") 'helm-register)

;;helm-surfraw

;;helm-google-suggested
(global-set-key (kbd "C-c h g") 'helm-google-suggest)

;; C-c h B      helm-resume     Resumes a previous helm session
(global-set-key (kbd "C-c h B") 'helm-resume)

;; helm-filtered-bookmarks
(global-set-key (kbd "C-c h b") 'helm-filtered-bookmarks)


;;;helm-eshell-history
(require 'helm-eshell)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))

;;;helm-comint-input-ring
;; Similar to helm-eshell-history, but used for M-x shell.
;; (define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

;;;helm-mini-buffer-history
(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

(helm-mode 1)


;; ;;;;Key bindings for helm
;; Key Binding  Command         Description
;; M-x  helm-M-x        List commands
;; M-y  helm-show-kill-ring     Shows the content of the kill ring
;; C-x b        helm-mini       Shows open buffers, recently opened files
;; C-x C-f      helm-find-files         The helm version of find-file
;; C-s  helm-ff-run-grep        Run grep from within helm-find-files
;; C-c h i      helm-semantic-or-imenu  Helm interface to semantic/imenu
;; C-c h m      helm-man-woman  Jump to any man entry
;; C-c h /      helm-find       Helm interface to find
;; C-c h l      helm-locate     Helm interface to locate
;; C-c h o      helm-occur      Helm interface for occur
;; C-c h a      helm-apropos    Describes commands, functions, variables, …
;; C-c h h g    helm-info-gnus
;; C-c h h i    helm-info-at-point
;; C-c h h r    helm-info-emacs
;; C-c h <tab>  helm-lisp-completion-at-point   Provides a list of available functions
;; C-c h b      helm-resume     Resumes a previous helm session
;; C-h SPC      helm-all-mark-rings     Views contents of local and global mark rings
;; C-c h r      helm-regex      Visualizes regex matches
;; C-c h x      helm-register   Shows content of registers
;; C-c h t      helm-top        Helm interface to top
;; C-c h s      helm-surfraw    Command line interface to many web search engines
;; C-c h g      helm-google-suggest     Interactively enter search terms and get results from Google in helm buffer
;; C-c h c      helm-color      Lists all available faces
;; C-c h M-:    helm-eval-expression-with-eldoc         Get instant results for Emacs lisp expressions in the helm buffer
;; C-c h C-,    helm-calcul-expression  Helm interface to calc
;; C-c C-l      helm-eshell-history     Interface to eshell history
;; C-c C-l      helm-comint-input-ring  Interface to shell history
;; C-c C-l      helm-mini-buffer-history        Interface to mini-buffer history



;;;;=================================================================
;; set up for helm-gtags
;; customize
(setq
 ;;helm-gtags-path-style 'relative
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key (kbd "C-c t") 
 helm-gtags-suggested-key-mapping t
 )

;;;   (let ((command-table '(("h" . helm-gtags-display-browser)
;;;                          ("P" . helm-gtags-find-files)
;;;                          ("f" . helm-gtags-parse-file)
;;;                          ("g" . helm-gtags-find-pattern)
;;;                          ("s" . helm-gtags-find-symbol)
;;;                          ("r" . helm-gtags-find-rtag)
;;;                          ("t" . helm-gtags-find-tag)
;;; 						("d" . helm-gtags-find-tag)))
;;;     (define-key helm-gtags-mode-map "\C-]" 'helm-gtags-find-tag-from-here)
;;;     (define-key helm-gtags-mode-map "\C-t" 'helm-gtags-pop-stack)
;;;     (define-key helm-gtags-mode-map "\e*" 'helm-gtags-pop-stack)
;;;     (define-key helm-gtags-mode-map "\e." 'helm-gtags-find-tag)
;;;     (define-key helm-gtags-mode-map "\C-x4." 'helm-gtags-find-tag-other-window)))

(with-eval-after-load 'helm-gtags
   (define-key helm-gtags-mode-map (kbd "C-c t g")   nil)
   (define-key helm-gtags-mode-map (kbd "C-c t p")   nil)
   (define-key helm-gtags-mode-map (kbd "C-c t t")   nil)
   (define-key helm-gtags-mode-map (kbd "C-t")   nil)

   (define-key helm-gtags-mode-map (kbd "C-c t i") 'helm-gtags-find-files)
   (define-key helm-gtags-mode-map (kbd "C-c t t")   'helm-gtags-find-pattern)

	;;;  helm-gtags-dwim ()
	;;;     "Find by context. Here is
	;;;   - on include statement then jump to included file
	;;;   - on symbol definition then jump to its references
	;;;   - on reference point then jump to its definition."

   (define-key helm-gtags-mode-map (kbd "C-c t g")   'helm-gtags-dwim)
   (define-key helm-gtags-mode-map (kbd "C-c t P")   'helm-gtags-parse-file)
   ;;; other mappings are f, s, r, d
   
   (define-key helm-gtags-mode-map (kbd "C-c t k")   'helm-tags-show-stack)
   (define-key helm-gtags-mode-map (kbd "C-c t K")   'helm-gtags-pop-stack)

   (define-key helm-gtags-mode-map (kbd "C-c t n")   'helm-gtags-next-history)
   (define-key helm-gtags-mode-map (kbd "C-c t p")   'helm-gtags-previous-history)
)

;;; Before using the ggtags or helm-gtags, remember to create 
;;; a GTAGS database by running gtags at your project root in terminal: 

(require 'helm-gtags)

(defun  my-helm-gtags-hook()
      (helm-gtags-mode t))

(add-hook 'c-mode-common-hook   'my-helm-gtags-hook)
(add-hook 'emacs-lisp-mode-hook 'my-helm-gtags-hook)
(add-hook 'java-mode-hook       'my-helm-gtags-hook)
(add-hook 'lisp-mode-hook       'my-helm-gtags-hook)
(add-hook 'perl-mode-hook       'my-helm-gtags-hook)
(add-hook 'sh-mode-hook         'my-helm-gtags-hook)
(add-hook 'python-mode-hook     'my-helm-gtags-hook)

;;;; Default Key Mapping
;;;    Key     Command
;;;    Prefix h    helm-gtags-display-browser
;;;    Prefix C-]  helm-gtags-find-tag-from-here
;;;    Prefix C-t  helm-gtags-pop-stack
;;;    Prefix i    helm-gtags-find-files
;;;    Prefix f    helm-gtags-parse-file
;;;    Prefix g    helm-gtags-find-pattern
;;;    Prefix s    helm-gtags-find-symbol
;;;    Prefix r    helm-gtags-find-rtag
;;;    Prefix t    helm-gtags-find-tag
;;;    Prefix d    helm-gtags-find-tag
;;;    M-*     helm-gtags-pop-stack
;;;    M-.     helm-gtags-find-tag
;;;    C-x 4 .     helm-gtags-find-tag-other-window



;;;================================================
;;; bookmarks
(require 'bookmark)
;(bookmark-bmenu-list)
;(switch-to-buffer "*Bookmark List*")
(setq bookmark-save-flag 1)


;;; https://www.emacswiki.org/emacs/BookMarks
;;;   Some keys in ‘*Bookmark List*’:
;;;
;;;       ‘a’ – show annotation for the current bookmark
;;;       ‘A’ – show all annotations for your bookmarks
;;;       ‘d’ – mark various entries for deletion (‘x’ – to delete them)
;;;       ‘e’ – edit the annotation for the current bookmark
;;;       ‘m’ – mark various entries for display and other operations, (‘v’ – to visit)
;;;       ‘o’ – visit the current bookmark in another window, keeping the bookmark list open
;;;       ‘C-o’ – switch to the current bookmark in another window
;;;       ‘r’ – rename the current bookmark



;;;================================================
;;;change prefix for bookmark+

(setq bmkp-bookmark-map-prefix-keys (list (kbd "C-c b"))
      bmkp-jump-map-prefix-keys (list (kbd "C-c b j"))
      bmkp-jump-other-window-map-prefix-keys (list (kbd "C-c b 4 j"))
)

;;;show bmenu-list
;;; bookmark-bmenu-list
;;; C-c b e runs the command edit-bookmarks (found in global-map), which
;;;  is an alias for ‘bookmark-bmenu-list’ in ‘bookmark.el’.

;; show bookmark list
;;(define-key bookmark-map (kbd "e")    'bookmark-bmenu-list)             ; C-c b e 

;;;save bookmark list
;; (define-key bookmark-map (kbd "s")    'bookmark-save)                  ; C-c b s 

(define-key bookmark-map (kbd "a b")    'bmkp-annotate-bookmark)         ; C-c b a b
(define-key bookmark-map (kbd "a s")    'bookmark-show-annotation)       ; C-c b a s
(define-key bookmark-map (kbd "a S")    'bookmark-show-all-annotations)  ; C-c b a S
(define-key bookmark-map (kbd "a e")    'bookmark-edit-annotation)       ; C-c b a e



(require 'bookmark+)


;;;some key bindings for bookmark+

;; (define-key bookmark-map "I"      'bookmark-insert-location)                          ; C-c b I
;; (define-key bookmark-map "L"      'bmkp-switch-bookmark-file-create)                  ; C-c b L
;; (define-key bookmark-map "s"      'bookmark-save)                                     ; C-c b s

;; (define-key bookmark-map "t + a"  'bmkp-tag-a-file)                                   ; C-c b t + a 
;; (define-key bookmark-map "t - a"  'bmkp-untag-a-file)                                 ; C-c b t - a 
;; (define-key bookmark-map "t + b"  'bmkp-add-tags)                                     ; C-c b t + b 
;; (define-key bookmark-map "t - b"  'bmkp-remove-tags)                                  ; C-c b t - b 
;; (define-key bookmark-map "t l"    'bmkp-list-all-tags)                                ; C-c b t l 
;;; bmkp-bookmark-a-file, bookmark a file without visiting it.      ;;; C-c b c a 

;;;; Tag Commands and Keys
;;;    They all have the prefix key ‘T’.
;;;    ‘m’ means mark
;;;    ‘u’ means unmark
;;;    `>’ stands for the marked bookmarks
;;;    ‘*’ means AND (set intersection; all)
;;;    `+’ means OR (set union; some/any)
;;;    `~’ means NOT (set complement)

;;; annotation
;;; In the ‘*Bookmark List*’ display, you can use ‘a’ to show or (with a prefix arg) 
;;; edit the existing annotation for the bookmark on the current line.

;;; Just as in Dired, you can use `% m’ to mark the bookmarks that match a regexp. 
;;; Then use `>’ to show only the marked bookmarks. See MarkingAndUnmarkingBookmarks, above.



;; Mark the bookmarks that have particular tags: `T m +’. Hit ‘RET’ to enter each tag you type, 
;; then hit ‘RET’/or M-RET with empty input when done.


;; (define-key ctl-x-map "p" bookmark-map)
;; (define-key ctl-x-map "pj" 'bookmark-jump-other-window)               ; `C-x p j' (also `C-x 4 j j')
;; (define-key ctl-x-map "rK" 'bmkp-set-desktop-bookmark)        ; `C-x r K' (also `C-x p K', `C-x p c K')

;; (define-key bookmark-map "0"      'bmkp-empty-file)                                   ; `C-x p 0'
;; (define-key bookmark-map "B"      'bmkp-choose-navlist-from-bookmark-list)            ; `C-x p B'
;; ;; `e' is `edit-bookmarks' (aka `bookmark-bmenu-list', from vanilla Emacs.
;; (define-key bookmark-map "E"      'bmkp-edit-bookmark-record)                         ; `C-x p E'
;; ;; The original `bookmark-insert-location' in `bookmark.el' was `f'.
;; (define-key bookmark-map "I"      'bookmark-insert-location)                          ; `C-x p I'
;; (define-key bookmark-map "K"      'bmkp-set-desktop-bookmark) ; `C-x p K' (also `C-x r K', `C-x p c K')
;; (define-key bookmark-map "L"      'bmkp-switch-bookmark-file-create)                  ; `C-x p L'
;; (define-key bookmark-map "m"      'bmkp-bookmark-set-confirm-overwrite)               ; `C-x p m'
;; (define-key bookmark-map "N"      'bmkp-navlist-bmenu-list)                           ; `C-x p N'
;; (define-key bookmark-map "o"      'bookmark-jump-other-window)           ; `C-x p o' (also `C-x 4 j j')
;; (define-key bookmark-map "q"      'bookmark-jump-other-window)           ; `C-x p q' (also `C-x 4 j j')
;; (define-key bookmark-map "r"      'bmkp-edit-bookmark-name-and-location)              ; `C-x p r'
;; (define-key bookmark-map "\M-w"   'bmkp-set-snippet-bookmark)        ; `C-x p M-w' (also `C-x p c M-w')
;; (define-key bookmark-map "x"      'bmkp-toggle-autotemp-on-set)                       ; `C-x p x'
;; (define-key bookmark-map "y"      'bmkp-set-bookmark-file-bookmark)                   ; `C-x p y'
;; (when (featurep 'bookmark+-lit)
;;   (define-key bookmark-map "h"    'bmkp-light-bookmark-this-buffer)                   ; `C-x p h'
;;   (define-key bookmark-map "H"    'bmkp-light-bookmarks)                              ; `C-x p H'
;;   (define-key bookmark-map "u"    'bmkp-unlight-bookmark-this-buffer)                 ; `C-x p u'
;;   (define-key bookmark-map "U"    'bmkp-unlight-bookmarks)                            ; `C-x p U'
;;   (define-key bookmark-map "\C-u" 'bmkp-unlight-bookmark-here)                        ; `C-x p C-u'
;;   (define-key bookmark-map "="    'bmkp-bookmarks-lighted-at-point))                  ; `C-x p ='
;; (define-key bookmark-map ","      'bmkp-this-file/buffer-bmenu-list)                  ; `C-x p ,'
;; (define-key bookmark-map "?"      'bmkp-describe-bookmark)                            ; `C-x p ?'
;; (define-key bookmark-map ":"      'bmkp-choose-navlist-of-type)                       ; `C-x p :'
;; (define-key bookmark-map "\r"     'bmkp-toggle-autonamed-bookmark-set/delete)         ; `C-x p RET'
;; (define-key bookmark-map [delete] 'bmkp-delete-bookmarks)                             ; `C-x p delete'

;; (substitute-key-definition 'kill-line 'bmkp-delete-bookmarks          ; `C-x p C-k', `C-x p deleteline'
;;                            bookmark-map (current-global-map))
;; (define-key bookmark-map [deletechar] 'bmkp-delete-bookmarks)                      ; `C-x p deletechar'
;; ;; For Mac Book:
;; (define-key bookmark-map [kp-delete] 'bmkp-delete-bookmarks)                        ; `C-x p kp-delete'

;; ;; If you use Emacs before Emacs 22, then you will want to bind the commands
;; ;; whose names do *not* end in `-repeat' to keys that are easily repeatable.
;; ;; For example, you might want to bind `bmkp-next-bookmark-this-file/buffer'
;; ;; (not `bmkp-next-bookmark-this-file/buffer-repeat') to a key such as [f2].
;; ;;
;; (when (> emacs-major-version 21)
;;   (define-key bookmark-map "n"          'bmkp-next-bookmark-this-file/buffer-repeat) ; `C-x p n'
;;   (define-key bookmark-map "\C-n"       'bmkp-next-bookmark-this-file/buffer-repeat) ; `C-x p C-n'
;;   (define-key bookmark-map [down]       'bmkp-next-bookmark-this-file/buffer-repeat) ; `C-x p down'
;;   (put 'bmkp-next-bookmark-this-file/buffer-repeat :advertised-binding (kbd "C-x p <down>"))

;;   ;; This requires the fix for Emacs bug #6256, which is in Emacs 23.3 (presumably).
;;   ;; For older Emacs versions you can bind the wheel event to `bmkp-next-bookmark-this-file/buffer'
;;   ;; in the global map.  IOW, prior to Emacs 23.3 a mouse event won't work with `repeat'.
;;   (when (and (boundp 'mouse-wheel-up-event)
;;              (or (> emacs-major-version 23)
;;                  (and (= emacs-major-version 23)  (> emacs-minor-version 2))))
;;     (define-key bookmark-map (vector (list mouse-wheel-up-event))
;;       'bmkp-next-bookmark-this-file/buffer-repeat))                            ; `C-x p mouse-wheel-up'
;;   (define-key bookmark-map "p"          'bmkp-previous-bookmark-this-file/buffer-repeat) ; `C-x p p'
;;   (define-key bookmark-map "\C-p"       'bmkp-previous-bookmark-this-file/buffer-repeat) ; `C-x p C-p'
;;   (define-key bookmark-map [up]         'bmkp-previous-bookmark-this-file/buffer-repeat) ; `C-x p up'
;;   (put 'bmkp-previous-bookmark-this-file/buffer-repeat :advertised-binding (kbd "C-x p <up>"))

;;   ;; This requires the fix for Emacs bug #6256, which is in Emacs 23.3 (presumably).
;;   ;; For older Emacs versions you can bind the wheel event to `bmkp-previous-bookmark-this-file/buffer'
;;   ;; in the global map.  IOW, prior to Emacs 23.3 a mouse event won't work with `repeat'.
;;   (when (and (boundp 'mouse-wheel-down-event)
;;              (or (> emacs-major-version 23)
;;                  (and (= emacs-major-version 23)  (> emacs-minor-version 2))))
;;     (define-key bookmark-map (vector (list mouse-wheel-down-event))
;;       'bmkp-previous-bookmark-this-file/buffer-repeat))                      ; `C-x p mouse-wheel-down'
;;   (define-key bookmark-map "f"          'bmkp-next-bookmark-repeat)                  ; `C-x p f'
;;   (define-key bookmark-map "\C-f"       'bmkp-next-bookmark-repeat)                  ; `C-x p C-f'
;;   (define-key bookmark-map [right]      'bmkp-next-bookmark-repeat)                  ; `C-x p right'
;;   (put 'bmkp-next-bookmark-repeat :advertised-binding (kbd "C-x p <right>"))
;;   (define-key bookmark-map "b"          'bmkp-previous-bookmark-repeat)              ; `C-x p b'
;;   (define-key bookmark-map "\C-b"       'bmkp-previous-bookmark-repeat)              ; `C-x p C-b'
;;   (define-key bookmark-map [left]       'bmkp-previous-bookmark-repeat)              ; `C-x p left'
;;   (put 'bmkp-previous-bookmark-repeat :advertised-binding (kbd "C-x p <left>"))
;;   (define-key bookmark-map [next]       'bmkp-next-bookmark-w32-repeat)              ; `C-x p next'
;;   (define-key bookmark-map [prior]      'bmkp-previous-bookmark-w32-repeat)          ; `C-x p prior'
;;   (when (featurep 'bookmark+-lit)
;;     (define-key bookmark-map [C-down]   'bmkp-next-lighted-this-buffer-repeat)       ; `C-x p C-down'
;;     (define-key bookmark-map [C-up]     'bmkp-previous-lighted-this-buffer-repeat))) ; `C-x p C-up'


;; ;; `bmkp-set-map': prefix `C-x p c'

;; (define-prefix-command 'bmkp-set-map)
;; (define-key bookmark-map "c"  bmkp-set-map)                                    ; `C-x p c' for create

;; (define-key bmkp-set-map "a"    'bmkp-autofile-set)                            ; `C-x p c a'
;; (define-key bmkp-set-map "f"    'bmkp-file-target-set)                         ; `C-x p c f'
;; (define-key bmkp-set-map "F"    'bmkp-make-function-bookmark)                  ; `C-x p c F'
;; (define-key bmkp-set-map "K"    'bmkp-set-desktop-bookmark)                    ; `C-x p c K'
;; (define-key bmkp-set-map "\C-k" 'bmkp-wrap-bookmark-with-last-kbd-macro)       ; `C-x p C-k'
;; (define-key bmkp-set-map "m"    'bmkp-bookmark-set-confirm-overwrite)          ; `C-x p c m'
;; (define-key bmkp-set-map "M"    'bookmark-set)                                 ; `C-x p c M'
;; (define-key bmkp-set-map "s"    'bmkp-set-sequence-bookmark)                   ; `C-x p c s'
;; (define-key bmkp-set-map "u"    'bmkp-url-target-set)                          ; `C-x p c u'
;; (define-key bmkp-set-map "\M-w" 'bmkp-set-snippet-bookmark)                    ; `C-x p c M-w'
;; (define-key bmkp-set-map "y"    'bmkp-set-bookmark-file-bookmark)              ; `C-x p c y'
;; (define-key bmkp-set-map "\r"   'bmkp-toggle-autonamed-bookmark-set/delete)    ; `C-x p c RET'

;; ;; `bmkp-tags-map': prefix `C-x p t'

;; (defvar bmkp-tags-map nil "Keymap containing bindings for bookmark tag commands.")

;; (define-prefix-command 'bmkp-tags-map)
;; (define-key bookmark-map "t"  bmkp-tags-map)                                      ; `C-x p t' for tags

;; (define-key bmkp-tags-map "0"    'bmkp-remove-all-tags)                           ; `C-x p t 0'
;; (define-key bmkp-tags-map "+"    nil) ; For Emacs 20
;; (define-key bmkp-tags-map "+b"   'bmkp-add-tags)                                  ; `C-x p t + b'
;; (define-key bmkp-tags-map "-b"   'bmkp-remove-tags)                               ; `C-x p t - b'
;; (define-key bmkp-tags-map "+a"   'bmkp-tag-a-file)                                ; `C-x p t + a'
;; (define-key bmkp-tags-map "-a"   'bmkp-untag-a-file)                              ; `C-x p t - a'
;; (define-key bmkp-tags-map "c"    'bmkp-copy-tags)                                 ; `C-x p t c'
;; (define-key bmkp-tags-map "d"    'bmkp-remove-tags-from-all)                      ; `C-x p t d'
;; (define-key bmkp-tags-map "e"    'bmkp-edit-tags)                                 ; `C-x p t e'
;; (define-key bmkp-tags-map "l"    'bmkp-list-all-tags)                             ; `C-x p t l'
;; (define-key bmkp-tags-map "p"    'bmkp-paste-add-tags)                            ; `C-x p t p'
;; (define-key bmkp-tags-map "q"    'bmkp-paste-replace-tags)                        ; `C-x p t q'
;; (define-key bmkp-tags-map "r"    'bmkp-rename-tag)                                ; `C-x p t r'
;; (define-key bmkp-tags-map "v"    'bmkp-set-tag-value)                             ; `C-x p t v'
;; (define-key bmkp-tags-map "V"    'bmkp-set-tag-value-for-navlist)                 ; `C-x p t V'
;; (define-key bmkp-tags-map "\M-w" 'bmkp-copy-tags)                                 ; `C-x p t M-w'
;; (define-key bmkp-tags-map "\C-y" 'bmkp-paste-add-tags)                            ; `C-x p t C-y'


;; ;; `bmkp-jump-map' and `bmkp-jump-other-window-map': prefixes `C-x j' and `C-x 4 j'

;; (define-prefix-command 'bmkp-jump-map)
;; (define-prefix-command 'bmkp-jump-other-window-map)
;; ;; (define-key ctl-x-map   "j" bmkp-jump-map)
;; ;; (define-key ctl-x-4-map "j" bmkp-jump-other-window-map)
;; (define-key bookmark-bmenu-mode-map "j"  nil) ; For Emacs 20
;; (define-key bookmark-bmenu-mode-map "J"  nil) ; For Emacs 20
;; (define-key bookmark-bmenu-mode-map "J"  bmkp-jump-map)
;; (define-key bookmark-bmenu-mode-map "j"  bmkp-jump-other-window-map)
;; (define-key bookmark-bmenu-mode-map "j>" 'bmkp-bmenu-jump-to-marked)  ; `j >'

;; (define-key bmkp-jump-map              "."    nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "."    nil) ; For Emacs 20
;; (define-key bmkp-jump-map              ".d"   'bmkp-dired-this-dir-jump)                 ; `C-x j . d'
;; (define-key bmkp-jump-other-window-map ".d"   'bmkp-dired-this-dir-jump-other-window)  ; `C-x 4 j . d'
;; (define-key bmkp-jump-map              ".f"   'bmkp-file-this-dir-jump)                  ; `C-x j . f'
;; (define-key bmkp-jump-other-window-map ".f"   'bmkp-file-this-dir-jump-other-window)   ; `C-x 4 j . f'

;; (define-key bmkp-jump-map              ","    nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map ","    nil) ; For Emacs 20
;; (define-key bmkp-jump-map              ",,"   'bmkp-this-buffer-jump)                    ; `C-x j , ,'
;; (define-key bmkp-jump-other-window-map ",,"   'bmkp-this-buffer-jump-other-window)     ; `C-x 4 j , ,'
;; (define-key bmkp-jump-map              ",#"   'bmkp-autonamed-this-buffer-jump)          ; `C-x j , #'
;; (define-key bmkp-jump-other-window-map ",#"
;;   'bmkp-autonamed-this-buffer-jump-other-window)                                       ; `C-x 4 j , #'

;; (define-key bmkp-jump-map              "#"    'bmkp-autonamed-jump)                        ; `C-x j #'
;; (define-key bmkp-jump-other-window-map "#"    'bmkp-autonamed-jump-other-window)         ; `C-x 4 j #'

;; (define-key bmkp-jump-map              "="    nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "="    nil) ; For Emacs 20
;; (define-key bmkp-jump-map              "=b"   'bmkp-specific-buffers-jump)                ; `C-x j = b'
;; (define-key bmkp-jump-other-window-map "=b"   'bmkp-specific-buffers-jump-other-window) ; `C-x 4 j = b'
;; (define-key bmkp-jump-map              "=f"   'bmkp-specific-files-jump)                  ; `C-x j = f'
;; (define-key bmkp-jump-other-window-map "=f"   'bmkp-specific-files-jump-other-window)   ; `C-x 4 j = f'

;; (define-key bmkp-jump-map              "a"    'bmkp-autofile-jump)                          ; `C-x j a'
;; (define-key bmkp-jump-other-window-map "a"    'bmkp-autofile-jump-other-window)           ; `C-x 4 j a'
;; (define-key bmkp-jump-map              "b"    'bmkp-non-file-jump)                          ; `C-x j b'
;; (define-key bmkp-jump-other-window-map "b"    'bmkp-non-file-jump-other-window)           ; `C-x 4 j b'
;; (define-key bmkp-jump-map              "B"    'bmkp-bookmark-list-jump)                     ; `C-x j B'
;; (define-key bmkp-jump-other-window-map "B"    'bmkp-bookmark-list-jump)     ; SAME COMMAND: `C-x 4 j B'
;; (define-key bmkp-jump-map              "d"    'bmkp-dired-jump)                             ; `C-x j d'
;; (define-key bmkp-jump-other-window-map "d"    'bmkp-dired-jump-other-window)              ; `C-x 4 j d'

;;     (define-key bmkp-jump-map              "e"  'bmkp-eww-jump)                             ; `C-x j e'
;;     (define-key bmkp-jump-other-window-map "e"  'bmkp-eww-jump-other-window)))            ; `C-x 4 j e'

;; (define-key bmkp-jump-map              "f"    'bmkp-file-jump)                              ; `C-x j f'
;; (define-key bmkp-jump-other-window-map "f"    'bmkp-file-jump-other-window)               ; `C-x 4 j f'
;; (define-key bmkp-jump-map              "\C-f" 'bmkp-find-file)                            ; `C-x j C-f'
;; (define-key bmkp-jump-other-window-map "\C-f" 'bmkp-find-file-other-window)             ; `C-x 4 j C-f'
;; (define-key bmkp-jump-map              "g"    'bmkp-gnus-jump)                              ; `C-x j g'
;; (define-key bmkp-jump-other-window-map "g"    'bmkp-gnus-jump-other-window)               ; `C-x 4 j g'
;; (define-key bmkp-jump-map              "h"    'bmkp-lighted-jump)                           ; `C-x j h'
;; (define-key bmkp-jump-other-window-map "h"    'bmkp-lighted-jump-other-window)            ; `C-x 4 j h'
;; (define-key bmkp-jump-map              "i"    'bmkp-info-jump)                              ; `C-x j i'
;; (define-key bmkp-jump-other-window-map "i"    'bmkp-info-jump-other-window)               ; `C-x 4 j i'
;; (define-key bmkp-jump-map              "\M-i" 'bmkp-image-jump)                           ; `C-x j M-i'
;; (define-key bmkp-jump-other-window-map "\M-i" 'bmkp-image-jump-other-window)            ; `C-x 4 j M-i'
;; (define-key bmkp-jump-map              "j"    'bookmark-jump)                               ; `C-x j j'
;; (put 'bookmark-jump :advertised-binding "\C-xjj")

;; (define-key bmkp-jump-other-window-map "j"    'bookmark-jump-other-window)                ; `C-x 4 j j'
;; (put 'bookmark-jump-other-window :advertised-binding "\C-x4jj")
;; (put 'jump-other :advertised-binding "\C-x4jj")

;; (define-key bmkp-jump-map              "K"    'bmkp-desktop-jump)                           ; `C-x j K'
;; (define-key bmkp-jump-other-window-map "K"    'bmkp-desktop-jump)           ; SAME COMMAND: `C-x 4 j K'
;; (define-key bmkp-jump-map              "l"    'bmkp-local-file-jump)                        ; `C-x j l'
;; (define-key bmkp-jump-other-window-map "l"    'bmkp-local-file-jump-other-window)         ; `C-x 4 j l'
;; (define-key bmkp-jump-map              "m"    'bmkp-man-jump)                               ; `C-x j m'
;; (define-key bmkp-jump-other-window-map "m"    'bmkp-man-jump-other-window)                ; `C-x 4 j m'
;; (define-key bmkp-jump-map              "n"    'bmkp-remote-file-jump)         ; `C-x j n' ("_n_etwork")
;; (define-key bmkp-jump-other-window-map "n"    'bmkp-remote-file-jump-other-window)        ; `C-x 4 j n'
;; (define-key bmkp-jump-map              "N"    'bmkp-jump-in-navlist)                        ; `C-x j N'
;; (define-key bmkp-jump-other-window-map "N"    'bmkp-jump-in-navlist-other-window)         ; `C-x 4 j N'
;; (define-key bmkp-jump-map              "r"    'bmkp-region-jump)                            ; `C-x j r'
;; (define-key bmkp-jump-other-window-map "r"    'bmkp-region-jump-other-window)             ; `C-x 4 j r'
;; (define-key bmkp-jump-other-window-map "R"
;;   'bmkp-region-jump-narrow-indirect-other-window)                                         ; `C-x 4 j R'

;; (define-key bmkp-jump-map              "t"    nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "t"    nil) ; For Emacs 20
;; (define-key bmkp-jump-map              "t*"   'bmkp-all-tags-jump)                        ; `C-x j t *'
;; (define-key bmkp-jump-other-window-map "t*"   'bmkp-all-tags-jump-other-window)         ; `C-x 4 j t *'
;; (define-key bmkp-jump-map              "t+"   'bmkp-some-tags-jump)                       ; `C-x j t +'
;; (define-key bmkp-jump-other-window-map "t+"   'bmkp-some-tags-jump-other-window)        ; `C-x 4 j t +'

;; (define-key bmkp-jump-map              "t%"   nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "t%"   nil) ; For Emacs 20
;; (define-key bmkp-jump-map              "t%*"  'bmkp-all-tags-regexp-jump)               ; `C-x j t % *'
;; (define-key bmkp-jump-other-window-map "t%*"
;;   'bmkp-all-tags-regexp-jump-other-window)                                            ; `C-x 4 j t % *'
;; (define-key bmkp-jump-map              "t%+"  'bmkp-some-tags-regexp-jump)              ; `C-x j t % +'
;; (define-key bmkp-jump-other-window-map "t%+"
;;   'bmkp-some-tags-regexp-jump-other-window)                                           ; `C-x 4 j t % +'

;; (define-key bmkp-jump-map              "t."   nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "t."   nil) ; For Emacs 20
;; (define-key bmkp-jump-map              "t.*" 'bmkp-file-this-dir-all-tags-jump)         ; `C-x j t . *'
;; (define-key bmkp-jump-other-window-map "t.*"
;;   'bmkp-file-this-dir-all-tags-jump-other-window)                                     ; `C-x 4 j t . *'
;; (define-key bmkp-jump-map              "t.+" 'bmkp-file-this-dir-some-tags-jump)        ; `C-x j t . +'
;; (define-key bmkp-jump-other-window-map "t.+"
;;   'bmkp-file-this-dir-some-tags-jump-other-window)                                    ; `C-x 4 j t . +'

;; (define-key bmkp-jump-map              "t.%" nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "t.%" nil) ; For Emacs 20
;; (define-key bmkp-jump-map              "t.%*"
;;   'bmkp-file-this-dir-all-tags-regexp-jump)                                           ; `C-x j t . % *'
;; (define-key bmkp-jump-other-window-map "t.%*"
;;   'bmkp-file-this-dir-all-tags-regexp-jump-other-window)                            ; `C-x 4 j t . % *'
;; (define-key bmkp-jump-map              "t.%+"
;;   'bmkp-file-this-dir-some-tags-regexp-jump)                                          ; `C-x j t . % +'
;; (define-key bmkp-jump-other-window-map "t.%+"
;;   'bmkp-file-this-dir-some-tags-regexp-jump-other-window)                           ; `C-x 4 j t . % +'


;; (define-key bmkp-jump-map              "ta"   nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "ta"   nil) ; For Emacs 20
;; (define-key bmkp-jump-map              "ta*"  'bmkp-autofile-all-tags-jump)             ; `C-x j t a *'
;; (define-key bmkp-jump-other-window-map "ta*"
;;   'bmkp-autofile-all-tags-jump-other-window)                                          ; `C-x 4 j t a *'
;; (define-key bmkp-jump-map              "ta+"  'bmkp-autofile-some-tags-jump)            ; `C-x j t a +'
;; (define-key bmkp-jump-other-window-map "ta+"
;;   'bmkp-autofile-some-tags-jump-other-window)                                         ; `C-x 4 j t a +'

;; (define-key bmkp-jump-map              "ta%"  nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "ta%"  nil) ; For Emacs 20
;; (define-key bmkp-jump-map              "ta%*" 'bmkp-autofile-all-tags-regexp-jump)    ; `C-x j t a % *'
;; (define-key bmkp-jump-other-window-map "ta%*"
;;   'bmkp-autofile-all-tags-regexp-jump-other-window)                                 ; `C-x 4 j t a % *'
;; (define-key bmkp-jump-map              "ta%+" 'bmkp-autofile-some-tags-regexp-jump)   ; `C-x j t a % +'
;; (define-key bmkp-jump-other-window-map "ta%+"
;;   'bmkp-autofile-some-tags-regexp-jump-other-window)                                ; `C-x 4 j t a % +'

;; (define-key bmkp-jump-map              "tf"   nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "tf"   nil) ; For Emacs 20
;; (define-key bmkp-jump-map              "tf*"  'bmkp-file-all-tags-jump)                 ; `C-x j t f *'
;; (define-key bmkp-jump-other-window-map "tf*"  'bmkp-file-all-tags-jump-other-window)  ; `C-x 4 j t f *'
;; (define-key bmkp-jump-map              "tf+"  'bmkp-file-some-tags-jump)                ; `C-x j t f +'
;; (define-key bmkp-jump-other-window-map "tf+"  'bmkp-file-some-tags-jump-other-window) ; `C-x 4 j t f +'

;; (define-key bmkp-jump-map              "tf%"  nil) ; For Emacs 20
;; (define-key bmkp-jump-other-window-map "tf%"  nil) ; For Emacs 20
;; (define-key bmkp-jump-map              "tf%*" 'bmkp-file-all-tags-regexp-jump)        ; `C-x j t f % *'
;; (define-key bmkp-jump-other-window-map "tf%*"
;;   'bmkp-file-all-tags-regexp-jump-other-window)                                     ; `C-x 4 j t f % *'
;; (define-key bmkp-jump-map              "tf%+" 'bmkp-file-some-tags-regexp-jump)       ; `C-x j t f % +'
;; (define-key bmkp-jump-other-window-map "tf%+"
;;   'bmkp-file-some-tags-regexp-jump-other-window)                                    ; `C-x 4 j t f % +'

;; (when (> emacs-major-version 21)        ; Needs `read-file-name' with a PREDICATE arg.
;;   (define-key bmkp-jump-map              "t\C-f*" 'bmkp-find-file-all-tags)           ; `C-x j t C-f *'
;;   (define-key bmkp-jump-other-window-map "t\C-f*"
;;     'bmkp-find-file-all-tags-other-window)                                          ; `C-x 4 j t C-f *'
;;   (define-key bmkp-jump-map              "t\C-f+" 'bmkp-find-file-some-tags)          ; `C-x j t C-f +'
;;   (define-key bmkp-jump-other-window-map "t\C-f+"
;;     'bmkp-find-file-some-tags-other-window)                                         ; `C-x 4 j t C-f +'
;;   (define-key bmkp-jump-map              "t\C-f%*" 'bmkp-find-file-all-tags-regexp) ; `C-x j t C-f % *'
;;   (define-key bmkp-jump-other-window-map "t\C-f%*"
;;     'bmkp-find-file-all-tags-regexp-other-window)                                 ; `C-x 4 j t C-f % *'
;;   (define-key bmkp-jump-map              "t\C-f%+"
;;     'bmkp-find-file-some-tags-regexp)                                               ; `C-x j t C-f % +'
;;   (define-key bmkp-jump-other-window-map "t\C-f%+"
;;     'bmkp-find-file-some-tags-regexp-other-window))                               ; `C-x 4 j t C-f % +'

;; (define-key bmkp-jump-map              "u"    'bmkp-url-jump)                               ; `C-x j u'
;; (define-key bmkp-jump-other-window-map "u"    'bmkp-url-jump-other-window)                ; `C-x 4 j u'
;; (define-key bmkp-jump-map              "v"    'bmkp-variable-list-jump)                     ; `C-x j v'
;; (define-key bmkp-jump-map              "w"    'bmkp-w3m-jump)                               ; `C-x j w'
;; (define-key bmkp-jump-other-window-map "w"    'bmkp-w3m-jump-other-window)                ; `C-x 4 j w'
;; (define-key bmkp-jump-map              "\M-w" 'bmkp-snippet-to-kill-ring)                 ; `C-x j M-w'
;; (define-key bmkp-jump-other-window-map "\M-w" 'bmkp-snippet-to-kill-ring)     ; SAME CMD: `C-x 4 j M-w'
;; (define-key bmkp-jump-map              "x"    'bmkp-temporary-jump)                         ; `C-x j x'
;; (define-key bmkp-jump-other-window-map "x"    'bmkp-temporary-jump-other-window)          ; `C-x 4 j x'
;; (define-key bmkp-jump-map              "y"    'bmkp-bookmark-file-jump)                     ; `C-x j y'
;; (define-key bmkp-jump-map              ":"    'bmkp-jump-to-type)                           ; `C-x j :'
;; (define-key bmkp-jump-other-window-map ":"    'bmkp-jump-to-type-other-window)            ; `C-x 4 j :'

