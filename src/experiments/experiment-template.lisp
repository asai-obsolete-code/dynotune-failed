(in-package :dynotune)

(defclass -experiment (space-time-experiment) ())

(defmethod verify ((experiment -experiment))
  (with-slots (output) experiment
     (typep output 'array)))
