function [jc] = L5inverse_group5( eec )
%UNTITLED2 Summary of this function goes here
%   takes inputs of x,y,z coordinates and the gripper angle and forms
%   the inverse kinematics

    px=eec(1,1);        % takes the eec coordinates and separates them
    py=eec(1,2);        % into px,py,pz and gripper angle
    pz=eec(1,3)-52.9;
    AG=eec(1,4);

    a1=95;    % bicep
    a2=95;    % forearm
    a3=100;   % wrist to gripper
    d1=29.4;  % waist to shoulder
    
    t1=atan2(py,px);        % angle of waist
    pw=sqrt(px^2+py^2);     % pw represents the plane on x,y that the robot is
    w3=pw-a3*cos(AG);       % w position of wrist
    z3=pz-a3*sin(AG);       % z position of wrist
    a13=sqrt(w3^2+(z3-d1)^2);   % distance from shoulder to wrist
    A=acos((a13^2+a1^2-a2^2)/(2*a13*a1));  % using law of cosines
    t2=atan2((z3-d1),w3)-A;     % solves for shoulder angle
    w2=a1*cos(t2);              % w position of the elbow
    z2=a1*sin(t2);              % z position of the elbow
    t3=atan2((z3-z2-d1),(w3-w2))-t2;    % angle of elbow
    t4=AG-t3-t2;                % angle of wrist

    t1;
    t2;
    t3;
    t4;
    jc=[t1,t2,t3,t4]    % final array of angles
end

