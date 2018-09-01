
(cl:in-package :asdf)

(defsystem "RMPISR-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "addpoint" :depends-on ("_package_addpoint"))
    (:file "_package_addpoint" :depends-on ("_package"))
    (:file "arrivedDestiny" :depends-on ("_package_arrivedDestiny"))
    (:file "_package_arrivedDestiny" :depends-on ("_package"))
    (:file "go" :depends-on ("_package_go"))
    (:file "_package_go" :depends-on ("_package"))
    (:file "markerdetected" :depends-on ("_package_markerdetected"))
    (:file "_package_markerdetected" :depends-on ("_package"))
    (:file "odomError" :depends-on ("_package_odomError"))
    (:file "_package_odomError" :depends-on ("_package"))
    (:file "resetrmp" :depends-on ("_package_resetrmp"))
    (:file "_package_resetrmp" :depends-on ("_package"))
    (:file "stop" :depends-on ("_package_stop"))
    (:file "_package_stop" :depends-on ("_package"))
  ))