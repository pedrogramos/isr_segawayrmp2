;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::addpoint)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'addpoint (find-package "RMPISR")))
(unless (find-package "RMPISR::ADDPOINT")
  (make-package "RMPISR::ADDPOINT"))
(unless (find-package "RMPISR::ADDPOINTREQUEST")
  (make-package "RMPISR::ADDPOINTREQUEST"))
(unless (find-package "RMPISR::ADDPOINTRESPONSE")
  (make-package "RMPISR::ADDPOINTRESPONSE"))

(in-package "ROS")





(defclass RMPISR::addpointRequest
  :super ros::object
  :slots (_xf _yf _type ))

(defmethod RMPISR::addpointRequest
  (:init
   (&key
    ((:xf __xf) 0.0)
    ((:yf __yf) 0.0)
    ((:type __type) nil)
    )
   (send-super :init)
   (setq _xf (float __xf))
   (setq _yf (float __yf))
   (setq _type __type)
   self)
  (:xf
   (&optional __xf)
   (if __xf (setq _xf __xf)) _xf)
  (:yf
   (&optional __yf)
   (if __yf (setq _yf __yf)) _yf)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; float64 _xf
    8
    ;; float64 _yf
    8
    ;; bool _type
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _xf
       (sys::poke _xf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yf
       (sys::poke _yf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _type
       (if _type (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _xf
     (setq _xf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yf
     (setq _yf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _type
     (setq _type (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass RMPISR::addpointResponse
  :super ros::object
  :slots ())

(defmethod RMPISR::addpointResponse
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

(defclass RMPISR::addpoint
  :super ros::object
  :slots ())

(setf (get RMPISR::addpoint :md5sum-) "2c13470f9a76d841f1bd464dbd411b07")
(setf (get RMPISR::addpoint :datatype-) "RMPISR/addpoint")
(setf (get RMPISR::addpoint :request) RMPISR::addpointRequest)
(setf (get RMPISR::addpoint :response) RMPISR::addpointResponse)

(defmethod RMPISR::addpointRequest
  (:response () (instance RMPISR::addpointResponse :init)))

(setf (get RMPISR::addpointRequest :md5sum-) "2c13470f9a76d841f1bd464dbd411b07")
(setf (get RMPISR::addpointRequest :datatype-) "RMPISR/addpointRequest")
(setf (get RMPISR::addpointRequest :definition-)
      "float64 xf
float64 yf
bool type
---

")

(setf (get RMPISR::addpointResponse :md5sum-) "2c13470f9a76d841f1bd464dbd411b07")
(setf (get RMPISR::addpointResponse :datatype-) "RMPISR/addpointResponse")
(setf (get RMPISR::addpointResponse :definition-)
      "float64 xf
float64 yf
bool type
---

")



(provide :RMPISR/addpoint "2c13470f9a76d841f1bd464dbd411b07")


