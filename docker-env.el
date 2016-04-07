;;; docker-env sets the environment for your docker-machine's environment
;;; variables. It is the emacs equivalent of running `docker-machine env`

;;;###autoload
(defun docker-env (machine-name)
  "Set your docker environment variables for users running docker-machine"
  (interactive "Mmachine-name: ")
  (let ((docker-export (shell-command-to-string (concat "docker-machine env " machine-name)))
       (pos 0)
       match)
  (while (string-match "^export \\([^=]*\\)=\"\\([^\"]*\\)\"$" docker-export pos)
    (setq pos (match-end 0))
    (setenv (match-string 1 docker-export) (match-string 2 docker-export))
    )))

(provide 'docker-env)
