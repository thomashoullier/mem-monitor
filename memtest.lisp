;;;; Simply grab more or less memory during a given time window
(asdf:load-system :sb-proc)

(sb-proc:run-prog "/bin/sh" "/home/modi/repos/mem-monitor/mem-monitor.sh")

(loop for mem in '(2 10 5 15 3 18 13 1) do
  (let ((arr nil))
    (setf arr (make-array (* mem 1000000) :element-type 'double-float
					  :initial-element 0d0))
    (loop for i from 0 below (length arr) do
      (setf (aref arr i) 1d0))
    (sleep 0.1))
      (sb-ext:gc :full t))

(format t "DONE~%")
