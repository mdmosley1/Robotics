classdef Block < Component
% SERVO This is a servo from the Lynx robot
    properties
        mX,mY,mZ
    end

    methods    
        % class constructor
        function obj = Block(dim)
            obj.mX = dim(1);
            obj.mY = dim(2);
            obj.mZ = dim(3);
            obj.mVnum = 4; % 4 vertices
            
            obj.mVertices = [0 0 0
                             obj.mX 0 0
                             obj.mX obj.mY 0
                             0 obj.mY 0
                             0 0 obj.mZ
                             obj.mX 0 obj.mZ
                             obj.mX obj.mY obj.mZ
                             0 obj.mY obj.mZ];
            obj.updateFaces();
        end
    end
end
