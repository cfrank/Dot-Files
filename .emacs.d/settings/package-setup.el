(require 'package)
(require 'dash)

;; Add melpa
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq package-pinned-packages '())

(package-initialize)
