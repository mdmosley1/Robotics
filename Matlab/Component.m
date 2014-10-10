classdef Component < handle
%COMPONENT This is general class for the various components of the Lynx robot arm
    
    properties
        mVertices,mFaces,mVnum
    end
    
    methods 
        function h = build(obj,c)
            h = patch('Vertices',obj.mVertices,'Faces',obj.mFaces,'faceColor',c,'EdgeColor'...
                    ,c,'FaceLighting','flat');
            set(gcf, 'Renderer', 'zbuffer');
            camlight();
            axis normal;
        end
        
        function obj = translate(obj,t)
            obj.mVertices(:,1) = obj.mVertices(:,1) + t(1);
            obj.mVertices(:,2) = obj.mVertices(:,2) + t(2);
            obj.mVertices(:,3) = obj.mVertices(:,3) + t(3);
            obj.updateFaces();
        end
        
        function obj = updateFaces(obj)
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