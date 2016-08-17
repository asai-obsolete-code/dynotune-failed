
(in-package :dynotune)

(defclass time-mixin (experiment) ())

(defmethod measure :around ((experiment time-mixin) implementation)
  (let ((start (get-internal-run-time))
        (other-measures (call-next-method))
        (end (get-internal-run-time)))
    (list* :time (/ (- end start) internal-time-units-per-second)
           other-measures)))

(defclass space-mixin (experiment) ())

(defmethod measure :around ((experiment space-mixin) implementation)
  (gc :full t)
  (let ((start-rss (get-rss))
        (other-measures (call-next-method)) ; sb-ext:without-gcing ?
        (dirty-rss (get-rss)))
    (gc :full t)
    (let ((clean-rss (get-rss)))
      (list* :temporary-space (- dirty-rss start-rss)
             :space (- clean-rss start-rss)
             other-measures))))

(defclass space-time-experiment (time-mixin
                                 space-mixin)
     ())

(defun get-rss ()
  #+ccl
  (let ((sum 0))
    (ccl:map-heap-objects (lambda (obj)
                            (incf sum (ccl:object-direct-size obj)))
                          :dynamic)
    sum)
  #+sbcl
  (sb-ext:get-bytes-consed)
  ;; we can torelate small amount of consing as documented in GET-BYTES-CONSED
  )




(defclass input-from-file-mixin (experiment)
     ((input-pathname :reader input-pathname :initarg :input-pathname)))

(defclass input-from-csv-mixin (input-from-file-mixin) ())

(defmethod initialize-instance :after ((o input-from-csv-mixin))
  (setf (slot-value o 'input)
        (let* ((table (with-open-file (s (input-pathname o))
                        (cl-csv:read-csv s)))
               (rows (length table))
               (cols (reduce #'max table :key #'length)))
          (make-array (list rows cols) :initial-contents table))))

(defclass input-from-lines-mixin (input-from-file-mixin) ())

(defmethod initialize-instance :after ((o input-from-csv-mixin))
  (setf (slot-value o 'input)
        (iter (for obj in-file (input-pathname o))
              (collect obj result-type vector))))

