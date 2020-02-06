#!/usr/bin/env python
import rospy
import argparse
from mavros_msgs.srv import CommandTOL

def land(id):

    rospy.init_node('land_service')
    rospy.wait_for_service("{}/mavros/cmd/land".format(id))

    land_service = rospy.ServiceProxy("{}/mavros/cmd/land".format(id), CommandTOL)

    print "Landing"
    print land_service(altitude = 0)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description = 'Command a drone to land.')
    parser.add_argument('id', type=str, help='Name of the drone.')
    args = parser.parse_args()

    land(args.id)