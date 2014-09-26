clear; close all; clear classes;

bigBase1 = Base(49.07,3.1); bigBase1.build;
smallBase_1 = Base(44.32,3.1); smallBase_1.build;
Servo_1 = Servo(40.3,19.9,42.2); Servo_1.build;
%Servo_2 = Servo(40.3,19.9,42.2); 
bigBase1 = bigBase1.translate(20,0,0);
bigBase1.mVertices

b = Base(10,10);
b.mVertices
b.translate(10,10,10)
b.mVertices

