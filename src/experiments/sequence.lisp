
(in-package :dynotune)

(defclass sequence-experiment (space-time-experiment input-from-lines-experiment) ())

(defclass sequence-pop-experiment (sequence-experiment) ())
(defclass sequence-push-experiment (sequence-experiment) ())
(defclass sequence-access-experiment (sequence-experiment) ())

;; push

(defclass front-push-experiment (sequence-push-experiment) ()
  (:documentation "construct LIFO queue"))
(defclass back-push-experiment (sequence-push-experiment) ()
  (:documentation "construct FIFO queue"))
(defclass random-push-experiment (randomized-experiment sequence-push-experiment) ()
  (:documentation "Double the length of the sequence by inserting NIL to random positions."))


(defclass front-access-experiment (sequence-access-experiment) ()
  (:documentation "iterate over LIFO queue"))
(defclass front-pop-experiment (sequence-pop-experiment) ()
  (:documentation "consume LIFO queue"))

;; pop


(defclass back-access-experiment (sequence-access-experiment) ()
  (:documentation "iterate over FIFO queue"))
(defclass back-pop-experiment (sequence-pop-experiment) ()
  (:documentation "consume FIFO queue"))

;; access


(defclass random-access-experiment (randomized-experiment sequence-access-experiment) ()
  (:documentation "Access random positions"))
(defclass random-pop-experiment (randomized-experiment sequence-pop-experiment) ()
  (:documentation "Halve the length of the sequence by popping elements in random positions"))


