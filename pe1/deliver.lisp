(in-package "CL-USER")

(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(ql:quickload :pe1)
(deliver 'pe1:startup "pe1" 0
         :multiprocessing t
         :keep-eval t
         :keep-load-function t
         :packages-to-keep :all
         :keep-editor t
         :interface :capi)
