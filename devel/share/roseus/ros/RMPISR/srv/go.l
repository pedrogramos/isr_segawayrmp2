;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::go)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'go (find-package "RMPISR")))
(unless (find-package "RMPISR::GO")
  (make-package "RMPISR::GO"))
(unless (find-package "RMPISR::GOREQUEST")
  (make-package "RMPISR::GOREQUEST"))
(unless (find-package "RMPISR::GORESPONSE")
  (make-package "RMPISR::GORESPONSE"))

(in-package "ROS")





(defclass RMPISR::goRequest
  :super ros::object
  :slots ())

(defmethod RMPISR::goRequest
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

(defclass RMPISR::goResponse
  :super ros::object
  :slots (_state ))

(defmethod RMPISR::goResponse
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

(defclass RMPISR::go
  :super ros::object
  :slots ())

(setf (get RMPISR::go :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get RMPISR::go :datatype-) "RMPISR/go")
(setf (get RMPISR::go :request) RMPISR::goRequest)
(setf (get RMPISR::go :response) RMPISR::goResponse)

(defmethod RMPISR::goRequest
  (:response () (instance RMPISR::goResponse :init)))

(setf (get RMPISR::goRequest :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get RMPISR::goRequest :datatype-) "RMPISR/goRequest")
(setf (get RMPISR::goRequest :definition-)
      "---
int32 state

")

(setf (get RMPISR::goResponse :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get RMPISR::goResponse :datatype-) "RMPISR/goResponse")
(setf (get RMPISR::goResponse :definition-)
      "---
int32 state

")



(provide :RMPISR/go "7a2f37ef2ba405f0c7a15cc72663d6f0")


