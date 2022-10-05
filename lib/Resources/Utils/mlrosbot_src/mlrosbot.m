classdef mlrosbot
% MLROSBOT Creates a MATLAB Disc Robot in a virtual environment that cane controlled through ROS messages.
%   This class is intended for learning to program in 
%   MATLAB using the Robotics Playground. This robot provides a virtual
%   environment visualization and access to sensors and actuators using
%   ROS features.
%   
%   EXAMPLE:
%      myRobot = mlrobot;
%      mlrobotstart(myRobot);
%      mlrobotsetmotorvoltage(myRobot,'left',3);
%      wheelSpeed = mlrobotreadwheelspeed(myRobot,'left');
%      mlrobotstop(myRobot);
%
%   Open getting started example with the following command:
%
%       >> edit mlrobot_getting_started
%
%
%   When using with a custom model that reuses the 'MATLAB Disc Robot' from
%   the Simulink Robotics Playground library, call this class by passing
%   the custom model name as an input
%
%       myRobot = mlrosbot('customModelName')
%
%   See also MLROBOTSTART MLROBOTSTOP MLROBOTSETMOTORVOLTAGE
%   MLROBOTREADWHEELSPEED MLROBOTREADCOMPASSANGLE
%
%  Copyright 2018 The MathWorks, Inc.
      
    properties
        modelName='RP_ROS_robot';
    end
    
    methods
        function obj = mlrosbot(varargin)
            % The constructor should initialize the class and change the
            % modelName if a custom model is used
            if nargin==1
                obj.modelName=varargin{:};
            end

        end
        function obj = close(obj)
            bdclose(obj.modelName);
        end
        
        function obj=connect(obj)
            if ~bdIsLoaded(obj.modelName)
                disp('Loading robot environment...')
                load_system(obj.modelName)
                disp('Robot environment loaded')
            end
            disp('Starting simulation...')
            set_param(obj.modelName,'SimulationCommand','start');

            disp('Simulation started')
        end
        
        function disconnect(obj)
            set_param(obj.modelName,'SimulationCommand','stop')
            disp('Simulation stopped')
        end
        
        
    end
        
end

