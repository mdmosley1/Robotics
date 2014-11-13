function  [ eec ] = L5forward_group5( jc )
%L5FORWARD_GROUP5 Calculate forward kinematics
%   Detailed explanation goes here
    
    a = [0 9.5 9.5 10];
    d = [2.94 0 0 0];
    t = [jc(1) jc(2) jc(3) jc(4)];
    alp = [pi/2 0 0 0];    
    
    for i=1:4
        A(:,:,i) = getA(a(i), alp(i), d(i), t(i));
    end
    
    T4=A(:,:,1)*A(:,:,2)*A(:,:,3)*A(:,:,4);
    T4(3,4)=T4(3,4)+5.29;   % adds to the z position to change the origin
                            % so it is on the table
    eec=[T4(1,4);T4(2,4);T4(3,4);(jc(2)+jc(3)+jc(4))];
end

