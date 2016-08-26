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
              (uiop:run-program (format nil "make -C $(dirname ~a)" path)
                                :ignore-error-status t)
              (with-input-from-string (s (uiop:run-program (format nil "~a ~a" path input)
                                                           :output :string))
                (iter (for data in-stream s)
                      (collect data)))))
          (find-main)))

