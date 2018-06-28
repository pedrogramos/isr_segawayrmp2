;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::sensors)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'sensors (find-package "RMPISR")))
(unless (find-package "RMPISR::SENSORS")
  (make-package "RMPISR::SENSORS"))

(in-package "ROS")
;;//! \htmlinclude sensors.msg.html


(defclass RMPISR::sensors
  :super ros::object
  :slots (_ir1 _ir2 _ir3 _ir4 _s1 _s2 _s5 ))

(defmethod RMPISR::sensors
  (:init
   (&key
    ((:ir1 __ir1) 0.0)
    ((:ir2 __ir2) 0.0)
    ((:ir3 __ir3) 0.0)
    ((:ir4 __ir4) 0.0)
    ((:s1 __s1) 0.0)
    ((:s2 __s2) 0.0)
    ((:s5 __s5) 0.0)
    )
   (send-super :init)
   (setq _ir1 (float __ir1))
   (setq _ir2 (float __ir2))
   (setq _ir3 (float __ir3))
   (setq _ir4 (float __ir4))
   (setq _s1 (float __s1))
   (setq _s2 (float __s2))
   (setq _s5 (float __s5))
   self)
  (:ir1
   (&optional __ir1)
   (if __ir1 (setq _ir1 __ir1)) _ir1)
  (:ir2
   (&optional __ir2)
   (if __ir2 (setq _ir2 __ir2)) _ir2)
  (:ir3
   (&optional __ir3)
   (if __ir3 (setq _ir3 __ir3)) _ir3)
  (:ir4
   (&optional __ir4)
   (if __ir4 (setq _ir4 __ir4)) _ir4)
  (:s1
   (&optional __s1)
   (if __s1 (setq _s1 __s1)) _s1)
  (:s2
   (&optional __s2)
   (if __s2 (setq _s2 __s2)) _s2)
  (:s5
   (&optional __s5)
   (if __s5 (setq _s5 __s5)) _s5)
  (:serialization-length
   ()
   (+
    ;; float32 _ir1
    4
    ;; float32 _ir2
    4
    ;; float32 _ir3
    4
    ;; float32 _ir4
    4
    ;; float32 _s1
    4
    ;; float32 _s2
    4
    ;; float32 _s5
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _ir1
       (sys::poke _ir1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ir2
       (sys::poke _ir2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ir3
       (sys::poke _ir3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ir4
       (sys::poke _ir4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _s1
       (sys::poke _s1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _s2
       (sys::poke _s2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _s5
       (sys::poke _s5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _ir1
     (setq _ir1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ir2
     (setq _ir2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ir3
     (setq _ir3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ir4
     (setq _ir4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _s1
     (setq _s1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _s2
     (setq _s2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _s5
     (setq _s5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get RMPISR::sensors :md5sum-) "ccb7a54de940f8793e51caa067484500")
(setf (get RMPISR::sensors :datatype-) "RMPISR/sensors")
(setf (get RMPISR::sensors :definition-)
      "float32 ir1
float32 ir2
float32 ir3
float32 ir4
float32 s1
float32 s2
float32 s5

")



(provide :RMPISR/sensors "ccb7a54de940f8793e51caa067484500")


