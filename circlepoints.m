function [] = circlepoints(cx, cy, rad)

d = (1:360)';
N = size(d)-1;
x = cx + cos(d*pi/180)*rad;
y = cy + sin(d*pi/180)*rad;
plot(x,y)

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
dlmwrite('circlepoints.txt', [out]);

end


