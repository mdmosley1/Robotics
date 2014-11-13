% instrhwinfo('serial')
%% demo of L5goto.m
global A B;
c = load('calibration.mat');

n = fieldnames(c);
for k=1:length(n)
    eval(sprintf('global %s; %s=c.%s;',n{k},n{k},n{k}));
end

grip = 2;
L5goto(joints, grip);


%% demo of L5trajectory.m
clear
c = load('calibration.mat');

n = fieldnames(c);
for k=1:length(n)
    eval(sprintf('global %s; %s=c.%s;',n{k},n{k},n{k}));
end
for a = 1:90
    joints(:,a) = [0 a 0 0]';
    grip(a) = 5/90*a;
end

joints = joints*pi/180;
%joints = [joints fliplr(joints)];
L5trajectory(joints, grip);

%% demo of L5trajectory.m
clear
c = load('calibration.mat');

n = fieldnames(c);
for k=1:length(n)
    eval(sprintf('global %s; %s=c.%s;',n{k},n{k},n{k}));
end
grip = 2;
for a = 1:100
    joints(:,a) = [a/2 a/2 a/2 a/2]';
end

for a = 1:100
    joints2(:,a) = [50-a/2 50 50 50]';
end

for a = 1:100
    joints3(:,a) = joints2(:,100) + [0 -a/2 -a/2 -a/2]';
end

joints = [joints joints2 joints3];

L5trajectory(joints, grip);

%% 
clear

c = load('calibration.mat');

n = fieldnames(c);
for k=1:length(n)
    eval(sprintf('global %s; %s=c.%s;',n{k},n{k},n{k}));
end
grip = 2;
for a = 1:100
    joints(:,a) = [0 a -a -a]';
end

joints = [joints fliplr(joints)];

L5trajectory(joints, grip);

