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
  :slots ())

(defmethod RMPISR::stopResponse
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

(defclass RMPISR::stop
  :super ros::object
  :slots ())

(setf (get RMPISR::stop :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::stop :datatype-) "RMPISR/stop")
(setf (get RMPISR::stop :request) RMPISR::stopRequest)
(setf (get RMPISR::stop :response) RMPISR::stopResponse)

(defmethod RMPISR::stopRequest
  (:response () (instance RMPISR::stopResponse :init)))

(setf (get RMPISR::stopRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::stopRequest :datatype-) "RMPISR/stopRequest")
(setf (get RMPISR::stopRequest :definition-)
      "---

")

(setf (get RMPISR::stopResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get RMPISR::stopResponse :datatype-) "RMPISR/stopResponse")
(setf (get RMPISR::stopResponse :definition-)
      "---

")



(provide :RMPISR/stop "d41d8cd98f00b204e9800998ecf8427e")


