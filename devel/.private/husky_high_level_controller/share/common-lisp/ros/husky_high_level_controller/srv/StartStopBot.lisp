; Auto-generated. Do not edit!


(cl:in-package husky_high_level_controller-srv)


;//! \htmlinclude StartStopBot-request.msg.html

(cl:defclass <StartStopBot-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass StartStopBot-request (<StartStopBot-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartStopBot-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartStopBot-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name husky_high_level_controller-srv:<StartStopBot-request> is deprecated: use husky_high_level_controller-srv:StartStopBot-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <StartStopBot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader husky_high_level_controller-srv:data-val is deprecated.  Use husky_high_level_controller-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartStopBot-request>) ostream)
  "Serializes a message object of type '<StartStopBot-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'data) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartStopBot-request>) istream)
  "Deserializes a message object of type '<StartStopBot-request>"
    (cl:setf (cl:slot-value msg 'data) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartStopBot-request>)))
  "Returns string type for a service object of type '<StartStopBot-request>"
  "husky_high_level_controller/StartStopBotRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartStopBot-request)))
  "Returns string type for a service object of type 'StartStopBot-request"
  "husky_high_level_controller/StartStopBotRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartStopBot-request>)))
  "Returns md5sum for a message object of type '<StartStopBot-request>"
  "09fb03525b03e7ea1fd3992bafd87e16")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartStopBot-request)))
  "Returns md5sum for a message object of type 'StartStopBot-request"
  "09fb03525b03e7ea1fd3992bafd87e16")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartStopBot-request>)))
  "Returns full string definition for message of type '<StartStopBot-request>"
  (cl:format cl:nil "bool data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartStopBot-request)))
  "Returns full string definition for message of type 'StartStopBot-request"
  (cl:format cl:nil "bool data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartStopBot-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartStopBot-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StartStopBot-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude StartStopBot-response.msg.html

(cl:defclass <StartStopBot-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass StartStopBot-response (<StartStopBot-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartStopBot-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartStopBot-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name husky_high_level_controller-srv:<StartStopBot-response> is deprecated: use husky_high_level_controller-srv:StartStopBot-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <StartStopBot-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader husky_high_level_controller-srv:success-val is deprecated.  Use husky_high_level_controller-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <StartStopBot-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader husky_high_level_controller-srv:message-val is deprecated.  Use husky_high_level_controller-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartStopBot-response>) ostream)
  "Serializes a message object of type '<StartStopBot-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartStopBot-response>) istream)
  "Deserializes a message object of type '<StartStopBot-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartStopBot-response>)))
  "Returns string type for a service object of type '<StartStopBot-response>"
  "husky_high_level_controller/StartStopBotResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartStopBot-response)))
  "Returns string type for a service object of type 'StartStopBot-response"
  "husky_high_level_controller/StartStopBotResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartStopBot-response>)))
  "Returns md5sum for a message object of type '<StartStopBot-response>"
  "09fb03525b03e7ea1fd3992bafd87e16")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartStopBot-response)))
  "Returns md5sum for a message object of type 'StartStopBot-response"
  "09fb03525b03e7ea1fd3992bafd87e16")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartStopBot-response>)))
  "Returns full string definition for message of type '<StartStopBot-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartStopBot-response)))
  "Returns full string definition for message of type 'StartStopBot-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartStopBot-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartStopBot-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StartStopBot-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StartStopBot)))
  'StartStopBot-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StartStopBot)))
  'StartStopBot-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartStopBot)))
  "Returns string type for a service object of type '<StartStopBot>"
  "husky_high_level_controller/StartStopBot")