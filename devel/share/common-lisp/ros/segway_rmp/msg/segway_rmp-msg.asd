
(cl:in-package :asdf)

(defsystem "segway_rmp-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "SegwayStatus" :depends-on ("_package_SegwayStatus"))
    (:file "_package_SegwayStatus" :depends-on ("_package"))
    (:file "SegwayStatusStamped" :depends-on ("_package_SegwayStatusStamped"))
    (:file "_package_SegwayStatusStamped" :depends-on ("_package"))
  ))