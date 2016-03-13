;; Load ERC
(require 'erc)

;;erc-auth is setting the nick and pwd
(load "~/.emacs.d/erc-auth.el")
(setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#emacs-beginners" "#lisp" "#erc")))

;;ADDING COLORS TO ERC
;; Pool of colors to use when coloring IRC nicks.
(setq erc-colors-list '("green" "blue" "red"
			"dark gray" "dark orange"
			"dark magenta" "maroon"
			"indian red" "black" "forest green"
			"midnight blue" "dark violet"))
;; special colors for some people
(setq erc-nick-color-alist '(("John" . "blue")
			     ("Bob" . "red")
			     ))

(defun erc-get-color-for-nick (nick)
  "Gets a color for NICK. If NICK is in erc-nick-color-alist, use that color, else hash the nick and use a random color from the pool"
  (or (cdr (assoc nick erc-nick-color-alist))
      (nth
       (mod (string-to-number
	     (substring (md5 (downcase nick)) 0 6) 16)
	    (length erc-colors-list))
       erc-colors-list)))

(defun erc-put-color-on-nick ()
  "Modifies the color of nicks according to erc-get-color-for-nick"
  (save-excursion
    (goto-char (point-min))
    (if (looking-at "<\\([^>]*\\)>")
	(let ((nick (match-string 1)))
	  (put-text-property (match-beginning 1) (match-end 1) 'face
			     (cons 'foreground-color
				   (erc-get-color-for-nick nick)))))))

(add-hook 'erc-insert-modify-hook 'erc-put-color-on-nick)

;;splitting the window and fitting it
;(defun erc-window-setup ()
;  (let
;      ((gap 3)
;       (left-window (selected-window))
;       (right-window (split-window  nil nil 'right)))
;    ;;erc-fill-column is 55
;    (adjust-window-trailing-edge left-window (+ gap (- erc-fill-column (/ (frame-width) 2))) t nil)
;    (set-window-buffer right-window (other-buffer))))

;;after-init-hook is a good place too, but window-setup-hook is more appropriate
;(add-hook 'window-setup-hook 'erc-window-setup)
;(erc :password erc-password)



