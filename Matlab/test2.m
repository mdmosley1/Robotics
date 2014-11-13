% lets test the forward and inverse kinematics

jc = [0 21 0 -25];
jc = jc*pi/180;
eec = L5forward_group5(jc)
jc2 = L5inverse_group5(eec);
jc2 = jc2 * 180/pi