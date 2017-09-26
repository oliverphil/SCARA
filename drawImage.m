filename = uigetfile;
image = imread(filename);
image = imresize(image, 0.4);

theme(filename);

s = 0.3;
a = 0.1;

[rows, cols, numberOfColorChannels] = size(image);

if numberOfColorChannels > 1
    greyscale =  rgb2gray(image);

    edges = edge(greyscale,'Canny');
else 
    edges = edge(image, 'Canny');
end

boundaries = bwboundaries(edges, 'noholes');

figure
imshow(edges)

[vm1] = [];
[vm2] = [];
[pen] = [];
count = 0;
pendown = [1500];

for i=1:length(boundaries)
   b = boundaries{i};
    for j=1:length(b)       
       [angle1 angle2] = inverseKinematics ((b(j,1))+250, b(j,2)+700);
       [v1 v2] = angToV(angle1, angle2);
       [vm1] = horzcat (vm1, v1);
       [vm2] = horzcat (vm2, v2);
       [pen] = horzcat (pen, pendown);
       count = count+1;
    end
   pen (1, count-length(b)+1) = 1200;
   pen (1, count-length(b)+2) = 1200;
   pen (1, count) = 1200;
end

pen (1, 1) = 1200;
pen (1, size(vm1)) = 1200;
dlmwrite('drawImage.txt', [round(vm1'), round(vm2'), pen']);

