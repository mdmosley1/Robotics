classdef Servo < Component
%SERVO This is a servo from the Lynx robot
    properties
        mW
        mH
        mL
        mVnum = 4 % 4 on bottom
    end
    
    properties (Dependent = true)
        mVertices,mFaces
    end

    methods
        % getter methods for dependent properties
        
        function mVertices = get.mVertices(obj)
            mVertices = [0 0 0
                         obj.mW 0 0
                         obj.mW obj.mL 0
                         0 obj.mL 0
                         0 0 obj.mH
                         obj.mW 0 obj.mH
                         obj.mW obj.mL obj.mH
                         0 obj.mL obj.mH];
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
