(prefer-coding-system 'utf-8)
(require 'package)
(require 'cl-lib)
(require 'server)

;;env
(defconst +PORT+ (string-to-number (getenv "OPENSHIFT_EMACS_HTTP_PORT")))
(defconst +HOST+ (getenv "OPENSHIFT_EMACS_HTTP_IP"))

(defvar *dependencies* '(
                         elnode
                         ))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)
(package-refresh-contents)

(dolist (dependency *dependencies*)
  (unless (package-installed-p dependency)
    (package-install dependency))
    (require dependency))

;; bootstrap
(server-start)
(require 'elnode)
(setq elnode-init-port nil)
(setq elnode--do-error-logging nil)
(setq elnode-log-files-directory (concat (getenv "OPENSHIFT_REPO_DIR") "/log"))
(print (concat "elnode logs :" elnode-log-files-directory "\n"))

;; users code
(let ((init-el (concat (getenv "OPENSHIFT_REPO_DIR") "/init.el")))
  (if (file-exists-p init-el)
      (progn
        (print "load init.el")
        (load-file init-el))
    (progn
      (print "not exists init.el\n")
      (kill-emacs))))
