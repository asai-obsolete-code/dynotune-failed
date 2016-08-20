
(in-package :dynotune)

(defun connect (&rest functions)
  "Remniscent of deferred.js"
  (when functions
    (funcall (first functions)
             (lambda ()
               (apply #'connect (rest functions))))))


