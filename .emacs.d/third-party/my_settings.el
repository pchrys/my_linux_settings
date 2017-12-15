
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

(setq
 ;;helm-gtags-path-style 'relative
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key (kbd "C-c t") 
 helm-gtags-suggested-key-mapping t
 )

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

(require 'bookmark)
;(bookmark-bmenu-list)
;(switch-to-buffer "*Bookmark List*")
(setq bookmark-save-flag 1)

(setq bmkp-bookmark-map-prefix-keys (list (kbd "C-c b"))
      bmkp-jump-map-prefix-keys (list (kbd "C-c b j"))
      bmkp-jump-other-window-map-prefix-keys (list (kbd "C-c b 4 j"))
)

(defun open-next-line (arg)
  "Move to the next line and then opens a line.
    See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (indent-according-to-mode))

(global-set-key (kbd "C-c l o") 'open-next-line)

(defun open-previous-line (arg)
  "Open a new line before the current one. 
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))

(global-set-key (kbd "C-c l O") 'open-previous-line)

(defun copy-current-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
          (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;; optional key binding
(global-set-key (kbd "C-c y l") 'copy-current-line)

(defun kill-current-line(arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-region (line-beginning-position)
          (line-beginning-position (+ 1 arg)))
  (message "%d line%s deleted" arg (if (= 1 arg) "" "s")))

;; optional key binding

(global-set-key (kbd "C-c d l") 'kill-current-line)

(defun copy-current-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
          (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;; optional key binding
(global-set-key (kbd "C-c y l") 'copy-current-line)

(defun kill-current-line(arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-region (line-beginning-position)
          (line-beginning-position (+ 1 arg)))
  (message "%d line%s deleted" arg (if (= 1 arg) "" "s")))

;; optional key binding
(global-set-key (kbd "C-c d l") 'kill-current-line)

(defun copy-current-word(&optional arg)
  "Copy the word under cursor."
  (interactive "p")
   (setq bounds (bounds-of-thing-at-point 'word))
   (setq beg (car bounds))
   (setq end (cdr bounds))
   (kill-ring-save beg end)
)

(defun kill-current-word(&optional arg)
  "kill the word under cursor."
  (interactive "p")
   (setq bounds (bounds-of-thing-at-point 'word))
   (setq beg (car bounds))
   (setq end (cdr bounds))
   (kill-region beg end)
)

;(global-set-key (kbd "C-c w y") 'copy-current-word)
;(global-set-key (kbd "C-c w d") 'kill-current-word)

(global-set-key (kbd "C-c y w") 'copy-current-word)
(global-set-key (kbd "C-c d w") 'kill-current-word)

(defun copy-current-sexp(&optional arg)
  "Copy the word under cursor."
  (interactive "p")
   (setq bounds (bounds-of-thing-at-point 'sexp))
   (setq beg (car bounds))
   (setq end (cdr bounds))
   (kill-ring-save beg end)
)

(defun kill-current-sexp(&optional arg)
  "kill the word under cursor."
  (interactive "p")
   (setq bounds (bounds-of-thing-at-point 'sexp))
   (setq beg (car bounds))
   (setq end (cdr bounds))
   (kill-region beg end)
)

(global-set-key (kbd "C-c y s") 'copy-current-sexp)
(global-set-key (kbd "C-c d s") 'kill-current-sexp)

(defun copy-current-sentence(&optional arg)
  "Copy the word under cursor."
  (interactive "p")
   (setq bounds (bounds-of-thing-at-point 'sentence))
   (setq beg (car bounds))
   (setq end (cdr bounds))
   (kill-ring-save beg end)
)

(defun kill-current-sentence(&optional arg)
  "kill the word under cursor."
  (interactive "p")
   (setq bounds (bounds-of-thing-at-point 'sentence))
   (setq beg (car bounds))
   (setq end (cdr bounds))
   (kill-region beg end)
)

(global-set-key (kbd "C-c y S") 'copy-current-sentence)
(global-set-key (kbd "C-c d S") 'kill-current-sentence)

(defun copy-current-parenthesis(&optional arg)
  "Copy content inside parenthesis"
  (interactive "p")

   (setq bounds (bounds-of-thing-at-point 'list))
   (setq beg (+ (car bounds) 1))
   (setq end (- (cdr bounds) 1))
   (kill-ring-save beg end)
)

(defun kill-current-parenthesis(&optional arg)
  "Kill content inside parenthesis"
  (interactive "p")
   (setq bounds (bounds-of-thing-at-point 'list))
   (setq beg (+ (car bounds) 1))
   (setq end (- (cdr bounds) 1))
   (kill-region beg end)
)


(defun copy-current-parenthesis-p(&optional arg)
  "Copy content inside parenthesis, including parenthesis"
  (interactive "p")

   (setq bounds (bounds-of-thing-at-point 'list))
   (setq beg (car bounds))
   (setq end (cdr bounds))
   (kill-ring-save beg end)
)

(defun kill-current-parenthesis-p(&optional arg)
  "Kill content inside parenthesis, including parenthesis"
  (interactive "p")
   (setq bounds (bounds-of-thing-at-point 'list))
   (setq beg (car bounds))
   (setq end (cdr bounds))
   (kill-region beg end)
)

(global-set-key (kbd "C-c y p") 'copy-current-parenthesis)
(global-set-key (kbd "C-c d p") 'kill-current-parenthesis)

(global-set-key (kbd "C-c y P") 'copy-current-parenthesis-p)
(global-set-key (kbd "C-c d P") 'kill-current-parenthesis-p)

(defun my-move-to-top(&optional arg)
  (interactive "p")
  (move-to-window-line 0) 
)

(defun my-move-to-middle(&optional arg)
  (interactive "p")
  (move-to-window-line nil) 
)

(defun my-move-to-bottom(&optional arg)
  (interactive "p")
  (move-to-window-line -1) 
)

(global-set-key (kbd "C-c w t") 'my-move-to-top)   ;;;top of the screen
(global-set-key (kbd "C-c w m") 'my-move-to-middle)   ;;;middle of the screen
(global-set-key (kbd "C-c w b") 'my-move-to-bottom)   ;;;bottom of the screen


;;; move to the current line to the top/middle/bottom of the screen 

(defun my-move-line-to-top(&optional arg)
  (interactive "p")
  (recenter 0.0) 
)

(defun my-move-line-to-middle(&optional arg)
  (interactive "p")
  (recenter) 
)

(defun my-move-line-to-bottom(&optional arg)
  (interactive "p")
  (recenter -1) 
)

(global-set-key (kbd "C-c l t") 'my-move-line-to-top)   ;;;move the line to the top of the screen
(global-set-key (kbd "C-c l m") 'recenter)              ;;;move the line to the middle of the screen
(global-set-key (kbd "C-c l b") 'my-move-line-to-bottom) ;;;move the line to the bottom of the screen
