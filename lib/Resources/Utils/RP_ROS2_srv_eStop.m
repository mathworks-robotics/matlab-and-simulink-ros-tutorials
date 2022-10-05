%% ROS2™ Navigate Maze Callback
% This function is used as a callback for the /navigateMaze ROS2 service
% part of the ROS2 basics examples of the Robotics Playground

srv_node=ros2node("/RP_emergencyStop");

server = ros2svcserver(srv_node,'/RP_emergencyStop','test_msgs/BasicTypes',{@RP_ROS2_fcn_eStop, 'RP_ROS_robot'});


