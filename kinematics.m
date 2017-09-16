function [xt1, xt2, yt1, yt2] = kinematics(angle1, angle2)
%kinematics Find the pen position given motor angles (SCARA)

m1x = 227;
m1y = 466;
m2x = 373;
m2y = 466;
armLength = 150;

xj1 = m1x + armLength*cos(angle1);
yj1 = m1y + armLength*sin(angle1);
xj2 = m2x + armLength*cos(angle2);
yj2 = m2y + armLength*sin(angle2);

xA = xj1 + 0.5*(xj2-xj1);
yA = yj1 + 0.5*(yj2-yj1);

distance = sqrt((xj1-xj2)^2 + (yj1-yj2)^2);
h = sqrt(armLength^2 - (distance/2)^2);

alpha = atan((yj1-yj2)/(xj2-xj1));

xt1 = xA + h*cos(pi/2-alpha);
yt1 = yA + h*sin(pi/2-alpha);
xt2 = xA - h*cos(pi/2-alpha);
yt2 = yA - h*sin(pi/2-alpha);

plot([m1x, xj1], [m1y, yj1], [m2x, xj2], [m2y, yj2], [xj2, xj1], [yj2, yj1], [-50, 450], [yA, yA], [xt1, xt2], [yt1, yt2])
rectangle('Position', [xj1-armLength, yj1-armLength, armLength*2, armLength*2], 'Curvature', [1, 1])
rectangle('Position', [xj2-armLength, yj2-armLength, armLength*2, armLength*2], 'Curvature', [1, 1])
axis equal
end

