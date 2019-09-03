(package-initialize)
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))


(setq default-directory "C:/Users/starr/source/")
(setq make-backup-files nil)
(windmove-default-keybindings)
;; (electric-indent-mode nil)
(global-hl-line-mode t)

;; fast edit and reload .emacs
(defun open-dotemacs()
  (interactive)
  (find-file "~/.emacs"))
(defun reload-dotemacs()
  (interactive)
  (load-file "~/.emacs"))
(global-set-key (kbd "<f2>") 'open-dotemacs)
(global-set-key (kbd "<f3>") 'reload-dotemacs)


(custom-set-variables
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(global-linum-mode t)
 ;; '(inhibit-startup-screen t)
 '(package-selected-packages (quote (sml-mode)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(visible-bell 0))

(custom-set-faces
 '(default ((t (:family "Source Code Variable" :foundry "outline" :slant normal :weight normal :height 102 :width normal)))))

