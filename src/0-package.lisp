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
  (:documentation "Wrap RUN to measure the performance.")
  (:method ((e experiment) implementation)
    (with-slots (output) e
       (setf output (run e implementation)))))

(defgeneric prepare (experiment implementation)
  (:documentation "Prepare the input for the experiment.
Preprocessing phase of the experiment that should be excluded from the benchmark should be here
 rather than in RUN.")
  (:method (e i)
    (declare (ignorable e i))))

(defgeneric run (experiment implementation)
  (:documentation "Run the experiment using an implementation.
Returns an output.")
  (:method (e i)
    (format *error-output* "benchmark for ~a and ~a is not implemented yet." e i)))

(defgeneric verify (experiment)
  (:documentation
   "Verify the output of the experiment. Returns a boolean indicating success or failure.")
  (:method (experiment)
    (declare (ignore experiment))
    t))

(defun benchmark (experiment implementation)
  (prepare experiment implementation)
  (let ((result (measure experiment implementation)))
    (if (verify experiment)
        result
        (error "invalid results! ~a" experiment))))
