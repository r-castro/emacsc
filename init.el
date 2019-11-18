(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    monokai-pro-theme
    zenburn-theme
    auto-complete
    projectile
    web-mode
    material-theme
    powerline
    helm
    ))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

(setq inhibit-startup-message t)
(load-theme 'spacemacs-dark t)
;(if (not (display-graphic-p))
;    (add-to-list 'default-frame-alist '(background-color . nill)))

(global-linum-mode t)
;(setq linum-format "%d ")
(setq linum-format "%3d ")

(elpy-enable)

(set-default-font "Ubuntu Mono 11")

(require 'helm-config)
(helm-mode 1)

(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
(setq projectile-indexing-method 'alien)

(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
;(setq highlight-indent-guides-character ?\|)

(add-to-list 'term-file-aliases
    '("st-256color" . "xterm-256color"))

(setq-default line-spacing 0)

(ac-config-default)

(require 'powerline)
(powerline-default-theme)


(require 'helm-projectile)
(helm-projectile-on)


(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)

;(setq venv-location '("/home/rodrigo/Documents/projects/django/.venv/" "/home/rodrigo/Documents/projects/test/.env"))

(setq projectile-project-root ".projectile")
(setq venv-dirlookup-names '(".venv" "pyenv" ".virtual" ".env"))
(setq projectile-switch-project-action 'venv-projectile-auto-workon)


(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-closing t)


(setq ac-modes (delq 'python-mode ac-modes))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((engine . django)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
