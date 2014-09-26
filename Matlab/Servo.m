classdef Servo < Component
%SERVO This is a servo from the Lynx robot
    properties
        mVnum = 4 % 4 on bottom
    end
    
        
        function mFaces = get.mFaces(obj)
            mFaces = [1 2 6 5
                     2 3 7 6
                     3 4 8 7
                     4 1 5 8
                     1 2 3 4
                     5 6 7 8];
        end
        
        function obj = set.mVertices(obj,x)
            mVertices(:,1) = obj.mVertices(:,1) + x;
        end
        
        
        % class constructor
        function obj = Servo(w,h,l)
            obj.mW = w;
            obj.mH = h;
            obj.mL = l;
        end
        
        
    end
end
