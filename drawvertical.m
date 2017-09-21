function [] = drawvertical()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x0 = 350;
y0 = 900;
x1 = 351;
y1 = 750;
N=250;
dx = (x1-x0)/N;
dy = (y1-y0)/N;
x = x0:dx:x1;
y = y0:dy:y1;
%plot(x,y);
for i = 1:N
    [left(i,:), right(i,:)] = inverseKinematics(x(i), y(i));
end
%[left, right] = kinematicsCheck(a, b, c, d);
[vLeft, vRight] = angToV(left, right);
vPen(1,1) = 1200;
for i = 2:size(vLeft)-1
    vPen(i,1) = 1500;
end
vPen(size(vLeft),1) = 1200;
for i=1:size(vLeft)
    vLeft(i,:) = int16(vLeft(i,:));
    vRight(i,:) = int16(vRight(i,:));
    vPen(i,:) = int16(vPen(i,:));
end

out = [vLeft, vRight, vPen];
dlmwrite('drawvertical.txt', [out]);
end
