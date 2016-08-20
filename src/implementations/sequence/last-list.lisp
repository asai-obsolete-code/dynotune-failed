(in-package :dynotune)

(defclass last-list-implementation (implementation) ()
  (:documentation "implementation of a single-linked list with a pointer to the last.
This is a toy implementation -- not seriously considered as a library."))

(defstruct last-list list last)

(defmacro push-last-list-front (thing last-list)
  (with-gensyms (list last)
    `(with-slots (,list ,last) ,last-list
        (push ,thing ,list)
        (when (null (cdr ,list))
          (setf ,last ,list)))))

(defmacro push-last-list-back (thing last-list)
  (with-gensyms (list last)
    `(with-slots (,list ,last) ,last-list
        (setf (cdr ,last) (cons ,thing nil)
              last (cdr ,last)))))

(defmethod run ((experiment front-push-experiment) (impl last-list-implementation))
  (with-slots (input) experiment
     (let ((ll (make-last-list)))
       (dotimes (i (length input))
         (push-last-list-front (aref i input) ll))
       (last-list-list ll))))

(defmethod run ((experiment back-push-experiment) (impl last-list-implementation))
  (with-slots (input) experiment
     (let ((ll (make-last-list)))
       (dotimes (i (length input))
         (push-last-list-back (aref i input) ll))
       (last-list-list ll))))

