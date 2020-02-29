(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("37f32706ffc6d7d021adf6b4d2a84eae7e0cfb7871cd39e21eaddc77c52bf4a7" default)))
 '(global-linum-mode t)
 '(package-selected-packages (quote (dracula-theme sml-mode)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(visible-bell 0))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Variable" :foundry "outline" :slant normal :weight normal :height 102 :width normal)))))

;; fast edit and reload .emacs
(defun open-dotemacs()
  (interactive)
  (find-file "~/.emacs"))
(defun reload-dotemacs()
  (interactive)
  (load-file "~/.emacs"))
(global-set-key (kbd "<f2>") 'open-dotemacs)
(global-set-key (kbd "<f3>") 'reload-dotemacs)

(setq default-directory "C:/Users/starr/source/")
(setq make-backup-files nil)
(windmove-default-keybindings)
;; (electric-indent-mode nil)
(global-hl-line-mode t)

