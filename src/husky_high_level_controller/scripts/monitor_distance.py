#!/usr/bin/env python 

import rospy
from husky_high_level_controller.srv import *
from sensor_msgs.msg import LaserScan
import math

def stop_robot_client(): 

    rospy.wait_for_service('start_stop_bot_service') 

    try: 

        stop_bot_handle = rospy.ServiceProxy('start_stop_bot_service' , StartStopBot)

        resp = stop_bot_handle(True) 
        
        return resp.success

    except rospy.ServiceException as e: 
        
        print "Service called failed: ", e


def laser_callback(data): 
    
    tolerance = 2

    pillar_dis = 100000

    pos = 0


    for idx, val in enumerate(data.ranges) :

        if not math.isinf(val):

            if val  < pillar_dis :

                pillar_dis = val

                pos = idx
    
    #print "pillar_dis: " , pillar_dis
    
    if pillar_dis < tolerance: 
		
	print "Attempting to stop the robot" 

        stop_robot_client()


def monitor_distance(): 

    rospy.init_node('monitor_dis') 

    rospy.Subscriber('/scan', LaserScan, laser_callback) 

    rospy.spin()
    
    


if __name__ == '__main__': 

    monitor_distance() 
