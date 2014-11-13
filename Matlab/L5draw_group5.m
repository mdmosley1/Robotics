function L5draw_group5 (jc,grip)
% load dimensions
    dims
    % color map
    clr = lines(50);

    % Initialize components and set positions.
    base1 = Cyl(r1,tk); base1.translate([r1,r1,0]); base1.build(clr(20,:));
    base2 = Cyl(r2,tk); base2.translate([r1,r1,tk+sep]); base2.build(clr(19,:));

    splate1 = Block(plateDim); splate1.translate(splate1Pos);
    servo1=Block(serDim); servo1.translate(ser1Pos);

    splate2 = Block(plateDim); splate2.translate(splate2Pos);
    servo2 = Block(serDim); servo2.translate(ser2Pos);

    bicep1 = Block(bicDim); bicep1.translate(bic1Pos);
    bicep2 = Block(bicDim); bicep2.translate(bic2Pos);

    servo3 = Block(serDim); servo3.translate(ser3Pos);

    lynxBar1 = Block(lynxBarDim); lynxBar1.translate(lynxBarPos1);
    lynxBar2 = Block(lynxBarDim); lynxBar2.translate(lynxBarPos2);

    servo4 = Block(serDim); servo4.translate(ser4Pos);servo4.name='Servo4';

    wrist1 = Block(wristDim); wrist1.translate(wrist1Pos);
    wrist2 = Block(wristDim); wrist2.translate(wrist2Pos);

    wristPlate = Block(wristPlateDim); wristPlate.translate(wristPlatePos); wristPlate.name='Wrist Plate';

    gBar1 = Block(gBarDim); gBar1.translate(gBar1Pos); gBar1.pos=gBar1Pos;
    gBar2 = Block(gBarDim); gBar2.translate(gBar2Pos); gBar2.pos=gBar2Pos;
    gBar3 = Block(gBarDim); gBar3.translate(gBar3Pos); gBar3.pos=gBar3Pos;
    gBar4 = Block(gBarDim); gBar4.translate(gBar4Pos); gBar4.pos=gBar4Pos;
    gBar5 = Block(gBarDim); gBar5.translate(gBar5Pos); gBar5.pos=gBar5Pos;
    gBar6 = Block(gBarDim); gBar6.translate(gBar6Pos); gBar6.pos=gBar6Pos;
    gBar7 = Block(gBarDim); gBar7.translate(gBar7Pos); gBar7.pos=gBar7Pos;

    grip1 = Block(gripDim); grip1.translate([-5 -5 0]);grip1.rotate([0 0 20]); grip1.translate([5 5 0]);
    grip2 = Block(gripDim); grip2.translate([-5 -5 0]);grip2.rotate([0 0 -20]); grip2.translate([5 5 0]);
    
    myGripper1 = Gripper; myGripper1.translate(-myGripper1.joint); myGripper1.rotate([0 0 12.3]); myGripper1.translate(myGripper1.joint);
    Reflect = [-1 0 0; 0 1 0; 0 0 1];
    myGripper2 = Gripper;myGripper2.mVertices= myGripper1.mVertices * Reflect;

    empty1 = Block([0 0 0]); 
    array = [splate1 servo1 splate2 servo2... % 1 - 4
             bicep1 bicep2... % 5 - 6
             servo3 lynxBar1 lynxBar2 servo4... % 7 - 10
             wrist1 wrist2 wristPlate... % 11 - 13
             gBar1 gBar2 gBar3 gBar4 gBar5 gBar6 gBar7... % 14 - 20
             myGripper1 myGripper2  empty1 empty1 empty1... % 21 - 26
             empty1 empty1 empty1 empty1 empty1 empty1 empty1]; % 27 - 33

    % Rotations 
    % convert gripper width in cm to theta
    theta = grip*10;
    
    for i = 14:17
        array(i).translate(-array(i).pos);
        array(i).rotate([0 0 -theta]);
        array(i).translate(array(i).pos)
    end

    for i = 18:20
        array(i).translate(-array(i).pos);
        array(i).rotate([0 0 theta]);
        array(i).translate(array(i).pos);
    end
   
    myGripper1.translate(gBar1Pos + [-cosd(90-theta)*29.06 sind(90-theta)*29.06 -1.5*tk]);
    myGripper2.translate(gBar7Pos + [cosd(90-theta)*29.06 sind(90-theta)*29.06 -1.5*tk]);

    for i = 1:22
        % translate everyting after servo4 to origin, rotate and then translate back
        array(i+10).translate(-wrist1Pos-bicOffset);
        array(i+10).rotate([-jc(4) 0 0]);
        array(i+10).translate(+wrist1Pos+bicOffset);
        
        % translate everything after servo3 to origin, rotate and then translate back
        array(i+6).translate(-ser3Pos-ser3Offset);
        array(i+6).rotate([-jc(3) 0 0]);
        array(i+6).translate(ser3Pos+ser3Offset);
        
        % translate everything after and including bicep1 back to origin, rotate, and then translate back
        array(i+4).translate(-bic1Pos-bicOffset);
        array(i+4).rotate([-jc(2) 0 0]);
        array(i+4).translate(bic1Pos + bicOffset);
        
        % translate everything after base1 back to origin, rotate, and then translate back
        array(i).translate(-base1Pos);
        array(i).rotate([0 0 jc(1)]);
        array(i).translate(base1Pos);    
    end

    % build the robot with patches
    for i = 1:22
        % build current component
        array(i).build(clr(i,:));
    end
    
    daspect([max(daspect)*[1 1 1]]);
end