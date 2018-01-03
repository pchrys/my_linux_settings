(require 'gnus)
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;;read html mail
;;(setq mm-text-html-renderer 'w3m)

;;read mail offline
(setq gnus-use-cache t)

;;set up directory for mail cache
(setq gnus-cache-directory 
      (let* ((my-mail-backup-directory (expand-file-name "~/mail/cache")))
	(unless (file-directory-p my-mail-backup-directory)
	  (make-directory my-mail-backup-directory t)
	  )
	my-mail-backup-directory
	)
)

;; The entering/removal of articles from the cache is controlled by the
;; gnus-cache-enter-articles and gnus-cache-remove-articles variables.
;; Both are lists of symbols. The first is (ticked dormant) by default,
;; meaning that ticked and dormant articles will be put in the cache.
;; The latter is (read) by default, meaning that articles marked as
;; read are removed from the cache. Possibly symbols in these two lists
;; are ticked, dormant, unread and read.

;(setq gnus-select-method '(nntp "news.gmane.org"))

(setq gnus-select-method
      '(nnimap "gmail"
	       (nnimap-address "imap.gmail.com")  ; it could also be imap.googlemail.com if that's your server.
	       (nnimap-server-port "imaps")
	       (nnimap-stream ssl)
               (nnimap-authinfo-file (expand-file-name "~/.authinfo.gpg")))
)

;;;set up multiple email accounts
(setq gnus-secondary-select-methods
      '((nnimap "hotmail"
       (nnimap-address "imap-mail.outlook.com")
       (nnimap-server-port 993)
       (nnimap-stream ssl)
       (nnimap-authinfo-file (expand-file-name "~/.authinfo.gpg")))
    
       ;; (nnimap "gmail"
       ;; (nnimap-address "imap.gmail.com")
       ;; (nnimap-server-port 993)
       ;; (nnimap-stream ssl)
       ;; (nnimap-authinfo-file "~/.authinfo.gpg"))

       (nnimap "gmail12"
       (nnimap-address "imap.gmail.com")
       (nnimap-server-port 993)
       (nnimap-stream ssl)
       (nnimap-authinfo-file (expand-file-name "~/.authinfo.gpg")))
  
       (nnimap "yahoo6"
       (nnimap-address "imap.mail.yahoo.com")
       (nnimap-server-port 993)
       (nnimap-stream ssl)
       (nnimap-authinfo-file (expand-file-name "~/.authinfo.gpg")))
       )
)

;;; setting up multiple acounts for sending out emails
;;; reference https://www.emacswiki.org/emacs/MultipleSMTPAccounts

(require 'cl)
(require 'smtpmail)

;; if we set smtpmail-stream-type to ssl, we get some erorrs, so we use
;; starttls instead 
;; after installing gnutls first by sudo apt-get install gnutls-bin, still have isues.
;; (setq smtpmail-stream-type 'ssl) ;; If using TLS/SSL.  Use C-h v smtpmail-stream-type RET to see possible values
(setq smtpmail-stream-type 'starttls)

(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-debug-info t) ; only to debug problems

;;; format for accounts
;;; ("email address"  "name"  "server" "port")
(setq smtp-accounts
      '(("lewtiob@gmail.com"         "lewtiob"       "smtp.gmail.com"        587)
	("shaoboliu2012@gmail.com"   "Shaobo Liu"    "smtp.gmail.com"        587)
	("pchrys6@yahoo.com"         "Pchrys"        "smtp.mail.yahoo.com"   587)
	("lewtiob@hotmail.com"       "lewtiob"       "smtp-mail.outlook.com" 587)
      )
)

(defun my-change-smtp ()
  (save-excursion
    (loop with from = (save-restriction
                        (message-narrow-to-headers)
                        (message-fetch-field "from"))
          for (addr fname server port) in smtp-accounts
          when (string-match addr from)
          do (setq user-mail-address addr
                   user-full-name fname
                   smtpmail-smtp-user addr
                   smtpmail-smtp-server server
		   smtpmail-smtp-service port)))
)

(defadvice smtpmail-via-smtp
  (before change-smtp-by-message-from-field (recipient buffer &optional ask) activate)
  (with-current-buffer buffer (my-change-smtp)))


(setq user-mail-address "lewtiob@gmail.com"
      user-full-name "lewtiob"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
)

;; save sent copy on the server
(setq gnus-message-archive-group "nnimap:Sent")
;; (setq gnus-message-archive-group
;;       '((".*" "nnimap:Sent"))
;; )

;;;; toggle From field
(setq private-account "shaoboliu2012@gmail.com"
      work-account "shaobo.liu@navico.com"
      )
(defun toggle-mail-from-field ()
  (interactive)
  (if (string= private-account user-mail-address)
    (setq user-mail-address work-account)
    (setq user-mail-address private-account)
   )
  
  (message "Mail FROM: %s" user-mail-address)
)


(require 'ido)
(setq email-accounts '("shaoboliu2012@gmail.com"
		       "lewtiob@gmail.com"
		       "pchrys6@yahoo.com"
		       "lewtiob@hotmail.com"
		       "shaobo.liu@navico.com"))

(defun my-choose-mail-from-field ()
  "Prompt user to pick a choice from a list."
  (interactive)
  ;; (setq user-mail-address
  ;; 	(message "%s" (ido-completing-read "Send From:" email-accounts )))
  (setq user-mail-address
	(format "%s" (completing-read "Send From:" email-accounts )))
  
  (message "Mail FROM: %s" user-mail-address)
)

;; optional key binding
(global-set-key (kbd "C-c m f") 'my-choose-mail-from-field)
