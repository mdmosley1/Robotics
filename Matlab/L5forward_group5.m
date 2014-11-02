function  [ eec ] = L5forward_group5( jc )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    
    t1=jc(1,1);     % takes angles from jc and separates them
    t2=jc(1,2);
    t3=jc(1,3);
    t4=jc(1,4);
    
    a1=95;       % shoulder to elbow
    a2=95;       % elbow to wrist
    a3=100;      % wrist to center of gripper
    d1=29.4;     % waist to shoulder
    
    % makes A matrices for the 4 frames
    A1=[cos(t1),0,sin(t1),0;sin(t1),0,-cos(t1),0;0,1,0,d1;0,0,0,1];
    A2=[cos(t2),-sin(t2),0,a1*cos(t2);sin(t2),cos(t2),0,a1*sin(t2);0,0,1,0;0,0,0,1];
    A3=[cos(t3),-sin(t3),0,a2*cos(t3);sin(t3),cos(t3),0,a2*sin(t3);0,0,1,0;0,0,0,1];
    A4=[cos(t4),0,sin(t4),a3*cos(t4);-sin(t4),0,cos(t4),a3*sin(t4);0,1,0,0;0,0,0,1];
    
    A1*A2;              % checking stuff
    A1*A2*A3;           % checking more stuff
    T4=A1*A2*A3*A4;
    T4(3,4)=T4(3,4)+52.9;   % adds to the z position to change the origin
                            % so it is on the table
    eec=[T4(1,4),T4(2,4),T4(3,4),t4]
end