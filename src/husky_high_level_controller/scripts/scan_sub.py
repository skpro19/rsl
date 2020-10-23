#!/usr/bin/python3 

import rospy
from sensor_msgs.msg import LaserScan 


def callback(data): 

    
    rospy.loginfo(f'data : {data}')

def listener():

    rospy.init_node('scan_sub')

    rospy.Subscriber('scan', LaserScan, callback)

    rospy.spin()


if __name__ == "__main__" :
    
    listener()
