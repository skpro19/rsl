#!/usr/bin/python3

import rospy
from geometry_msgs.msg import Twist

def move(): 

    rospy.init_node('vel_publisher')
    vel_publisher = rospy.Publisher('/cmd_vel' , Twist, queue_size =10)

    vel_msg = Twist() 

    vel_msg.linear.x =0 
    vel_msg.linear.y= 1


    while not rospy.is_shutdown(): 
        vel_publisher.publish(vel_msg)
    
if __name__ == "__main__": 

    try: 

        move()

    except rospy.ROSInterruptException: pass 

