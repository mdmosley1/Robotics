classdef Base < Component
% BASE This is the base of the Lynx robot arm
    properties
        mR, mH, angle, 
    end
    
    methods
        % class constructor
        function obj = Base(r,h)
            obj.mR = r;
            obj.mH = h;
            obj.mVnum = 50; % 50 vertices on bottom
            obj.angle = 360 / obj.mVnum;

            for i=1:obj.mVnum
                obj.mVertices(i,:) = [obj.mR*cosd((i-1)*obj.angle), obj.mR*...
                                    sind((i-1)*obj.angle), 0]; % lower v's
                obj.mVertices(i+obj.mVnum,:) = [obj.mR*cosd((i-1)*obj.angle),...
                                    obj.mR*sind((i-1)*obj.angle), obj.mH]; % upper v's
                obj.updateFaces();
            end
        end
    end
end