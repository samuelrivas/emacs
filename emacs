;; EQC Emacs Mode -- Configuration Start
(add-to-list 'load-path "/home/samuel/local/root_R13B04/lib/erlang/lib/eqc-1.20.1/emacs/")
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir "/home/samuel/local/root_R13B04/lib/erlang/lib/eqc-1.20.1")
;; EQC Emacs Mode -- Configuration End


; Several customisations
;========================

; Minor modes
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode t)
(global-font-lock-mode t)
(transient-mark-mode t)
(delete-selection-mode t)
(show-paren-mode t)
(blink-cursor-mode -1)
(auto-fill-mode t)
(setq user-full-name "Samuel Rivas")

; Key bindings
(global-set-key "\M-g" 'goto-line)

; Global variables
(setq-default show-trailing-whitespace t)
(setq-default fill-column 80)
(setq inhibit-splash-screen t)
(setq indent-tabs-mode nil)
(setq vc-handled-backends nil)

; Do not interpret utf-8 eight-bit codes as M-character (old workaround)
; (set-keyboard-coding-system 'mule-utf-8)

; Major modes
;=============
(setq auto-mode-alist
      (cons '("mutt-.*" . mail-mode) auto-mode-alist))

(setq auto-mode-alist
      (cons '("svn-commit*" . text-mode)
	    auto-mode-alist))

(setq auto-mode-alist
      (cons '("COMMIT*" . text-mode)
	    auto-mode-alist))

; Mail mode
(defun my-mail-mode-hook ()
  "Mail mode hook"
  (flyspell-mode t)
  (ispell-change-dictionary "castellano")
  (auto-fill-mode t))

(add-hook 'mail-mode-hook 'my-mail-mode-hook)

; Erlang mode
;; (setq load-path (cons "/home/samuel/local/usr/share/site-lisp/erlang" load-path))
;; (setq erlang-root-dir "/home/samuel/local/src/otp")
;; (setq erlang-exec-path exec-path)
;; (require 'erlang-start)

(defun my-erlang-mode-hook ()
  "Erlang mode hook"
  (setq indent-tabs-mode nil)
  (auto-fill-mode)
  (flyspell-prog-mode)
  (ispell-change-dictionary "british"))

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

;; (add-hook 'erlang-mode-hook 'my-erlang-mode-hook)
(setq load-path (cons "/home/samuel/local/root_R14B/lib/erlang/lib/tools-2.6.6.1/emacs" load-path))
(setq load-path (cons "/home/samuel/local/share/wrangler/elisp" load-path))
(setq erlang-skel-mail-address "samuel.rivas@lambdastream.com")
;(load-file "/home/samuel/local/share/wrangler/elisp/graphviz-dot-mode.el")
(require 'erlang-start)
(require 'wrangler)

; LaTeX mode
;; Triky load of auctex (loads only for emacs21 in debian ...)
;; That was fixed in ubuntu, commented out
;; (load "/usr/share/emacs21/site-lisp/auctex.el" nil t t)
(defun my-latex-mode-hook ()
  "LaTeX mode hook"
  (local-set-key "\C-c\C-c" 'comment-region)
  (local-set-key "\C-c\C-u" 'uncomment-region)
  (flyspell-mode t)
  (ispell-change-dictionary "british")
  (auto-fill-mode t))

(add-hook 'LaTeX-mode-hook 'my-latex-mode-hook)

; C mode
(defun my-c-mode-hook ()
  (flyspell-prog-mode)
  (auto-fill-mode)
  (setq indent-tabs-mode nil)
  (setq comment-start "//")
  (setq comment-end "")
  (local-set-key "\C-c\C-u" 'uncomment-region))

(add-hook 'c-mode-hook 'my-c-mode-hook)

; SCons mode
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode)
	    (cons '("SConscript" . python-mode)
		  auto-mode-alist)))

; Text mode
(defun my-text-mode-hook ()
  (ispell-change-dictionary "british")
  (auto-fill-mode t)
  (flyspell-mode t))

(add-hook 'text-mode-hook 'my-text-mode-hook)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(dirs-to-monitor (quote ("/home/samuel/projects/Erlambda/lib/testframe/trunk" "/home/samuel/projects/Erlambda/lib/lambdastd/trunk" "/home/samuel/projects/Erlambda/lib/lamprea/trunk" "/home/samuel/tmp/clam_test_rework/lib/lambdastd" "/home/samuel/projects/psi_stuff/lib")))
 '(refac-monitor-repository-path "/home/samuel/local/var/wrangler/monitor")
 '(version-control-system (quote Git)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
