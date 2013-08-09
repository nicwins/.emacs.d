(defun clean-winsight-xml ()
  "Remove illegal characters from winsight xml"
  (interactive)
  (revert-buffer t t)
  (goto-char (point-min))
  (while (search-forward "&nbsp;" nil t)
    (replace-match "" nil t))
  (goto-char (point-min))
  (while (search-forward "&" nil t)
    (replace-match "&amp;"))
  (goto-char (point-min))
  (save-buffer)
  )
