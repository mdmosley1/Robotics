classdef Component < handle
%COMPONENT This is general class for the various components of the Lynx robot arm
    
    properties
        mVertices,mFaces
    end
    
    methods 
        function build(obj)
            patch('Vertices',obj.mVertices,'Faces',obj.mFaces,'faceColor','b','EdgeColor','b',...
                  'FaceLighting','flat');
            set(gcf, 'Renderer', 'zbuffer');
            camlight();
            axis square;
        end
        
        function obj = translate(obj,x,y,z)
            obj.mVertices(:,1) = obj.mVertices(:,1) + x;
            obj.mVertices(:,2) = obj.mVertices(:,2) + y;
            obj.mVertices(:,3) = obj.mVertices(:,3) + z; 
        end
    end
end