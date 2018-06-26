
(cl:in-package :asdf)

(defsystem "RMPISR-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "sensors" :depends-on ("_package_sensors"))
    (:file "_package_sensors" :depends-on ("_package"))
  ))