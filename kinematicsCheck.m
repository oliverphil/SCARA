function [ angleLeft angleRight ] = kinematicsCheck(anglej12, anglej11, anglej22, anglej21)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
angleLeft = anglej12;
if anglej12<anglej11
    angleLeft = anglej11;
end

if anglej12>pi
    angleLeft = anglej11;
elseif anglej11>pi
    angleLeft = anglej12;
end

if angleLeft>pi
    return;
end

angleRight = anglej22;
if anglej22>anglej21
    angleRight = anglej21;
end

if anglej22<0
    angleRight = anglej21;
elseif anglej21<0
    angleRight = anglej22;
    end

if angleRight<0
    return;
end

angleLeft = angleLeft*(180/pi);
angleRight = angleRight*(180/pi);

end

