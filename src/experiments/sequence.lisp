
(in-package :dynotune)

;; no efficiency problem here

(defclass sequence-experiment (space-time-experiment) ())

(dolist (where '(front back random))
  (dolist (how '(push pop))
    (dolist (on '(small medium large))
      (let ((name (symbolicate where '- how '-experiment- on)))
        (eval `(defclass ,name
                    (sequence-experiment ,(symbolicate 'numbers- on))
                    ()))))))

(dolist (how '(forward-sequencial backward-sequencial random))
  (dolist (on '(small medium large))
    (eval `(defclass ,(symbolicate how '-access-experiment- on)
                (sequence-experiment ,(symbolicate 'numbers- on))
                ()))))


