classdef Base < Component
%BASE This is the base of the Lynx robot arm
    properties
        mR, mH, angle, mVnum = 50 % 50 vertices on bottom
    end
    
    methods
        % class constructor
        function obj = Base(r,h)
            obj.mR = r;
            obj.mH = h;
            obj.angle = 360 / obj.mVnum;

            for i=1:obj.mVnum
                obj.mVertices(i,:) = [obj.mR*cosd((i-1)*obj.angle), obj.mR*...
                                  sind((i-1)*obj.angle), 0]; % lower v's
                obj.mVertices(i+obj.mVnum,:) = [obj.mR*cosd((i-1)*obj.angle),...
                                    obj.mR*sind((i-1)*obj.angle), obj.mH]; % upper v's
            end
            
            obj.mFaces = zeros(obj.mVnum+2,obj.mVnum);
            for i=1:obj.mVnum-1 % sides
                obj.mFaces(i,[1:4]) = [i, i+1, i+1+obj.mVnum, i+obj.mVnum]; 
                obj.mFaces(i,[5:end]) = NaN;
            end
            obj.mFaces(obj.mVnum,[1:4]) = [obj.mVnum 1 obj.mVnum+1 obj.mVnum*2];
            obj.mFaces(obj.mVnum,[5:end]) = NaN;
            obj.mFaces(obj.mVnum+1,:) = 1:obj.mVnum; % bottom
            obj.mFaces(obj.mVnum+2,:) = obj.mVnum+1:obj.mVnum*2; % top
        end
    end
end