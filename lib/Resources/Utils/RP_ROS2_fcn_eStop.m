function respMsg = RP_ROS2_fcn_eStop(reqMsg, respMsg, model)
%% ROS2™ Navigate Maze Callback
% This function is used as a callback for the /moveRobot ROS2 service
% part of the ROS2 basics examples of the Robotics Playground.
%
% The algorithm sets different commmands to move forward or turn.

% respMsg = reqMsg; % Response is 99 for "int64_value" if service doesn't finish running
% respMsg.float64_value = 99;



%% Disable Motors in RP ROS™ Robot Simulator
    
if strcmp(reqMsg.string_value,'disable')
    set_param([model '/RP ROS™ Robot/Enabled'],'Value','0');
    respMsg.string_value = 'Robot Disabled'; % Set response message
elseif strcmp(reqMsg.string_value,'enable')
    set_param([model '/RP ROS™ Robot/Enabled'],'Value','1')
    respMsg.string_value = 'Robot Enabled'; % Set response message
end

% END callback
end