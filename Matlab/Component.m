classdef Component
%COMPONENT This is general class for the various components of the Lynx robot arm
        
    properties
        mVertices
    end
    
    methods 
        function build()
            patch('Vertices',mVertices,'Faces',faces,'faceColor','b','EdgeColor','b', 'FaceLighting','flat');
            set(gcf, 'Renderer', 'zbuffer');
            camlight();
            axis([-2 2 -2 2]);
        end
    end
end

