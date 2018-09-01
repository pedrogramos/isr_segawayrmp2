;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::arrivedDestiny)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'arrivedDestiny (find-package "RMPISR")))
(unless (find-package "RMPISR::ARRIVEDDESTINY")
  (make-package "RMPISR::ARRIVEDDESTINY"))
(unless (find-package "RMPISR::ARRIVEDDESTINYREQUEST")
  (make-package "RMPISR::ARRIVEDDESTINYREQUEST"))
(unless (find-package "RMPISR::ARRIVEDDESTINYRESPONSE")
  (make-package "RMPISR::ARRIVEDDESTINYRESPONSE"))

(in-package "ROS")





(defclass RMPISR::arrivedDestinyRequest
  :super ros::object
  :slots ())

(defmethod RMPISR::arrivedDestinyRequest
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

(defclass RMPISR::arrivedDestinyResponse
  :super ros::object
  :slots ())

(defmethod RMPISR::arrivedDestinyResponse
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

(defclass RMPISR::arrivedDestiny
  :super ros::object
  :slots ())

(setf (get RMPISR::arrivedDestiny :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::arrivedDestiny :datatype-) "RMPISR/arrivedDestiny")
(setf (get RMPISR::arrivedDestiny :request) RMPISR::arrivedDestinyRequest)
(setf (get RMPISR::arrivedDestiny :response) RMPISR::arrivedDestinyResponse)

(defmethod RMPISR::arrivedDestinyRequest
  (:response () (instance RMPISR::arrivedDestinyResponse :init)))

(setf (get RMPISR::arrivedDestinyRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::arrivedDestinyRequest :datatype-) "RMPISR/arrivedDestinyRequest")
(setf (get RMPISR::arrivedDestinyRequest :definition-)
      "---
")

(setf (get RMPISR::arrivedDestinyResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::arrivedDestinyResponse :datatype-) "RMPISR/arrivedDestinyResponse")
(setf (get RMPISR::arrivedDestinyResponse :definition-)
      "---
")



(provide :RMPISR/arrivedDestiny "d41d8cd98f00b204e9800998ecf8427e")


