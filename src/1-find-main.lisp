(in-package :dynotune)

(defun find-main ()
  (ppcre:split "\\s-+"
               (uiop:run-program
                (format nil "find ~a -iname main"
                        (asdf:system-relative-pathname :dynotune "implementations/"))
                :output '(:string :stripped t))))

(defun collect-data ()
  (mappend (lambda (path)
             (let ((out (make-pathname :type "out" :default path)))
               (unless (probe-file out)
                 (uiop:run-program path :output out)))
             (iter (for data in-file out)
                   (collect data)))
           (find-main)))

