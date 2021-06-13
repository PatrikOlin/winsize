;;; winsize  --- a simple package for resizing windows           -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Patrik Olin

;; Author: Patrik Olin <patrik@olin.work>
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:
(setq winsize--perc 0.50)

;;;###autoload
(defun winsize-incremental-resize ()
  "Resize current window to 25/50/75% of the current frame."
  (interactive)
  (let ((delta-lines (round(* winsize--perc (frame-height)))))
        (when (window-resizable nil delta-lines)
          (window-resize nil (- delta-lines (window-total-height)))
          (winsize--modify-perc)
          )
        )
  )


(defun winsize--modify-perc ()
  "Increase and decrease value of winsize--perc variable."
  (setq winsize--perc (if (equal winsize--perc 0.75)
                          0.25
                        (+ winsize--perc 0.25))
  )
)

(provide 'winsize)
;;; winsize.el ends here
