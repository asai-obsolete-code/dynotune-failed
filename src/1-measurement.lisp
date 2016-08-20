(in-package :dynotune)

(defmacro with-measurement ((&whole keys &key name input &allow-other-keys) &body body)
  (with-gensyms (next)
    `(call-with-measurement (lambda (,next) (declare (ignorable ,next)) ,@body)
                            :pathname (enough-namestring *load-pathname*)
                            :name ',name
                            :input (enough-namestring ,input))))

(defun call-with-measurement (fn &rest keys &key &allow-other-keys)
  (prin1
   (connect (lambda (next)
              (append keys (funcall next)))
            (lambda (next)
              (gc :full t :verbose t)
              (let ((start-rss (get-rss))
                    (other-measures (funcall next)) ; sb-ext:without-gcing ?
                    (dirty-rss (get-rss)))
                (gc :full t :verbose t)
                (let ((clean-rss (get-rss)))
                  (list* :temporary-space (- dirty-rss start-rss)
                         :space (- clean-rss start-rss)
                         other-measures))))
            (lambda (next)
              (let ((start (get-internal-run-time))
                    (other-measures (funcall next))
                    (end (get-internal-run-time)))
                (list* :time (float (/ (- end start) internal-time-units-per-second))
                       other-measures)))
            fn))
  (terpri))

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
