
(cl:in-package :asdf)

(defsystem "perception_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "add_obstacle" :depends-on ("_package_add_obstacle"))
    (:file "_package_add_obstacle" :depends-on ("_package"))
  ))