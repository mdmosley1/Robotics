%% This is a first try

clear; close all;
r = 1; % radius
h = 2; % height


% define vertices
for i=1:12
    vert_link1(i,:) = [r*cosd((i-1)*30) r*sind((i-1)*30) 0]; % lower
    vert_link1(i+12,:) = [r*cosd((i-1)*30) r*sind((i-1)*30) h]; % upper
end

% define faces

face_link1 = zeros(14,12);
for i=1:11 % sides
    face_link1(i,[1:4]) = [i i+1 i+13 i+12]; 
    face_link1(i,[5:end]) = NaN;
end
face_link1(12,[1:4]) = [12 1 13 24]; face_link1(12,[5:end]) = NaN;

face_link1(13,:) = 1:12; % bottom
face_link1(14,:) = 13:24; % top


patch('Vertices',vert_link1,'Faces',face_link1,'faceColor','b','EdgeColor','k', 'FaceLighting','gouraud')
set(gcf, 'Renderer', 'zbuffer');
light;

axis([-2 2 -2 2]);
