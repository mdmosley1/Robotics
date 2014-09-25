clear; close all;
h = 1;
r = 2;

vnum = 50; % number of vertices (around bottom edge)
fnum = 2 + vnum; % top and bottom + sides
angle = 360/vnum; % angle for vertices

for i=1:vnum
    Vertices(i,:) = [r*cosd((i-1)*angle), r*sind((i-1)*angle), 0]; % lower
    Vertices(i+vnum,:) = [r*cosd((i-1)*angle), r*sind((i-1)*angle), h]; % upper
end

faces = zeros(fnum,vnum);
for i=1:vnum-1 % sides
    faces(i,[1:4]) = [i, i+1, i+1+vnum, i+vnum]; 
    faces(i,[5:end]) = NaN;
end

faces(vnum,[1:4]) = [vnum 1 vnum+1 vnum*2]; faces(vnum,[5:end]) = NaN;

faces(vnum+1,:) = 1:vnum; % bottom
faces(vnum+2,:) = vnum+1:vnum*2; % top

myBase = Base;
myBase.mVertices = Vertices;
myBase.mFaces = faces;
myBase.build()