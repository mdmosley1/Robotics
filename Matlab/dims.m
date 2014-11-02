% dimensions are in millimeters, in the format dim = [x y z]

r1 = 49.07; tk = 3.1; %% tk is the thickness of most surfaces
r2 = 44.32; sep = 9.9; % separation between bases

% measurements in x
x1=5;x2=10.8;x4=1.5;x5=21.2;x6=5;x7=5; x8=47.7;x9=6.9;x10=15.9;x11=50.7;x12=4.7;x13=9.8;x14=14;x16=47.7;x17=12.2;

% measurements in y
y1=18.3;y2=14.8;y6=7.3;y7=50.5;y8=31.7;y10=30;y11=39;y12=16.8;

% measurements in z
z1=10;z2=9.3;z3=7.8;

% size of components
bicDim = [tk 119.4 24.5]; %bicep
plateDim = [1.7 61 34.8]; % servo plate
serDim = [36 40.3 19.9]; %servo
lynxBarDim = [tk 55.1 20.8];
wristDim = [tk 51.6 24.4];
wristPlateDim = [x16 y7-y6 tk];
gBarDim = [6.1 34.52 tk];
gripDim = [8 43 3.1];

base1Offset = [r1 r1 0];
bicOffset = [0 8.4 8.4];
ser3Offset = [0 y10 8.4];

% positions of components
base1Pos = [r1 r1 0];
ser1Pos = [-14.9,17.8,tk*2+sep+9.3];
splate1Pos = [12.1,11.5,tk*2+sep];
bic1Pos = splate1Pos + [x4 0 0] + [x2 y1 z2];

ser2Pos = ser1Pos + [serDim(1) 0 0] + [x10 0 0];
splate2Pos = splate1Pos + [x11 0 0];
bic2Pos = splate2Pos + [x2+x4 y1 z2];

ser3Pos = bic1Pos + [x7,bicDim(2)-12.6-y10,(bicDim(3)-serDim(3))/2];

lynxBarPos1 = ser3Pos + [x12, serDim(2), 0];
lynxBarPos2 = lynxBarPos1 + [x5, 0, 0];

ser4Pos = ser3Pos + [0, serDim(2)+lynxBarDim(2), 0];

wrist1Pos = bic1Pos + [0, bicDim(2)+71.5, 0];
wrist2Pos = bic2Pos + [0, bicDim(2)+71.5, 0];

wristPlatePos = wrist1Pos + [tk, y11, (wristDim(3) - wristPlateDim(3))/2];

gBar1Pos = wristPlatePos + [x17-gBarDim(1)/2 y8-y6 2*tk];
gBar2Pos = gBar1Pos + [0 0 -3*tk];
gBar3Pos = gBar1Pos + [gBarDim(1) y12 0];
gBar4Pos = gBar3Pos + [0 0 -3*tk];

gBar7Pos = wristPlatePos + [x16-x17-gBarDim(1)/2 y8-y6 2*tk];

gBar5Pos = gBar7Pos + [-gBarDim(1) +y12 0];
gBar6Pos = gBar5Pos + [0 0 -3*tk];

%grip1Pos = gBar1Pos + [ 0 29.06 -tk];


