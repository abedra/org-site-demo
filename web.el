(require 'org-publish)

(setq org-publish-project-alist
      '(("demo-site"
         :base-directory "."
         :base-extension "org"
         :publishing-directory "output"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4 
         :auto-preamble t
         :section-numbers nil
         :table-of-contents nil
         :style "<link rel='stylesheet' type='text/css' href='css/style.css' />"
         :style-include-default nil)
        ("demo-static"
         :base-directory "."
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt\\|asc"
         :publishing-directory "output"
         :recursive t
         :publishing-function org-publish-attachment)
        ("org" :components ("demo-site" "demo-static"))))

(defun publish nil
  (interactive)
  (org-publish-all))
