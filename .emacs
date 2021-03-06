;; .emacs
;; Wesley Erickson 
;;
;; Countless snippets from:
;; http://pages.sachachua.com/.emacs.d/Sacha.html

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; org mode!
;;(use-package org
;;  :diminish org-mode
;;  )


;; get rid of file menu and stuff
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; sentances end in single space. didn't know double space was a thing.
(setq sentence-end-double-space nil)

;; good idea:
;;(use-package artbollocks-mode
;;  :init
;;  (progn
;;    (setq artbollocks-weasel-words-regex
;;          (concat "\\b" (regexp-opt
;;                         '("one of the"
;;                           "should"
;;                           "just"
;;                           "sort of"
;;                           "a lot"
;;                           "probably"
;;                           "maybe"
;;                           "perhaps"
;;                           "I think"
;;                           "really"
;;                           "pretty"
;;                           "nice"
;;                           "action"
;;                           "utilize"
;;                           "leverage") t) "\\b"))
;;    ;; Don't show the art critic words, or at least until I figure
;;    ;; out my own jargon
;;    (setq artbollocks-jargon nil)))

;; highlight paren pairs
(show-paren-mode)

;; show colums in addition to rows
(setq column-number-mode t)

;; set the backup folder
(setq backup-directory-alist '(("." . "~/.backups")))

;; make lots of backups with version control... might not be good on this computer
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; 


;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;;Turn on Better Tex Mode
;;(load "auctex.el" nil t t)
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)

;;Enable full screen shortcut
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
(global-set-key [f11] 'toggle-fullscreen)

;;Fix the colors
(invert-face 'default)
(defun toggle-inversion ()
  "Toggle color inversion"
  (interactive)
  (invert-face 'default)
  )
(global-set-key [f9] 'toggle-inversion)
(toggle-inversion)

;;Increase font size
(set-default 'preview-scale-function 1.5)



;; org publishing settings
;; to force update of unchanged files delete .org-timestamps
;;	 :exclude "\\*"
;;(require 'org-publish)
	;; :recursive f
;;	 :toc f
;         :style-include-default nil  ;Disable the default css style
;:org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"org.css\">"
;:org-html-head-include-default-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"org.css\">"
;         :auto-postamble nil         ; Disable auto postamble 
;	 :html-preamble nil
; 
;	 :html-head-include-default-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"org.css\">"
;         :export-creator-info nil    ; Disable the inclusion of "Created by Org" in the postamble.
;         :export-author-info nil     ; Disable the inclusion of "Author: Your Name" in the postamble.
;         :html-postamble-format "    <p class=\"postamble\">Last Updated %d.</p> " ; your personal postamble	
;         :org-html-postamble-format "    <p class=\"postamble\">Last Updated %d.</p> " ; your personal postamble	

(setq org-publish-project-alist

      '(
	("org-notes"
	 :base-directory "~/org/"
	 :base-extension "org"
	 :publishing-directory "~/public_html_test/"
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
         :with-toc nil        ; Set this to "t" if you want a table of contents, set to "nil" disables TOC.
         :section-numbers nil        ; Set this to "t" if you want headings to have numbers.
	 :html-postamble t
	 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"org.css\">"
	 )
	("org-static"
	 :base-directory "~/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|tsv"
	 :publishing-directory "~/public_html_test/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("org" :components ("org-notes" "org-static"))
      ))

(setq org-html-postamble-format '(("en" "<p class=\"postamble\">Last Updated: %C</p>")))

