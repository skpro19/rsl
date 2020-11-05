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

        self.scan_subscriber = rospy.Subscriber('/scan', LaserScan, self.laser_callback)
        
        #self.scan_subscriber = rospy.Subscriber('/scan' , LaserScan , self.laser_debugger) 

        self.velocity_publisher = rospy.Publisher('/cmd_vel' , Twist, queue_size = 1) 
        
        self.marker_publisher = rospy.Publisher('/rviz_visusalizer' ,  Marker, queue_size = 1)

        self.rate = rospy.Rate(1)

        rospy.spin()
    
    
    def transform_to_odom_debug(self, laser_point) : 
        
        listener = tf.TransformListener()

        try: 
            
            listener.waitForTransform('/base_laser' , '/base_laser' , rospy.Time(), rospy.Duration(4.0))
            

            odom_point = listener.transformPoint('/base_laser' , laser_point)
            
            print  "Inside the transform_to_odom function" 
            
            #self.print_stampedPoints(laser_point, "laser_frame")
            
            print " "

            #self.print_stampedPoints(odom_point, 'odom_frame')
            
            return odom_point

        except Exception as e: 

            print "Following exception was enconuntered while performing the transformation -> " + str(e)


    def transform_to_odom(self, laser_point) : 
        
        listener = tf.TransformListener()

        try: 
            
            listener.waitForTransform('/odom' , '/base_laser' , rospy.Time(), rospy.Duration(4.0))

            odom_point = listener.transformPoint('/odom' , laser_point)
            
            print  "Inside the transform_to_odom function" 
            
            #self.print_stampedPoints(laser_point, "laser_frame")
            
            print " "

            #self.print_stampedPoints(odom_point, 'odom_frame')
            
            #return odom_point

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

        marker.type = marker.ARROW
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

    
    def print_stampedPoints(self, pt, frame_name) : 
        
        print "Inside the print_stampedPoints function"
        print frame_name , ".x: " , pt.point.x, " " , frame_name, ".y: " , pt.point.y, " " , frame_name, ".z: ", pt.point.z
        print " "

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

                
        #self.send_markers_for_rviz(pillar_dis, pillar_ang)
        
        p_x = pillar_dis * math.cos(pillar_ang) 
        p_y = pillar_dis * math.sin(pillar_ang) 
        p_z =0  

        laser_point = PointStamped() 
        
        laser_point.header.frame_id = "base_laser" 
        laser_point.header.stamp = rospy.Time(0)
        
        laser_point.point = Point (p_x , p_y, p_z)
        

        #odom_point = self.transform_to_odom(laser_point)
        
        self.transform_to_odom_debug(laser_point)

        #self.print_stampedPoints(laser_point, 'laser_frame')
        #self.print_stampedPoints(odom_point, 'odom_frame')
        
        
        #self.send_markers_for_rviz(pillar_dis, pillar_ang)
        
        #self.send_markers_for_rviz(odom_point)
        

    def laser_debugger(self, data) : 

        print "len(ranges) : " , len(data.ranges)


        pos = [] 

        for idx, val in enumerate(data.ranges): 

            if not math.isinf(val) : 

                pos.append(idx) 

    




if __name__ == '__main__' : 

    x = HuskyBot()  
    
    print "Staring the visualisation marker node" 
    
        
