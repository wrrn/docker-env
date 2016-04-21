;;; docker-env.el --- Set enviroment variables for a docker machine.

;; Copyright (C) 2016 Warren Harper

;; Author: Warren Harper <warrenjharper@gmail.com>
;; Version: 0.1
;; Keywords: docker, env, environment
;; URL: https://github.com/wrrn/docker-env

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.


;;; Commentary: 
;; docker-env sets the environment for your docker-machine's environment
;; variables. It is the emacs equivalent of running `docker-machine env`
;; Assuming a user has a docker machine running with the name "dev" a user
;; can call (docker-env "dev") to add all the environment variables to their
;; emacs environment.

;;; Code:

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
;;; docker-env.el ends here
