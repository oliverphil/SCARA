A = imread('unicodesnowman.png');
A = imresize(A, 0.6);

A =  rgb2gray(A);

imageEdges = edge(A,'Canny')

figure
imshow(imageEdges)

[vm1] = [];
[vm2] = [];
[pen] = [];
count = 0;
pendown = [1500];

for i=2:length(imageEdges)-1
   b = imageEdges(i);
    for j=1:length(b)       
       [angle1 angle2] = inverseKinematics ((b(j)), b(j)+700);
       [v1 v2] = angToV(angle1, angle2);
       [vm1(:,i)] = v1;
       [vm2(:,i)] = v2;
       [pen(:,i)] = pendown;
       count = count+1;
    end
   pen (1, count-length(b)+1) = 1400;
   pen (1, count-length(b)+2) = 1400;
   pen (1, count) = 1400;
end

pen (:, 1) = 1300;
pen (:, size(vm1)) = 1300;
dlmwrite('drawsnowman.txt', [round(vm1'), round(vm2'), pen']);

