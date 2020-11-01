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
        
        self.vel_publisher = rospy.Publisher('/cmd_vel' , Twist, queue_size = 1) 

        self.rate = rospy.Rate(1)

        rospy.spin()
    
    
    def generate_cartesian_coord(self, dis, ang_rad) : 


        x= dis* math.cos(ang_rad)

        y = dis * math.sin(ang_ra, )

        return Point(x,y, 0)  
    
  
    def transfrom_base_laser_to_base_link(self, pt): 
        

        listener = tf.TransformListener() 

        listener.waitForTransform('/base_laser' , '/base_link' , rospy.Time(0), rospy.Duration(4.0)) 


        laser_point = PointStamped() 
        laser_point.header.frame_id = "base_laser"
        laser_point.header.stamp = rospy.Time(0) 

        laser_point.point.x = pt.x
        laser_point.point.y = pt.y
        laser_point.point.z = 0.0 


        try: 
            
            transformed_laser_point = listener.transformPoint('/base_link', laser_point)
        
            return transformed_laser_point

        except tf.Exception: 
            rospy.loginfo('There were some exceptions during trannsformations')
            pass


        self.rate.sleep()
    

    

    def laser_callback(self, data): 
    
        dis =  0 
        pos = 0 
        for idx, val in enumerate(data.ranges): 

            if not math.isinf(val): 

                dis = val 
                pos = idx
                break 
        
        
        #rospy.loginfo(f'angle_increment : {angle_increment}')
        angle_rad = data.angle_min + (pos * data.angle_increment)
        angle_deg = angle_rad * 180 / (math.pi)
        
        temp_x = dis * math.cos(angle_rad) 
        temp_y = dis * math.sin(angle_rad) 
        
        temp_point = Point(dis * math.cos(angle_rad) , dis * math.sin(angle_rad), 0 )

        transformed_point = self.transfrom_base_laser_to_base_link(temp_point) 

        print "original x: " , temp_point.x , " original y: ", temp_point.y

        print "transformed x: ", transformed_point.point.x , " transformed y: ", transformed_point.point.y
    
       
        t_x =  transformed_point.point.x
        t_y =  transformed_point.point.y 


        t_dis = t_x * t_x + t_y * t_y 

        if t_dis > 0 : 

            print "Printing t_dis ", t_dis 
            v_x = 1.5 * t_dis 

            w_z = 4 * math.atan2(temp_y, temp_x)
     
            vel_msg = Twist() 

            vel_msg.linear.x = v_x 
            vel_msg.angular.z= w_z


            self.vel_publisher.publish(vel_msg)

if __name__ == '__main__' : 

    x = HuskyBot()  
    
    
