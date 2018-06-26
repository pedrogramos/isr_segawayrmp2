;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::stop)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'stop (find-package "RMPISR")))
(unless (find-package "RMPISR::STOP")
  (make-package "RMPISR::STOP"))
(unless (find-package "RMPISR::STOPREQUEST")
  (make-package "RMPISR::STOPREQUEST"))
(unless (find-package "RMPISR::STOPRESPONSE")
  (make-package "RMPISR::STOPRESPONSE"))

(in-package "ROS")





(defclass RMPISR::stopRequest
  :super ros::object
  :slots ())

(defmethod RMPISR::stopRequest
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

(defclass RMPISR::stopResponse
  :super ros::object
  :slots (_state ))

(defmethod RMPISR::stopResponse
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

(defclass RMPISR::stop
  :super ros::object
  :slots ())

(setf (get RMPISR::stop :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get RMPISR::stop :datatype-) "RMPISR/stop")
(setf (get RMPISR::stop :request) RMPISR::stopRequest)
(setf (get RMPISR::stop :response) RMPISR::stopResponse)

(defmethod RMPISR::stopRequest
  (:response () (instance RMPISR::stopResponse :init)))

(setf (get RMPISR::stopRequest :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get RMPISR::stopRequest :datatype-) "RMPISR/stopRequest")
(setf (get RMPISR::stopRequest :definition-)
      "---
int32 state
")

(setf (get RMPISR::stopResponse :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get RMPISR::stopResponse :datatype-) "RMPISR/stopResponse")
(setf (get RMPISR::stopResponse :definition-)
      "---
int32 state
")



(provide :RMPISR/stop "7a2f37ef2ba405f0c7a15cc72663d6f0")


