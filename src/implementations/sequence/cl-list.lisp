
(in-package :dynotune)

(defclass cl-list-implementation (implementation) ())

;;; push

(defmethod run ((experiment front-push-experiment) (impl cl-list-implementation))
  (with-slots (input) experiment
     (let (acc)
       (dotimes (i (length input))
         (push (aref i input) acc))
       acc)))

(defmethod run ((experiment back-push-experiment) (impl cl-list-implementation))
  (with-slots (input) experiment
     ;; intentionally slow, since we are concerned with "general" use of insertion to the last.
     ;; for an implementation maintaining a tmporary pointer, we need another implementation.
     (let (acc)
       (dotimes (i (length input) acc)
         (push (aref i input) (last acc))))))

(defmethod prepare ((e random-push-experiment) (i cl-list-implementation))
  (setf (slot-value e 'output)
        (coerce (slot-value e 'input) 'list)))

(defmethod run ((experiment random-push-experiment) (impl cl-list-implementation))
  (with-slots (input output) experiment
     (let ((len (length input)))
       (dotimes (i len)
         (push nil (nthcdr (random len) output))))))

;;; pop

(defmethod prepare ((e sequence-pop-experiment) (i cl-list))
  (setf (slot-value e 'output)
        (coerce (slot-value e 'input) 'list)))

(defmethod run ((experiment front-pop-experiment) (impl cl-list-implementation))
  (with-slots (output input) experiment
     (dotimes (i (length input))
       (pop output))))

(defmethod run ((experiment back-pop-experiment) (impl cl-list-implementation))
  (with-slots (output input) experiment
     (dotimes (i (length input))
       (setf (last acc) nil))))

(defmethod run ((experiment random-pop-experiment) (impl cl-list-implementation))
  (with-slots (output input) experiment
     (let ((len (length input)))
       (dotimes (i len)
         (pop (nthcdr (random len) output))))))

;;; access

(defmethod prepare ((e sequence-access-experiment) (i cl-list))
  (setf (slot-value e 'input)
        (coerce (slot-value e 'input) 'list)))

(defmethod run ((experiment front-access-experiment) (impl cl-list))
  (with-slots (input output) experiment
     (dotimes (i (length input))
       (pop (aref i input) output))))
