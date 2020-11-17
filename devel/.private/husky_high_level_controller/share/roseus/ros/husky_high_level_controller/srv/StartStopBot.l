;; Auto-generated. Do not edit!


(when (boundp 'husky_high_level_controller::StartStopBot)
  (if (not (find-package "HUSKY_HIGH_LEVEL_CONTROLLER"))
    (make-package "HUSKY_HIGH_LEVEL_CONTROLLER"))
  (shadow 'StartStopBot (find-package "HUSKY_HIGH_LEVEL_CONTROLLER")))
(unless (find-package "HUSKY_HIGH_LEVEL_CONTROLLER::STARTSTOPBOT")
  (make-package "HUSKY_HIGH_LEVEL_CONTROLLER::STARTSTOPBOT"))
(unless (find-package "HUSKY_HIGH_LEVEL_CONTROLLER::STARTSTOPBOTREQUEST")
  (make-package "HUSKY_HIGH_LEVEL_CONTROLLER::STARTSTOPBOTREQUEST"))
(unless (find-package "HUSKY_HIGH_LEVEL_CONTROLLER::STARTSTOPBOTRESPONSE")
  (make-package "HUSKY_HIGH_LEVEL_CONTROLLER::STARTSTOPBOTRESPONSE"))

(in-package "ROS")





(defclass husky_high_level_controller::StartStopBotRequest
  :super ros::object
  :slots (_data ))

(defmethod husky_high_level_controller::StartStopBotRequest
  (:init
   (&key
    ((:data __data) nil)
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; bool _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _data
       (if _data (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _data
     (setq _data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass husky_high_level_controller::StartStopBotResponse
  :super ros::object
  :slots (_success _message ))

(defmethod husky_high_level_controller::StartStopBotResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass husky_high_level_controller::StartStopBot
  :super ros::object
  :slots ())

(setf (get husky_high_level_controller::StartStopBot :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get husky_high_level_controller::StartStopBot :datatype-) "husky_high_level_controller/StartStopBot")
(setf (get husky_high_level_controller::StartStopBot :request) husky_high_level_controller::StartStopBotRequest)
(setf (get husky_high_level_controller::StartStopBot :response) husky_high_level_controller::StartStopBotResponse)

(defmethod husky_high_level_controller::StartStopBotRequest
  (:response () (instance husky_high_level_controller::StartStopBotResponse :init)))

(setf (get husky_high_level_controller::StartStopBotRequest :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get husky_high_level_controller::StartStopBotRequest :datatype-) "husky_high_level_controller/StartStopBotRequest")
(setf (get husky_high_level_controller::StartStopBotRequest :definition-)
      "bool data
---
bool success
string message

")

(setf (get husky_high_level_controller::StartStopBotResponse :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get husky_high_level_controller::StartStopBotResponse :datatype-) "husky_high_level_controller/StartStopBotResponse")
(setf (get husky_high_level_controller::StartStopBotResponse :definition-)
      "bool data
---
bool success
string message

")



(provide :husky_high_level_controller/StartStopBot "09fb03525b03e7ea1fd3992bafd87e16")


