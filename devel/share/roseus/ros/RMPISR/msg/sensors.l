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
    ((:ir1 __ir1) 0)
    ((:ir2 __ir2) 0)
    ((:ir3 __ir3) 0)
    ((:ir4 __ir4) 0)
    ((:s1 __s1) 0)
    ((:s2 __s2) 0)
    ((:s5 __s5) 0)
    )
   (send-super :init)
   (setq _ir1 (round __ir1))
   (setq _ir2 (round __ir2))
   (setq _ir3 (round __ir3))
   (setq _ir4 (round __ir4))
   (setq _s1 (round __s1))
   (setq _s2 (round __s2))
   (setq _s5 (round __s5))
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
    ;; uint8 _ir1
    1
    ;; uint8 _ir2
    1
    ;; uint8 _ir3
    1
    ;; uint8 _ir4
    1
    ;; uint8 _s1
    1
    ;; uint8 _s2
    1
    ;; uint8 _s5
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ir1
       (write-byte _ir1 s)
     ;; uint8 _ir2
       (write-byte _ir2 s)
     ;; uint8 _ir3
       (write-byte _ir3 s)
     ;; uint8 _ir4
       (write-byte _ir4 s)
     ;; uint8 _s1
       (write-byte _s1 s)
     ;; uint8 _s2
       (write-byte _s2 s)
     ;; uint8 _s5
       (write-byte _s5 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ir1
     (setq _ir1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _ir2
     (setq _ir2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _ir3
     (setq _ir3 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _ir4
     (setq _ir4 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _s1
     (setq _s1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _s2
     (setq _s2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _s5
     (setq _s5 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get RMPISR::sensors :md5sum-) "9eedb779141fc8e42c127e038f10520e")
(setf (get RMPISR::sensors :datatype-) "RMPISR/sensors")
(setf (get RMPISR::sensors :definition-)
      "uint8 ir1
uint8 ir2
uint8 ir3
uint8 ir4
uint8 s1
uint8 s2
uint8 s5

")



(provide :RMPISR/sensors "9eedb779141fc8e42c127e038f10520e")


