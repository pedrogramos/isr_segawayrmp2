;; Auto-generated. Do not edit!


(when (boundp 'testeturtle::go)
  (if (not (find-package "TESTETURTLE"))
    (make-package "TESTETURTLE"))
  (shadow 'go (find-package "TESTETURTLE")))
(unless (find-package "TESTETURTLE::GO")
  (make-package "TESTETURTLE::GO"))
(unless (find-package "TESTETURTLE::GOREQUEST")
  (make-package "TESTETURTLE::GOREQUEST"))
(unless (find-package "TESTETURTLE::GORESPONSE")
  (make-package "TESTETURTLE::GORESPONSE"))

(in-package "ROS")





(defclass testeturtle::goRequest
  :super ros::object
  :slots ())

(defmethod testeturtle::goRequest
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

(defclass testeturtle::goResponse
  :super ros::object
  :slots (_state ))

(defmethod testeturtle::goResponse
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

(defclass testeturtle::go
  :super ros::object
  :slots ())

(setf (get testeturtle::go :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get testeturtle::go :datatype-) "testeturtle/go")
(setf (get testeturtle::go :request) testeturtle::goRequest)
(setf (get testeturtle::go :response) testeturtle::goResponse)

(defmethod testeturtle::goRequest
  (:response () (instance testeturtle::goResponse :init)))

(setf (get testeturtle::goRequest :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get testeturtle::goRequest :datatype-) "testeturtle/goRequest")
(setf (get testeturtle::goRequest :definition-)
      "---
int32 state

")

(setf (get testeturtle::goResponse :md5sum-) "7a2f37ef2ba405f0c7a15cc72663d6f0")
(setf (get testeturtle::goResponse :datatype-) "testeturtle/goResponse")
(setf (get testeturtle::goResponse :definition-)
      "---
int32 state

")



(provide :testeturtle/go "7a2f37ef2ba405f0c7a15cc72663d6f0")


