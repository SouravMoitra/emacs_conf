;; remove startup meassage
(setq inhibit-startup-message t)


(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren nil)
(global-set-key (kbd "C-c r r") 'inf-ruby)
(global-set-key (kbd "C-c r v m") 'rvm-activate-corresponding-ruby)
(projectile-global-mode)
(add-hook 'ruby-mode-hook 'projectile-on)
;; Display ido results vertically, rather than horizontally
  (setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
  (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
  (defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
  (add-hook 'ido-setup-hook 'ido-define-keys)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))
(global-company-mode t)
(push 'company-robe company-backends)
;; From kreeti
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(setq delete-trailing-lines t)
(define-key global-map (kbd "RET") 'newline-and-indent)
;;tabs are evil, don't want tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default css-mode-indent-depth 2)
(setq-default js-indent-level 2)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)


;;Line number
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
(global-linum-mode 1)

;; beautify

;;Syntax highlighting, can we say yes please?
(global-font-lock-mode t)

;Lets us see col # at the bottom. very handy.
(column-number-mode 1)

;buffer-name completion for C-x b; makes life much easier.
(iswitchb-mode 1)



;;;; Removes gui elements ;;;;
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))  ; no gui scrollbar


;;;; color theme...use zenburn ;;;;
(require 'color-theme)
(require 'zenburn)
(color-theme-initialize)
(zenburn)

;; haml

(add-hook 'haml-mode-hook
               (lambda ()
                 (setq indent-tabs-mode nil)
                 (define-key haml-mode-map "\C-m" 'newline-and-indent)))
