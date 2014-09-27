classdef Servo < Component
% SERVO This is a servo from the Lynx robot
    properties
        mW,mL,mH
    end

    methods    
        % class constructor
        function obj = Servo(w,l,h)
            obj.mW = w;
            obj.mL = l;
            obj.mH = h;
            obj.mVnum = 4; % 4 vertices
            
            obj.mVertices = [0 0 0
                             obj.mW 0 0
                             obj.mW obj.mL 0
                             0 obj.mL 0
                             0 0 obj.mH
                             obj.mW 0 obj.mH
                             obj.mW obj.mL obj.mH
                             0 obj.mL obj.mH];
            obj.updateFaces();
        end
    end
end
