classdef Gripper < Component
% GRIPPER This is a servo from the Lynx robot
    properties
        pos
        joint = [2.3,2.3,0];
    end

    methods    
        % class constructor
        function obj = Gripper()
            obj.mVnum = 5; % 4 vertices
            tk = 3.1;
            obj.mVertices = [0 0 0;
                             4.6 0 0;
                             9.5 22.1 0;
                             4.8 43.2 0;
                             0 42.3 0;
                             0 0 tk;
                             4.6 0 tk;
                             9.5 22.1 tk;
                             4.8 43.2 tk;
                             0 42.3 tk];
            obj.updateFaces();
        end
    end
end