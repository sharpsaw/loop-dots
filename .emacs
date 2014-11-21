(setq dirs (split-string (getenv "DOTDOTDOT_ORDER")))
(while dirs
  (setq currentemacfile (concat (car dirs) "/.emacs"))
  (unless (string-match "loop-dots" currentemacfile)
    (if (file-exists-p currentemacfile)
        (load currentemacfile)
        ;;(message "Loading .emac file for %s\n" currentemacfile)
  ))
  (setq dirs (cdr dirs)))

