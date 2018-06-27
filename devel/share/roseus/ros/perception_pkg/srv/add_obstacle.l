;; Auto-generated. Do not edit!


(when (boundp 'perception_pkg::add_obstacle)
  (if (not (find-package "PERCEPTION_PKG"))
    (make-package "PERCEPTION_PKG"))
  (shadow 'add_obstacle (find-package "PERCEPTION_PKG")))
(unless (find-package "PERCEPTION_PKG::ADD_OBSTACLE")
  (make-package "PERCEPTION_PKG::ADD_OBSTACLE"))
(unless (find-package "PERCEPTION_PKG::ADD_OBSTACLEREQUEST")
  (make-package "PERCEPTION_PKG::ADD_OBSTACLEREQUEST"))
(unless (find-package "PERCEPTION_PKG::ADD_OBSTACLERESPONSE")
  (make-package "PERCEPTION_PKG::ADD_OBSTACLERESPONSE"))

(in-package "ROS")





(defclass perception_pkg::add_obstacleRequest
  :super ros::object
  :slots (_xobj _yobj ))

(defmethod perception_pkg::add_obstacleRequest
  (:init
   (&key
    ((:xobj __xobj) 0.0)
    ((:yobj __yobj) 0.0)
    )
   (send-super :init)
   (setq _xobj (float __xobj))
   (setq _yobj (float __yobj))
   self)
  (:xobj
   (&optional __xobj)
   (if __xobj (setq _xobj __xobj)) _xobj)
  (:yobj
   (&optional __yobj)
   (if __yobj (setq _yobj __yobj)) _yobj)
  (:serialization-length
   ()
   (+
    ;; float32 _xobj
    4
    ;; float32 _yobj
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _xobj
       (sys::poke _xobj (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yobj
       (sys::poke _yobj (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _xobj
     (setq _xobj (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yobj
     (setq _yobj (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass perception_pkg::add_obstacleResponse
  :super ros::object
  :slots ())

(defmethod perception_pkg::add_obstacleResponse
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

(defclass perception_pkg::add_obstacle
  :super ros::object
  :slots ())

(setf (get perception_pkg::add_obstacle :md5sum-) "f8fb8420bfa4e803c844225154ef8e5f")
(setf (get perception_pkg::add_obstacle :datatype-) "perception_pkg/add_obstacle")
(setf (get perception_pkg::add_obstacle :request) perception_pkg::add_obstacleRequest)
(setf (get perception_pkg::add_obstacle :response) perception_pkg::add_obstacleResponse)

(defmethod perception_pkg::add_obstacleRequest
  (:response () (instance perception_pkg::add_obstacleResponse :init)))

(setf (get perception_pkg::add_obstacleRequest :md5sum-) "f8fb8420bfa4e803c844225154ef8e5f")
(setf (get perception_pkg::add_obstacleRequest :datatype-) "perception_pkg/add_obstacleRequest")
(setf (get perception_pkg::add_obstacleRequest :definition-)
      "float32 xobj
float32 yobj

---
")

(setf (get perception_pkg::add_obstacleResponse :md5sum-) "f8fb8420bfa4e803c844225154ef8e5f")
(setf (get perception_pkg::add_obstacleResponse :datatype-) "perception_pkg/add_obstacleResponse")
(setf (get perception_pkg::add_obstacleResponse :definition-)
      "float32 xobj
float32 yobj

---
")



(provide :perception_pkg/add_obstacle "f8fb8420bfa4e803c844225154ef8e5f")


