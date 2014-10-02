clear; close all; clear classes;

% load dimensions
dims


base1 = Cyl(r1,tk); base1.translate(r1,r1,0); base1.build('r');
base2 = Cyl(r2,tk); base2.translate(r1,r1,tk+sep); base2.build('b');

splate1 = Block(plateDim); splate1.translate(12.1,11.5,tk*2+sep); splate1.build('y');
servo1=Block(serDim);servo1.translate(-14.9,17.8,tk*2+sep+9.3);servo1.build('y');

splate2 = Block(plateDim); splate2.translate(49+12.1+1.7,11.5,tk*2+sep);splate2.build('g');
servo2 = Block(serDim); servo2.translate(30.7,17.8,tk*2+sep+9.3);servo2.build('g');

bicep1 = Block(bicDim); bicep1.build('r');%bicep1(translate)
bicep2 = Block(bicDim); bicep2.build('r');%bicep1(translate)

daspect([max(daspect)*[1 1 1]]);