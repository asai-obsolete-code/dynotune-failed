
(in-package :dynotune)

(defmethod run ((experiment -experiment) (impl implementation))
  (with-slots (input) experiment))
