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
            
        print "huskyBot Initiated"


        self.listener = tf.TransformListener() 
        
        #self.listener.waitForTransform('/base_laser'  , '/odom' , rospy.Time().now(), rospy.Duration(10.0))


        self.scan_subscriber = rospy.Subscriber('/scan', LaserScan, self.laser_callback)
        

        self.velocity_publisher = rospy.Publisher('/cmd_vel' , Twist, queue_size = 1000) 
        
        self.marker_publisher = rospy.Publisher('/rviz_visusalizer' ,  Marker, queue_size = 1)
        
        rospy.spin()
                
    def send_markers_for_rviz(self, odom_point): 
        
        print "Inside the send markers function" 
        
        p_x = odom_point.point.x
        p_y  = odom_point.point.y


        marker  = Marker() 

        #marker.header.frame_id = "base_laser" 
        marker.header.frame_id = odom_point.header.frame_id
        #marker.header.stamp = rospy.Time(0 
        marker.header.stamp = odom_point.header.stamp 
        marker.id = 0 

        marker.type = marker.SPHERE
        marker.action = marker.ADD 
        
        marker.pose.position = odom_point.point

        #marker.pose.position.x = p_x
        #marker.pose.position.y =p_y
        #marker.pose.position.z =0

        marker.pose.orientation.x = 0 
        marker.pose.orientation.y=0
        marker.pose.orientation.z =0 
        marker.pose.orientation.w= 1.0 

        marker.scale.x = 100
        marker.scale.y =1
        marker.scale.z= 1

        marker.color.a = 1 
        marker.color.r = 0
        marker.color.g=1.0 
        marker.color.b=0 

        
        self.marker_publisher.publish(marker) 


    def transform_to_odom(self, laser_point): 
    

        laser_point_stamped  = PointStamped() 

       
        laser_point_stamped.header.frame_id = "/base_laser"
        laser_point_stamped.header.stamp = rospy.Time() 

        laser_point_stamped.point = laser_point 
        
        try: 
            
            

            ''' Program runs successfully on changing the frame to any frame other than odom '''

            target_frame = '/odom'

            #self.listener.waitForTransform('/base_laser'  , target_frame , rospy.Time().now(), rospy.Duration(1.0))
               
            
            odom_point = self.listener.transformPoint(target_frame , laser_point_stamped)
            
            
            return odom_point
        except Exception as e: 

            print "Following exception was enconuntered while performing the transformation -> " + str(e)
        



    def send_markers_for_rviz(self, odom_point): 
        
        print "Inside the send markers function" 
        
        p_x = odom_point.point.x
        p_y  = odom_point.point.y


        marker  = Marker() 

        #marker.header.frame_id = "base_laser" 
        marker.header.frame_id = odom_point.header.frame_id
        #marker.header.stamp = rospy.Time(0 
        marker.header.stamp = odom_point.header.stamp 
        marker.id = 0 

        marker.type = marker.SPHERE
        marker.action = marker.ADD 
        
        marker.pose.position = odom_point.point

        #marker.pose.position.x = p_x
        #marker.pose.position.y =p_y
        #marker.pose.position.z =0

        marker.pose.orientation.x = 0 
        marker.pose.orientation.y=0
        marker.pose.orientation.z =0 
        marker.pose.orientation.w= 1.0 

        marker.scale.x = 1
        marker.scale.y = 0.1
        marker.scale.z= 0.1

        marker.color.a = 1 
        marker.color.r = 0
        marker.color.g=1.0 
        marker.color.b=0 

        
        self.marker_publisher.publish(marker) 


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
        

        laser_point = Point(p_x, p_y, p_z) 
        
        odom_point = self.transform_to_odom(laser_point)  
        
        print "odom_point.x: " , odom_point.point.x , " odom_point.y: " , odom_point.point.y, " odom_point.z: " , odom_point.point.z

        
        self.send_markers_for_rviz(odom_point)

        



if __name__ == '__main__' : 

    x = HuskyBot()  
    
    
        
