function [anglej12 anglej21 ] = inverseKinematics(x1, y1)
%inverseKinematics find motor angles given pen position (SCARA)

m1x = 235;
m1y = 470;
m2x = 390;
m2y = 471;
armLength = 270;

if y1<670
    return;
end

distance1 = sqrt((m2x-x1)^2 + (m2y-y1)^2)/2;
distance2 = sqrt((m1x-x1)^2 + (m1y-y1)^2)/2;
xA = x1 + 0.5*(m2x-x1);
yA = y1 + 0.5*(m2y-y1);
xB = x1 + 0.5*(m1x-x1);
yB = y1 + 0.5*(m1y-y1);

hA = sqrt(armLength^2 - distance1^2);
hB = sqrt(armLength^2 - distance2^2);

thetaA = pi/2 - atan2(y1-m2y,m2x-x1);
thetaB = pi/2 - atan2(y1-m1y,m1x-x1);

xj21 = xA + hA*cos(thetaA);
yj21 = yA + hA*sin(thetaA);
xj22 = xA - hA*cos(thetaA);
yj22 = yA - hA*sin(thetaA);

xj11 = xB + hB*cos(thetaB);
yj11 = yB + hB*sin(thetaB);
xj12 = xB - hB*cos(thetaB);
yj12 = yB - hB*sin(thetaB);

%figure()
%hold on
%axis equal
%plot([m1x xj11 x1],[m1y yj11 y1],'r')
%plot([m1x xj12 x1],[m1y yj12 y1],'b')
%plot([m2x xj21 x1],[m2y yj21 y1],'g')
%plot([m2x xj22 x1],[m2y yj22 y1],'y')

%might want to only use outside angles so we don't need to check where the
%arms are so they don't crash into each other
anglej12 = atan2(yj12-m1y, xj12-m1x)*180/pi;
anglej11 = atan2(yj11-m1y, xj11-m1x)*180/pi;
anglej22 = atan2(yj22-m2y, xj22-m2x)*180/pi;
anglej21 = atan2(yj21-m2y, xj21-m2x)*180/pi;



%plot([m2x, x1], [m2y, y1], [m2x, xj21], [m2y, yj21], [m2x, xj22], [m2y, yj22], [xj21, x1], [yj21, y1], [xj22, x1], [yj22, y1], [m1x, x1], [m1y, y1], [m1x, xj11], [m1y, yj11], [m1x, xj12], [m2y, yj12], [xj11, x1], [yj11, y1], [xj12, x1], [yj12, y1])
%rectangle('Position', [xA-hA, yA-hA, hA*2, hA*2], 'Curvature', [1, 1])
%rectangle('Position', [xB-hB, yB-hB, hB*2, hB*2], 'Curvature', [1, 1])
%axis equal
end