function [ out ] = plot_log()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

time = dlmread('angles.txt', '', [0,0,59,0]);
vm1 = dlmread('angles.txt', '', [0,1,59,1]);
vm2 = dlmread('angles.txt', '', [0,2,59,2]);
vpen = dlmread('angles.txt', '', [0,3,59,3]);
angles1 = dlmread('angles.txt', '', [0,4,59,4]);
angles2 = dlmread('angles.txt', '', [0,5,59,5]);

plot(time, angles1, time, angles2)

end

