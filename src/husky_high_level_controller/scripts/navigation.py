#!/usr/bin/python

import rospy
from sensor_msgs.msg import LaserScan
import math
from geometry_msgs.msg import PointStamped,  Point, Twist
import tf


class HuskyBot: 

    def __init__(self): 

        
        rospy.init_node('husky_node')

        self.scan_subscriber = rospy.Subscriber('/scan', LaserScan, self.laser_callback)
        
        #self.scan_subscriber = rospy.Subscriber('/scan' , LaserScan , self.laser_debugger) 

        self.velocity_publisher = rospy.Publisher('/cmd_vel' , Twist, queue_size = 1) 

        self.rate = rospy.Rate(1)

        rospy.spin()
    
   
        
        

        

    def laser_callback(self, data): 
        
        pillar_dis = 100000  

        pos = 0 

         
        for idx, val in enumerate(data.ranges) : 

            if not math.isinf(val): 

                if val  < pillar_dis : 
                    
                    pillar_dis = val 

                    pos = idx 

        pillar_ang  = data.angle_min + pos * data.angle_increment 


        print "pillar_dis: " , pillar_dis , " pillar_ang(rad): " , pillar_ang, " pillar_ang(deg): " , pillar_ang * 180 / (math.pi)
            

        vel_msg = Twist() 

        tolerance = 0.1 

        if pillar_dis > tolerance : 

            v_x = 1.5 * pillar_dis 

            w_z = 4 * (0 - pillar_ang) 

            vel_msg.linear.x = v_x 
            vel_msg.angular.z  = w_z 

            self.velocity_publisher.publish(vel_msg) 

        



    def laser_debugger(self, data) : 

        print "len(ranges) : " , len(data.ranges)


        pos = [] 

        for idx, val in enumerate(data.ranges): 

            if not math.isinf(val) : 

                pos.append(idx) 

    




if __name__ == '__main__' : 

    x = HuskyBot()  
    
    
