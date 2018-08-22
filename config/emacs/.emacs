;; packages
; make sure we can get to packages
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
	; 20171109 (added elpy)
	("elpy" . "https://jorgenschaefer.github.io/packages/")
      ))
(package-initialize)
;; 20180223 -- use-package for org-brain; 20180628 use package for most things
(require 'use-package)

(use-package helm :ensure t
  :bind
   ("M-x"     . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x b"   . helm-mini)
   ;:map helm-map
   ;  ("<tab>" . helm-execute-persistent-action) ; rebind tab to run persistent action
   ;  ("C-i" . helm-execute-persistent-action) ; make TAB works in terminal
   ;  ("C-z" . helm-select-action) ; list actions using C-z
   :config
    (helm-mode 1)
)

(load-theme 'monokai t)

(flyspell-mode 1)

(use-package company :ensure t
	     :init
	     (add-hook 'prog-mode-hook 'company-mode)
	     :config
	     (setq company-tooltip-align-annotations t)
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-buffer-choice t)
 '(package-selected-packages (quote (evil ess company monokai-theme helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
