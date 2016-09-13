;; User info
(setq user-full-name "Chris Frank"
      user-mail-address "chris@cfrank.org")

;; Disable some simple display early
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Disable Splash
(setq inhibit-startup-message t)

;; Set up path to ext files
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs-set settings seperate
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Load theme
(require 'theme-settings)

;; Load packages
(require 'package-setup)

;; Install packages
;;(require 'package-install)


