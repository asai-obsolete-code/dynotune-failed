(in-package :dynotune)


(defclass numbers-small (input-from-lines-mixin)
     ((input-pathname
       :initform
       (asdf:system-relative-pathname :dynotune "data/numbers/small"))))

(defclass numbers-medium (input-from-lines-mixin)
     ((input-pathname
       :initform
       (asdf:system-relative-pathname :dynotune "data/numbers/medium"))))

(defclass numbers-large (input-from-lines-mixin)
     ((input-pathname
       :initform
       (asdf:system-relative-pathname :dynotune "data/numbers/large"))))

