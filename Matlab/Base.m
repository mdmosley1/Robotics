classdef Base < Component
%BASE This is the base of the Lynx robot arm
    properties
        mR 
        mH
        mVnum = 50 % 50 vertices on bottom
    end
    
    properties (Dependent = true)
        mVertices,mFaces,angle
    end
    
    methods
        % getter methods for dependent properties
        function angle = get.angle(obj)
            angle = 360 / obj.mVnum;
        end
        
        function mVertices = get.mVertices(obj)
            for i=1:obj.mVnum
                mVertices(i,:) = [obj.mR*cosd((i-1)*obj.angle), obj.mR*sind((i-1)*obj.angle), 0]; % lower
                mVertices(i+obj.mVnum,:) = [obj.mR*cosd((i-1)*obj.angle),...
                                    obj.mR*sind((i-1)*obj.angle), obj.mH]; % upper
            end
        end
        
        function mFaces = get.mFaces(obj)
            mFaces = zeros(obj.mVnum+2,obj.mVnum);
            for i=1:obj.mVnum-1 % sides
                mFaces(i,[1:4]) = [i, i+1, i+1+obj.mVnum, i+obj.mVnum]; 
                mFaces(i,[5:end]) = NaN;
            end
            mFaces(obj.mVnum,[1:4]) = [obj.mVnum 1 obj.mVnum+1 obj.mVnum*2];
            mFaces(obj.mVnum,[5:end]) = NaN;
            mFaces(obj.mVnum+1,:) = 1:obj.mVnum; % bottom
            mFaces(obj.mVnum+2,:) = obj.mVnum+1:obj.mVnum*2; % top
        end
        
            % class constructor
        function obj = Base(r,h)
            obj.mR = r;
            obj.mH = h;
        end
    end
    

end