function vertices = baseVertices(vnum,r,h)
% calculate the vertices for the base

angle = 360/vnum; % angle for vertices
for i=1:vnum
    vertices(i,:) = [r*cosd((i-1)*angle), r*sind((i-1)*angle), 0]; % lower
    vertices(i+vnum,:) = [r*cosd((i-1)*angle), r*sind((i-1)*angle), h]; % upper
end
