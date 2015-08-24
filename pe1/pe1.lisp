;;;; pe1.lisp

(in-package #:pe1)

;;; The top-level is an editor pane, no fancy decorations.
(defvar *editor*
  (make-instance 'capi:editor-pane))

;;; Like emacs, it would be useful to be able to extend the
;;; editor with more Lisp.
(defconstant +initial-lisp+
  (merge-pathnames ".config/pe1/init.lisp"
                   (user-homedir-pathname)))

;;; startup should take a list of args, which hopefully would
;;; contain any filenames to visit, check to make sure the
;;; initial config directory exists, and load it if it exists.
;;;
;;; If any files were passed into the args, the first of them
;;; should be loaded into the editor buffer (hey, this is a
;;; prototype).
;;;
;;; Finally, fire up the editor. Yes, I know contain is bad form.
(defun startup (&rest args)
  (ensure-directories-exist (directory-namestring +initial-lisp+))
  (when (probe-file +initial-lisp+)
    (load +initial-lisp+))
  (unless (null (car args))
    (editor:load-file-command
     (editor-pane-buffer *editor*
                                (car args))))
  (contain *editor*))

