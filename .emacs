  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default defaultb italic underline success warning error])
 '(c-basic-offset (quote set-from-style))
 '(c-default-style
   (quote
    ((c-mode . "k&r")
     (c++-mode . "stroustrup")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(erc-fill-column 55)
 '(tool-bar-mode nil))
  
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;;fullscreen
(when (display-graphic-p)
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

;;mac keys (set M as CMD)
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;;inhibits osx buffer swipe
(global-set-key [swipe-left] 'ignore)
(global-set-key [swipe-right] 'ignore)
 
;;Remove startup message
(setq inhibit-startup-message t)
;;add column to mode-line
(setq column-number-mode t)

;;ido
(require 'ido)
(ido-mode t)

;;Zone
;;(require 'zone)
;;(zone-when-idle (/ 3600 4))

;;add tex to path
;;TODO add qt
(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)
(setenv "PATH" "/opt/local/libexec/qt4/bin/:$PATH" t)

;;CHESS CONFIG
(setq chess-default-display '(chess-plain))

;;ERC
(load "~/.emacs.d/erc-conf.el")

;;slime (common lisp)
(setq inferior-lisp-program  "/usr/local/Cellar/clozure-cl/1.11/bin/ccl64")
(setq slime-contribs '(slime-fancy))
(show-paren-mode 1)
(setq show-paren-delay 0)

;;c mode stuff
;;TODO add c++ linum and stuff to c mode
;;set ah (aspectC++) files to cpp 
(add-to-list 'auto-mode-alist '("\\.ah\\'" . c++-mode))
;;linum mode
(defun linum-hook () 
  (linum-mode 1)) 
(add-hook 'c++-mode-hook 'linum-hook)
;;add column enforce mode
(defun column-enforce-hook ()
  (column-enforce-mode 1))
(add-hook 'c++-mode-hook 'column-enforce-hook)
;;indent comments like code blocks
(c-set-offset 'comment-intro 0)

(defun tab-hook ()
	(setq c-basic-offset 4)
	(setq tab-width 4)
	(setq indent-tabs-mode t))
(add-hook 'c-mode-hook 'tab-hook)

;;auto-complete
;;http://stackoverflow.com/questions/23232982/emacs-cannot-load-auto-complete-package
(package-initialize)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/elpa/auto-complete-20160229.1706/dict")
(ac-config-default)
(require 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-source-c-headers)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(eval-after-load "web-mode"
  '(set-face-background 'web-mode-current-element-highlight-face "red"))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-hook 'racket-mode-hook 'linum-hook)
(setq racket-racket-program "/Applications/Racket v6.4/bin/racket")
(setq racket-raco-program "/Applications/Racket v6.4/bin/raco")
