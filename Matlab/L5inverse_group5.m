function [jc] = L5inverse_group5( eec )
%L5INVERSE_GROUP5 calculate inverse kinematics
%   takes inputs of x,y,z coordinates and the gripper angle and forms
%   the inverse kinematics
    px=eec(1);        % takes the eec coordinates and separates them
    py=eec(2);      % into px,py,pz and gripper angle
    pz=eec(3)-5.29;
    AG=eec(4);

    a1=9.5;    % bicep
    a2=9.5;    % forearm
    a3=10.0;   % wrist to gripper
    d1=2.94;  % waist to shoulder
    
    t1=atan2(py,px);        % angle of waist
    pw=sqrt(px^2+py^2);     % pw represents the plane on x,y 
    r=pw-a3*cos(AG)       % w position of wrist
    z3=pz-a3*sin(AG);       % z position of wrist
    s = z3-d1
    
    % solves for D as we did in class
    D=(r^2+s^2-a1^2-a2^2)/(2*a1*a2)  
    % solves for angle of elbow
    t3=atan2(D,sqrt(1-D^2));        
    % solves for angle of shoulder
    t2=atan2(r,s)-atan2(a1+a2*cos(t3),a2*sin(t3));
    t4=AG-t3-t2;                % angle of wrist
    
    jc=[t1;t2;t3;t4];    % final array of angles
end