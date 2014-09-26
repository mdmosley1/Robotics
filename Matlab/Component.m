classdef Component
%COMPONENT This is general class for the various components of the Lynx robot arm
        
    % properties (Abstract)
    %     mVertices,mFaces,angle
    % end
    
    methods 
        function build(obj)
            patch('Vertices',obj.mVertices,'Faces',obj.mFaces,'faceColor','b','EdgeColor','b',...
                  'FaceLighting','flat');
            set(gcf, 'Renderer', 'zbuffer');
            camlight();
            axis square;
        end
    end
end

