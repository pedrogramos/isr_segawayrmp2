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
  :slots ())

(defmethod RMPISR::goResponse
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

(defclass RMPISR::go
  :super ros::object
  :slots ())

(setf (get RMPISR::go :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::go :datatype-) "RMPISR/go")
(setf (get RMPISR::go :request) RMPISR::goRequest)
(setf (get RMPISR::go :response) RMPISR::goResponse)

(defmethod RMPISR::goRequest
  (:response () (instance RMPISR::goResponse :init)))

(setf (get RMPISR::goRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::goRequest :datatype-) "RMPISR/goRequest")
(setf (get RMPISR::goRequest :definition-)
      "---

")

(setf (get RMPISR::goResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::goResponse :datatype-) "RMPISR/goResponse")
(setf (get RMPISR::goResponse :definition-)
      "---

")



(provide :RMPISR/go "d41d8cd98f00b204e9800998ecf8427e")


