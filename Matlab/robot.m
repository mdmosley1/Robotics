%% The cylinder

clear; close all;
r = 1; % radius
h = 2; % height
vnum = 50; % number of vertices (around top and bottom edges)
fnum = 2 + vnum % top and bottom + sides
angle = 360/vnum; % angle for vertices


% define vertices
for i=1:vnum
    vert_link1(i,:) = [r*cosd((i-1)*angle), r*sind((i-1)*angle), 0]; % lower
    vert_link1(i+vnum,:) = [r*cosd((i-1)*angle), r*sind((i-1)*angle), h]; % upper
end

% define faces

face_link1 = zeros(fnum,vnum);
for i=1:vnum-1 % sides
    face_link1(i,[1:4]) = [i, i+1, i+1+vnum, i+vnum]; 
    face_link1(i,[5:end]) = NaN;
end
face_link1(vnum,[1:4]) = [vnum 1 vnum+1 vnum*2]; face_link1(vnum,[5:end]) = NaN;

face_link1(vnum+1,:) = 1:vnum; % bottom
face_link1(vnum+2,:) = vnum+1:vnum*2; % top


patch('Vertices',vert_link1,'Faces',face_link1,'faceColor','b','EdgeColor','b', 'FaceLighting','flat')
set(gcf, 'Renderer', 'zbuffer');
camlight;

axis([-2 2 -2 2]);
