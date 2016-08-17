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
     ((input :accessor input :initarg :input)))

(defgeneric benchmark (experiment implementation)
  (:documentation "Using the input stored in the experiment, run the experiment using the implementation,
measure the performance and verify the output."))
(defgeneric verify (experiment output)
  (:documentation "Verify the output of the experiment."))
(defgeneric run (experiment implementation)
  (:documentation "run the experiment using an implementation."))
