% lets find the calibration constants

%% initialization
s = serial('/dev/tty.usbserial');
fopen(s);

%% constants for servo 0 - base
a0= 1.15;
b0=140;
t0 = 0;
p1 = a0*t0+b0;
fwrite(s,[255 0 p1]);

%% constants for servo 1 - arm1
a1=1;
b1=37;
t1 = 90;
p1 = a1*t1+b1;
fwrite(s,[255 1 p1]);

%% constants for servo2 - arm2
a2=-1.15;
b2=48.5;
t2 = 0;
p2 = a2*t2+b2;
fwrite(s,[255 2 p2]);

%% constants for servo3 - wrist
a3=1.12;
b3=131;
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
