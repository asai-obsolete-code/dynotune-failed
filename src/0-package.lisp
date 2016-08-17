#|
  This file is a part of dynotune project.
  Copyright (c) 2016 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage dynotune
  (:use :cl :iterate :alexandria))
(in-package :dynotune)

;; generic functions

(defclass implementation () ())

(defclass experiment ()
     ((input :reader input)
      (output :accessor output))
  (:documentation ""))

(defgeneric measure (experiment implementation)
  (:documentation "Wrap RUN to measure the performance and VERIFY the output.")
  (:method (experiment implementation)
    (with-slots (output) experiment
       (setf output (run experiment implementation))))
  (:method :around (experiment implementation)
    (let ((result (call-next-method)))
      (if (verify experiment)
          result
          (error "invalid results! ~a" experiment)))))

(defgeneric run (experiment implementation)
  (:documentation "Run the experiment using an implementation.
Returns an output."))

(defgeneric verify (experiment)
  (:documentation
   "Verify the output of the experiment. Returns a boolean indicating success or failure.")
  (:method (experiment)
    (declare (ignore experiment))
    t))




