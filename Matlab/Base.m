classdef Base
%BASE This is the base of the Lynx robot arm
    properties (Constant)
        r = 5
        h = 5
        vnum = 50
    end
    
    properties (Dependent = true)
        mVertices,mFaces,angle
    end
    
    methods
        function angle = get.angle(obj)
            angle = 360 / obj.vnum;
        end
        
        function mVertices = get.mVertices(obj)
            for i=1:obj.vnum
                mVertices(i,:) = [obj.r*cosd((i-1)*obj.angle), obj.r*sind((i-1)*obj.angle), 0]; % lower
                mVertices(i+obj.vnum,:) = [obj.r*cosd((i-1)*obj.angle), obj.r*sind((i-1)*obj.angle), obj.h]; % upper
            end
        end
        
        function build(mVertices,mFaces)
            patch('Vertices',mVertices,'Faces',mFaces,'faceColor','b','EdgeColor','b', 'FaceLighting','flat');
            set(gcf, 'Renderer', 'zbuffer');
            camlight();
            axis([-2 2 -2 2]);
        end
    end
end