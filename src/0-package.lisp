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
(define-namespace implementation)

(defclass experiment () ())
(define-namespace experiment)

(defgeneric run (implementation input))
(defgeneric verify (experiment output))
(defgeneric bench (experiment implementation))

