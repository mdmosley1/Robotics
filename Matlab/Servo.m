classdef Servo < Component
%SERVO This is a servo from the Lynx robot
    properties
        mW,mH,mL
    end

    methods    
        % class constructor
        function obj = Servo(w,h,l)
            obj.mW = w;
            obj.mH = h;
            obj.mL = l;
            
            obj.mVertices = [0 0 0
                             obj.mW 0 0
                             obj.mW obj.mL 0
                             0 obj.mL 0
                             0 0 obj.mH
                             obj.mW 0 obj.mH
                             obj.mW obj.mL obj.mH
                             0 obj.mL obj.mH];
            
            obj.mFaces = [1 2 6 5
                      2 3 7 6
                      3 4 8 7
                      4 1 5 8
                      1 2 3 4
                      5 6 7 8];
        end
    end
end
