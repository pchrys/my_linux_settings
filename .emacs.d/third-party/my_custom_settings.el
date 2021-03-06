;;; define some custom functions and key bindings
;;;==========================================================

;; open new line like in vi
;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
    See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (indent-according-to-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current one. 
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))

;; C-a C-o
;; C-e C-o
(global-set-key (kbd "C-c l o") 'open-next-line)
(global-set-key (kbd "C-c l O") 'open-previous-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  copy/kill lines

(defun copy-current-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
          (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;; optional key binding
(global-set-key (kbd "C-c y l") 'copy-current-line)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun kill-current-line(arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-region (line-beginning-position)
          (line-beginning-position (+ 1 arg)))
  (message "%d line%s deleted" arg (if (= 1 arg) "" "s")))

;; optional key binding
(global-set-key (kbd "C-c d l") 'kill-current-line)

;;;==========================================================
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

;;;  (defun copy-sexp-as-kill (&optional arg)
;;;    "Save the sexp following point to the kill ring.
;;;  ARG has the same meaning as for `kill-sexp'."
;;;    (interactive "p")
;;;    (save-excursion
;;;      (let ((orig-point (point)))
;;;        (forward-sexp (or arg 1))
;;;        (kill-ring-save orig-point (point)))))

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
;;;========================================================================
;;;    (defun copy-current-parenthesis(&optional arg)
;;;      "Copy content inside parenthesis"
;;;      (interactive "p")
;;;    
;;;      (save-excursion
;;;          (if (not (string-equal (char-to-string (char-after (point))) "("))
;;;              (search-backward "(")
;;;          )
;;;    
;;;          (let ((beg (+ (point) 1)))
;;;                (search-forward ")")
;;;                (kill-ring-save beg (- (point) 1))
;;;           )
;;;      )
;;;    )
;;;    
;;;    (defun kill-current-parenthesis(&optional arg)
;;;      "Kill content inside parenthesis"
;;;      (interactive "p")
;;;    
;;;      (save-excursion
;;;          (if (not (string-equal (char-to-string (char-after (point))) "("))
;;;              (search-backward "(")
;;;          )
;;;    
;;;          (let ((beg (+ (point) 1)))
;;;                (search-forward ")")
;;;                (kill-region  beg (- (point) 1))
;;;          )
;;;      )
;;;    )
;;;    
;;;    (global-set-key (kbd "C-c y p") 'copy-current-parenthesis)
;;;    (global-set-key (kbd "C-c d p") 'kill-current-parenthesis)

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

;;;==========================================================


(global-unset-key (kbd "C-a"))
(global-unset-key (kbd "C-e"))
(global-unset-key (kbd "M-a"))
(global-unset-key (kbd "M-e"))


(global-set-key (kbd "M-a l") 'move-beginning-of-line)
(global-set-key (kbd "M-e l") 'move-end-of-line)

(global-set-key (kbd "M-a S") 'c-beginning-of-statement)
(global-set-key (kbd "M-e S") 'c-end-of-statement)


(global-set-key (kbd "M-a s") 'backward-sexp)
(global-set-key (kbd "M-e s") 'forward-sexp)


(global-set-key (kbd "M-a f") 'c-beginning-of-defun)
(global-set-key (kbd "M-e f") 'c-end-of-defun)


(global-set-key (kbd "M-a p") 'backward-paragraph)
(global-set-key (kbd "M-e p") 'forward-paragraph)

(global-set-key (kbd "M-a P") 'backward-page)
(global-set-key (kbd "M-e P") 'forward-page)


(global-set-key (kbd "M-a g") 'beginning-of-buffer)
(global-set-key (kbd "M-e g") 'end-of-buffer)


;;; use C-a, and C-e to move forth/back one char
(global-unset-key (kbd "C-b"))
(global-unset-key (kbd "C-f"))
(global-set-key (kbd "C-a") 'backward-char)
(global-set-key (kbd "C-e") 'forward-char)


;;;use C-b and C-f to scroll to next/previous screen
;;(global-unset-key (kbd "C-v"))
;;(global-unset-key (kbd "M-v"))

;;;originally binding on move back/forth over sexp
(global-unset-key (kbd "C-M-b"))
(global-unset-key (kbd "C-M-f"))

(global-set-key (kbd "C-b") 'scroll-down-command)
(global-set-key (kbd "C-f") 'scroll-up-command)

(global-set-key (kbd "C-M-f") 'scroll-other-window)
(global-set-key (kbd "C-M-b") 'scroll-other-window-down)



;;;;=======================================================
;;; move to the top/middle/bottom of the screen 
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




