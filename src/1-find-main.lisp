(in-package :dynotune)

;; (defun find-makefile ()
;;   (ppcre:split "\\s-*"
;;                (uiop:run-program
;;                 (format nil "find ~a -iname 'makefile' "
;;                         (asdf:system-relative-pathname :dynotune "implementations/"))
;;                 :output '(:string :stripped t))))

(defun find-main ()
  (remove-duplicates
   (ppcre:split "\\s-*"
                (uiop:run-program
                 (format nil "find ~a -iname 'main'"
                         (asdf:system-relative-pathname :dynotune "implementations/"))
                 :output '(:string :stripped t)))
   :test #'string=))

(defun runners ()
  (mapcar (lambda (path)
            (lambda (input)
              (uiop:run-program (print (format nil "make -C $(dirname ~a)" path))
                                :ignore-error-status t)
              (let ((out (make-pathname :type "out" :defaults path)))
                (unless (and (probe-file out)
                             (< (file-write-date path) (file-write-date out)))
                  (uiop:run-program (print (format nil "~a ~a > ~a" path input out))))
                (iter (for data in-file out)
                      (collect data)))))
          (find-main)))

