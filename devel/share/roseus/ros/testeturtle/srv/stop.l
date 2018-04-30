;; Auto-generated. Do not edit!


(when (boundp 'testeturtle::stop)
  (if (not (find-package "TESTETURTLE"))
    (make-package "TESTETURTLE"))
  (shadow 'stop (find-package "TESTETURTLE")))
(unless (find-package "TESTETURTLE::STOP")
  (make-package "TESTETURTLE::STOP"))
(unless (find-package "TESTETURTLE::STOPREQUEST")
  (make-package "TESTETURTLE::STOPREQUEST"))
(unless (find-package "TESTETURTLE::STOPRESPONSE")
  (make-package "TESTETURTLE::STOPRESPONSE"))

(in-package "ROS")





(defclass testeturtle::stopRequest
  :super ros::object
  :slots ())

(defmethod testeturtle::stopRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass testeturtle::stopResponse
  :super ros::object
  :slots (_state ))

(defmethod testeturtle::stopResponse
  (:init
   (&key
    ((:state __state) 0)
    )
   (send-super :init)
   (setq _state (round __state))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; int32 _state
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _state
       (write-long _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _state
     (setq _state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass testeturtle::stop
  :super ros::object
  :slots ())

(setf (get testeturtle::stop :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get testeturtle::stop :datatype-) "testeturtle/stop")
(setf (get testeturtle::stop :request) testeturtle::stopRequest)
(setf (get testeturtle::stop :response) testeturtle::stopResponse)

(defmethod testeturtle::stopRequest
  (:response () (instance testeturtle::stopResponse :init)))

(setf (get testeturtle::stopRequest :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get testeturtle::stopRequest :datatype-) "testeturtle/stopRequest")
(setf (get testeturtle::stopRequest :definition-)
      "---
int32 state
")

(setf (get testeturtle::stopResponse :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get testeturtle::stopResponse :datatype-) "testeturtle/stopResponse")
(setf (get testeturtle::stopResponse :definition-)
      "---
int32 state
")



(provide :testeturtle/stop "7a2f37ef2ba405f0c7a15cc72663d6f0")


