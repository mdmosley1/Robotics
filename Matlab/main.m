clear; close all; clear classes;

% load dimensions
dims

base1 = Cyl(r1,tk); base1.translate([r1,r1,0]); base1.build('r');
base2 = Cyl(r2,tk); base2.translate([r1,r1,tk+sep]); base2.build('b');

splate1 = Block(plateDim); splate1.translate(splate1Pos); splate1.build('y');
servo1=Block(serDim);servo1.translate(ser1Pos);servo1.build('y');

splate2 = Block(plateDim); splate2.translate(splate2Pos);splate2.build('g');
servo2 = Block(serDim); servo2.translate(ser2Pos);servo2.build('g');

bicep1 = Block(bicDim); bicep1.translate(bic1Pos); bicep1.build('r');%bicep1(translate)
bicep2 = Block(bicDim); bicep2.translate(bic2Pos); bicep2.build('r');%bicep1(translate)

servo3 = Block(serDim); servo3.translate(ser3Pos); servo3.build('g');

daspect([max(daspect)*[1 1 1]]);