(in-package :dynotune)

(defclass -experiment (space-time-experiment) ())

(defmethod verify ((experiment -experiment))
  (match experiment
    ((experiment output)
     (typep output 'array))))
