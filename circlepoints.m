function [] = circlepoints(cx, cy, rad)

d = [];
for i = 1:360
    d(i,:) = i;
end
x = cx + cos(d*pi/180)*rad;
y = cy + sin(d*pi/180)*rad;
plot(x,y)

vPen = d;
left = d;
right = d;
for i = 1:size(x)
    [left(i,:), right(i,:)] = inverseKinematics(x(i,:), y(i,:));
end

[vLeft, vRight] = angToV(left, right);

for i = 1:size(vLeft)
    vPen(i,1) = 1500;
end

out = [vLeft, vRight, vPen];
dlmwrite('circlepoints.txt', out);
end


