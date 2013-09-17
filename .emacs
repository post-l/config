;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (tango-dark)))
 '(flycheck-highlighting-mode (quote lines))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 '(inhibit-startup-message t)
 '(save-abbrevs nil)
 '(show-trailing-whitespace t)
 '(suggest-key-bindings t)
 '(vc-follow-symlinks t)
 '(font-lock-maximum-decoration t)
 '(make-backup-files nil)
 '(column-number-mode t)
 '(line-number-mode t)
 '(global-auto-complete-mode t)
 '(global-font-lock-mode t))

(add-to-list 'load-path "~/.emacs.d")
(require 'smooth-scrolling)
(display-time)
(load-library "paren")
(show-paren-mode 1)
(add-hook 'write-file-functions 'delete-trailing-whitespace)

(load-file "~/.emacs.d/std_comment.el")

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------

(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; ------------------------
;; -- Bind configuration --
;; ------------------------

;; Run compile when you press F5
(global-set-key (kbd "<f5>") 'compile)

;; replace on f9
(global-set-key [f9] 'query-replace)
(global-set-key [shift f9] 'query-replace-regexp)

;; Use Shift + the arrow keys to move between windows in a frame
(when (fboundp 'windmove-default-keybindings)
            (windmove-default-keybindings 'meta))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error-face ((t (:inherit error :background "gray27" :foreground "IndianRed1" :underline (:color "red" :style wave)))))
 '(flycheck-warning-face ((t (:inherit warning :foreground "yellow1")))))


;;http://emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(ido-mode t)

(setq python-indent-guess-indent-offset nil)

;;set ipython as default python shell
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;;add colors to shell
(setq ansi-term-color-vector [unspecified "#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#DD6600" "#dc8cc3" "#93e0e3" "#dcdccc"])

;;package archive
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


;;el-get
;;https://github.com/dimitri/el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)

;;enable jedi autocompletion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;;enable flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'autopair)
(autopair-global-mode)
