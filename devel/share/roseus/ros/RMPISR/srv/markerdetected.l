;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::markerdetected)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'markerdetected (find-package "RMPISR")))
(unless (find-package "RMPISR::MARKERDETECTED")
  (make-package "RMPISR::MARKERDETECTED"))
(unless (find-package "RMPISR::MARKERDETECTEDREQUEST")
  (make-package "RMPISR::MARKERDETECTEDREQUEST"))
(unless (find-package "RMPISR::MARKERDETECTEDRESPONSE")
  (make-package "RMPISR::MARKERDETECTEDRESPONSE"))

(in-package "ROS")





(defclass RMPISR::markerdetectedRequest
  :super ros::object
  :slots ())

(defmethod RMPISR::markerdetectedRequest
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

(defclass RMPISR::markerdetectedResponse
  :super ros::object
  :slots ())

(defmethod RMPISR::markerdetectedResponse
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

(defclass RMPISR::markerdetected
  :super ros::object
  :slots ())

(setf (get RMPISR::markerdetected :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::markerdetected :datatype-) "RMPISR/markerdetected")
(setf (get RMPISR::markerdetected :request) RMPISR::markerdetectedRequest)
(setf (get RMPISR::markerdetected :response) RMPISR::markerdetectedResponse)

(defmethod RMPISR::markerdetectedRequest
  (:response () (instance RMPISR::markerdetectedResponse :init)))

(setf (get RMPISR::markerdetectedRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::markerdetectedRequest :datatype-) "RMPISR/markerdetectedRequest")
(setf (get RMPISR::markerdetectedRequest :definition-)
      "---
")

(setf (get RMPISR::markerdetectedResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::markerdetectedResponse :datatype-) "RMPISR/markerdetectedResponse")
(setf (get RMPISR::markerdetectedResponse :definition-)
      "---
")



(provide :RMPISR/markerdetected "d41d8cd98f00b204e9800998ecf8427e")


