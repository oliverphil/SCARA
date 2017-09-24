function [] = drawline()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x0 = 300;
y0 = 900;
x1 = 500;
y1 = 901;
N=50;
dx = (x1-x0)/N;
dy = (y1-y0)/N;
x = x0:dx:x1;
y = y0:dy:y1;
plot(x,y);
vPen = 1;
for i = 1:N
    [left(i,:), right(i,:)] = inverseKinematics(x(i), y(i));
end
%[left, right] = kinematicsCheck(a, b, c, d);
[vLeft, vRight] = angToV(left, right);
for i = 1:size(vLeft)
    vPen(i,1) = 1500;
end
for i=1:size(vLeft)
    vLeft(i,:) = int16(vLeft(i,:));
    vRight(i,:) = int16(vRight(i,:));
    vPen(i,:) = int16(vPen(i,:));
end

vPen(1) = 1200;
vPen(size(vPen)) = 1200;

out = [vLeft, vRight, vPen];
dlmwrite('drawline.txt', [out]);
end
