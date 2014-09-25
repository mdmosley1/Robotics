classdef Base
%BASE This is the base of the Lynx robot arm
    properties
        mVertices
        mFaces
    end
    
    methods
        function build(mVertices,mFaces)
            patch('Vertices',mVertices,'Faces',mFaces,'faceColor','b','EdgeColor','b', 'FaceLighting','flat');
            set(gcf, 'Renderer', 'zbuffer');
            camlight();
            axis([-2 2 -2 2]);
        end
    end
end