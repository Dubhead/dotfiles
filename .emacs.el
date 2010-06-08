; .emacs.el

(add-to-list 'load-path "~/.emacs.d/")

(require 'wordcaps)

(autoload 'dmacro-exec "dmacro" nil t)

(autoload 'bubble-buffer "bubble" nil t)

(require 'bm)

; (server-start)	; emacsclient

(require 'iswitchb)
(iswitchb-mode t)
(setq iswitchb-buffer-ignore '("^ " "\\*Messages\\*" "\\*Completions\\*"))
;
; Why does this ignore *scratch*?
; (setq iswitchb-buffer-ignore '("^*[A-Z]" "^ "))

(setq skk-byte-compile-init-file t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

; bubble-buffer
(setq bubble-skip-regexp "^[ *]")

; highlight current line
(require 'hl-line)
(global-hl-line-mode t)

; language
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)

(blink-cursor-mode 0)

(fset 'yes-or-no-p 'y-or-n-p)
; or: (defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-x\C-b" '(lambda () (interactive) (buffer-menu t)))
(global-set-key "\C-z" 'scroll-down)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)
(global-set-key "\M-[" 'highlight-changes-previous-change)
(global-set-key "\M-]" 'highlight-changes-next-change)
(global-set-key "\M-c" 'turn-on-wordcap)

(global-set-key [?\C--] 'other-window)
(global-set-key [?\C-0] 'delete-window)
(global-set-key [?\C-1] 'delete-other-windows)
(global-set-key [?\C-2] 'split-window-vertically)
(global-set-key [?\C-4]
 '(lambda ()
    (interactive)
    (if selective-display (set-selective-display nil)
      (back-to-indentation)
      (set-selective-display (+ (current-column) 1)))))
(global-set-key [?\C-6] 'bubble-buffer)
(global-set-key [?\C-9] 'insert-parentheses)

; dmacro
(defconst *dmacro-key* [?\M-z] "繰り返し指定キー")
(global-set-key *dmacro-key* 'dmacro-exec)

; bm.el
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
(setq bm-highlight-style 'bm-highlight-only-fringe)

(define-key emacs-lisp-mode-map "\C-c\C-c" 'emacs-lisp-byte-compile)

(add-hook 'view-mode-hook
	  '(lambda ()
	     (define-key view-mode-map (kbd "b") 'scroll-down)
	     (define-key view-mode-map (kbd "C-b") 'scroll-down)))

(add-hook 'isearch-mode-hook
	  (lambda () (define-key isearch-mode-map "\C-h" 'isearch-delete-char)))

(global-highlight-changes-mode t)
; (add-hook 'after-save-hook 'highlight-changes-rotate-faces)
(defun my-highlight-changes-remove-highlight (&optional placeholder)
  "Delete all highlights for changes."
  (interactive "P")
  (highlight-changes-remove-highlight (point-min) (point-max))
  (set-buffer-modified-p nil))
(add-hook 'after-save-hook
	  '(lambda () (my-highlight-changes-remove-highlight)))

(defun my-ctrl-w (&optional arg)
  "If the region is active, kill it.  Otherwise, kill the last word."
  (interactive "p")
  (if mark-active			; (region-active-p) for XEmacs
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
(global-set-key "\C-w" 'my-ctrl-w)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "/tmp"))))
 '(backward-delete-char-untabify-method nil)
 '(c-basic-offset 4)
 '(c-default-style (quote ((java-mode . "java") (other . "python"))))
 '(case-fold-search nil)
 '(change-log-default-name "~/ChangeLog")
 '(current-language-environment "Japanese")
 '(default-indicate-empty-lines t t)
 '(default-input-method "japanese-skk")
 '(delete-selection-mode t nil (delsel))
 '(diff-switches "-u")
 '(frame-title-format (quote (buffer-file-name "%f - Emacs" ("%b - Emacs"))) t)
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-move-visual nil)
 '(line-number-mode nil)
 '(menu-bar-mode nil)
 '(require-final-newline (quote ask))
 '(scroll-conservatively 100)
 '(scroll-preserve-screen-position t)
 '(show-paren-mode t nil (paren))
 '(show-paren-style (quote expression))
 '(show-trailing-whitespace t)
 '(tab-always-indent nil)
 '(time-stamp-active nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(transient-mark-mode t)
 '(user-full-name "MIURA Masahiro")
 '(view-read-only t)
 '(x-stretch-cursor t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Liberation Sans"))))
 '(highlight-changes ((((class color)) (:background "LightCyan1"))))
 '(highlight-changes-delete ((((class color)) (:background "LightCyan1" :underline t)))))

(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

; Local Variables:
; coding: utf-8
; End:
