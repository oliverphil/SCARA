function [] = theme( filename )
%theme Summary of this function goes here
%   Detailed explanation goes here
if strcmp(filename, 'elf.jpg')
    web('https://www.youtube.com/watch?v=27mB8verLK8', '-browser');
elseif strcmp(filename, 'unicodesnowman.png')
    web('https://www.youtube.com/watch?v=k6zW225k_O0', '-browser');
elseif strcmp(filename, 'skynet.png')
    web('https://www.youtube.com/watch?v=mpMg1upld0w', '-browser');
end

end
