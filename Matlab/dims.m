% dimensions are in millimeters, in the format dim = [x y z]

r1 = 49.07; tk = 3.1;
r2 = 44.32; sep = 9.9;

% size of components
bicDim = [tk 119.4 24.5]; %bicep
plateDim = [1.7 61 34.8]; % 
serDim = [36 40.3 19.9]; %servo

% measurements in x
x1=5;x2=10.8;x4=1.5;x5=21.2;x6=5;x7=5; x8=47.7;x9=6.9;x10=15.9;x11=50.7

% measurements in y
y1=18.3;y2=14.8;y10=30;

% measurements in z
z1=10;z2=9.3;z3=7.8;

% positions of components

ser1Pos = [-14.9,17.8,tk*2+sep+9.3];
splate1Pos = [12.1,11.5,tk*2+sep];
bic1Pos = splate1Pos + [x4 0 0] + [x2 y1 z2];

ser2Pos = ser1Pos + [serDim(1) 0 0] + [x10 0 0];
splate2Pos = splate1Pos + [x11 0 0];
bic2Pos = splate2Pos + [x2+x4 y1 z2];

ser3Pos = bic1Pos + [x7,bicDim(2)-12.6-y10,(bicDim(3)-serDim(3))/2];
