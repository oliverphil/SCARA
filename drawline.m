function [a, b, c, d] = drawline()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x0 = 300;
y0 = 700;
x1 = 400;
y1= 800;
N=50;
dx = (x1-x0)/N;
dy = (y1-y0)/N;
x = x0:dx:x1;
y = y0:dy:y1;
plot(x,y);
for i = 1:N
    [a(i,:), b(i,:), c(i,:), d(i,:)] = inverseKinematics(x(i),y(i));
end
[left, right] = kinematicsCheck(a, b, c, d)
[vLeft, vRight] = angToV(left, right)
dlmwrite('drawline.txt', [vLeft, vRight]);
end

