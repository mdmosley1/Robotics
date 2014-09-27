clear; close all; clear classes;

r1 = 49.07; tk = 3.1;
r2 = 44.32; sep = 9.9;


base1 = Base(r1,tk); base1.translate(r1,r1,0); base1.build('r');
base2 = Base(r2,tk); base2.translate(r1,r1,tk+sep); base2.build('b');

splate1 = Servo(1.7,61,34.8); splate1.translate(12.1,11.5,tk*2+sep); splate1.build('y');

servo1 = Servo(40.3,42.2,19.9);servo1.translate(-14.9,17.8,tk*2+sep+9.3);servo1.build('y');

splate2 = Servo(1.7,61,34.8); splate2.translate(49+12.1+1.7,11.5,tk*2+sep);splate2.build('g');

servo2 = Servo(40.3,42.2,19.9); servo2.translate(30.7,17.8,tk*2+sep+9.3);servo2.build('g');

bicep1 = Servo(96.9+8.4*2,8.4*2,3.1); bicep1(translate)

bicep2 = Servo(96.9+8.4*2,8.4*2,3.1);


daspect([max(daspect)*[1 1 1]]);

