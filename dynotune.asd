#|
  This file is a part of dynotune project.
  Copyright (c) 2016 Masataro Asai (guicho2.71828@gmail.com)
|#

#|
  Implementation-independent Framework for performance measurement

  Author: Masataro Asai (guicho2.71828@gmail.com)
|#



(in-package :cl-user)
(defpackage dynotune-asd
  (:use :cl :asdf))
(in-package :dynotune-asd)


(defsystem dynotune
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:iterate :alexandria)
  :components ((:module "src"
                :components
                ((:file "0-package"))))
  :description "Implementation-independent Framework for performance measurement"
  :in-order-to ((test-op (test-op :dynotune.test))))
