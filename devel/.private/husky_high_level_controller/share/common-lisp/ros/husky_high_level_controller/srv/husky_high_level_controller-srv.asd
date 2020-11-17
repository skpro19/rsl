
(cl:in-package :asdf)

(defsystem "husky_high_level_controller-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "StartStopBot" :depends-on ("_package_StartStopBot"))
    (:file "_package_StartStopBot" :depends-on ("_package"))
  ))