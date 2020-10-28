#!/usr/bin/python3 

import rospy
from sensor_msgs.msg import LaserScan 
import math 

def callback(data): 

    range_arr = data.ranges 
   
    range_len = len(range_arr)
    
    pos_list=  []
    

    ang_min = data.angle_min
        
    rospy.loginfo(f'ang_min : {ang_min}')

    ang_inc = data.angle_increment 
    
    rospy.loginfo(f'ang_inc : {ang_inc}')

    rospy.loginfo(f'range_len : {range_len}')

    for idx, val in enumerate(range_arr, start = 1): 

                #rospy.loginfo(f'idx : {idx} val: {val}')
        

        if not math.isinf(val): 
            
            curr_ang = ang_min + (idx * ang_inc)
            
            val_list = [] 

            val_list.append(idx)
            val_list.append(val)
            val_list.append(curr_ang)
            
            pos_list.append(val_list)

        
    for elem in pos_list: 

        for p in elem: 

            rospy.loginfo(p)

        rospy.loginfo(" ")


                    
            


def listener():

    rospy.init_node('scan_sub')

    rospy.Subscriber('scan', LaserScan, callback)

    rospy.spin()


if __name__ == "__main__" :
    
    listener()
