% lets find the calibration constants

%% initialization
s = serial('/dev/tty.usbserial');
fopen(s);

%% constants for servo 0 - base
a0= -1.15;
b0= 143;
t0 = 0;
p1 = a0*t0+b0;
fwrite(s,[255 0 p1]);

%% constants for servo 1 - arm1
a1=1;
b1=35;
t1 = 0;
p1 = a1*t1+b1;
fwrite(s,[255 1 p1]);

%% constants for servo2 - arm2
a2=-1.13;
b2=40;
t2 = 0;
p2 = a2*t2+b2;
fwrite(s,[255 2 p2]);

%% constants for servo3 - wrist
a3=1.18;
b3=133;
t3 = 0;
p3 = a3*t3+b3;
fwrite(s,[255 3 p3]);

%% constants for servo4 - gripper
% min 30
% max 120
% d is desired gripper width in cm
a4=15;
b4=20;
d = 5;
p4 = a4*d+b4;
fwrite(s,[255 4 p4]);

%% save coeffients to file
A = [a0 a1 a2 a3 a4];
B = [b0 b1 b2 b3 b4];
save('calibration','A','B');
