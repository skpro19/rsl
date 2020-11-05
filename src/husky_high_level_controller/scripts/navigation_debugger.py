#!/usr/bin/python

import rospy
from sensor_msgs.msg import LaserScan
import math
from geometry_msgs.msg import PointStamped,  Point, Twist
import tf
from visualization_msgs.msg import Marker 

class HuskyBot: 

    def __init__(self): 

        
        rospy.init_node('husky_node')
            
        self.laser_point = Point(0,0,0) 

        
        self.listener = tf.TransformListener() 
        
        self.listener.waitForTransform('/base_laser'  , '/odom' , rospy.Time().now(), rospy.Duration(1.0))


        self.scan_subscriber = rospy.Subscriber('/scan', LaserScan, self.laser_callback)
        self.tf_subscriber = rospy.Subscriber('/scan' , LaserScan, self.tf_callback)
        
        self.velocity_publisher = rospy.Publisher('/cmd_vel' , Twist, queue_size = 1000) 
        
        self.rate = rospy.Rate(1)

        rospy.spin()
                

    def tf_callback(self, data): 
    

        laser_point_stamped  = PointStamped() 

        laser_point_stamped.header.frame_id = "/base_laser"
        laser_point_stamped.header.stamp = rospy.Time() 

        laser_point_stamped.point = self.laser_point 
        
        try: 
            
            

            ''' Program runs successfully on changing the frame to any frame other than odom '''

            target_frame = '/odom'

            #self.listener.waitForTransform('/base_laser'  , target_frame , rospy.Time().now(), rospy.Duration(1.0))
               
            
            odom_point = self.listener.transformPoint(target_frame , laser_point_stamped)
            
            
            print "laser_point_stamped.x: " , laser_point_stamped.point.x , " laser_point_stamped.y: " , laser_point_stamped.point.y , " laser_point_stamped.z: " , laser_point_stamped.point.z

            print "odom_point.x: " , odom_point.point.x , " odom_point.y: " , odom_point.point.y , " odom_point.z: " , odom_point.point.z 




        except Exception as e: 

            print "Following exception was enconuntered while performing the transformation -> " + str(e)


    def laser_callback(self, data): 
        

        pillar_dis = 100000  

        pos = 0 

         
        for idx, val in enumerate(data.ranges) : 

            if not math.isinf(val): 

                if val  < pillar_dis : 
                    
                    pillar_dis = val 

                    pos = idx 

        pillar_ang  = data.angle_min + pos * data.angle_increment 


        vel_msg = Twist() 

        tolerance = 0.1 
        
        ''' Simple P controller to navigate the bot ''' 

        if pillar_dis > tolerance : 

            v_x = 1.5 * pillar_dis 

            w_z = 4 * (0 - pillar_ang) 

            vel_msg.linear.x = v_x 
            vel_msg.angular.z  = w_z 

            self.velocity_publisher.publish(vel_msg) 
        

        p_x = pillar_dis * math.cos(pillar_ang) 
        p_y = pillar_dis * math.sin(pillar_ang) 
        p_z = 0 

        self.laser_point = Point(p_x, p_y, p_z) 


if __name__ == '__main__' : 

    x = HuskyBot()  
    
    
        
