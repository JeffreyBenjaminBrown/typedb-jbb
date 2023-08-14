;; typeql-mode.el
;; credits: https://wilkesley.org/~ian/xah/emacs/elisp_syntax_coloring.html

(define-derived-mode typeql-mode fundamental-mode
  (setq font-lock-defaults
	'( ( ;; PTIFALL: Order matters. Hence comments first.
	    ( ;; comments
	     "#.*" . font-lock-comment-face)
	    ( ;; session-level commands
	     "transaction\\|schema\\|data\\|read\\|write\\|commit"

	     ;; TODO: I'd like to use the functions "concat" and "append",
	     ;; as demosntrated here:
	     ;;   (message (format "%s" (append '("1") '("2" "3") '("4" "5"))))
	     ;;   (message (mapconcat 'identity '("a" "c" "b") "\\|"))
	     ;; to construct these regular expressions from lists of strings,
	     ;; rather than hard-coding them.
	     ;; But here is why I can't:
	     ;; These next two lines are equal, according to string=,
	     ;; as demostrated by (message (format "%s" (string= (concat "define\\|" "undefine") "define\\|undefine"))),
	     ;; and yet I can use one of them and not the other!
	     ;;   "define\\|undefine"
	     ;;   (concat "define\\|" "undefine")
	     . font-lock-builtin-face)
	    ( ;; query-level commands
	     "attribute\\|enitty\\|relation\\|abstract\\|sort\\|offset\\|limit\\|group\\|count\\|sum\\|max\\|min\\|mean\\|median\\|std\\|define\\|undefine\\|sub\\|owns\\|plays\\|value\\|relates\\|match\\|insert\\|isa\\|get\\|delete\\|when\\|then"
	     . font-lock-function-name-face)
	    ( ;; builtin types
	     "long\\|double\\|boolean\\|string\\|datetime"
	    . font-lock-type-face)
       )))
  (setq mode-name "typeql"))

(add-to-list 'auto-mode-alist '("\\.tql\\'" . typeql-mode))
