function [x, y] = line()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x0 = 100;
y0 = 100;
x1 = 200;
y1= 200;
N=50;
dx = (x1-x0)/N;
dy = (y1-y0)/N;
x = x0:dx:x1;
y = y0:dy:y1;
plot(x,y);

end

