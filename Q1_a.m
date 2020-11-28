ori = imread('1.jpg');

% Taking negative of the Image
changed = 255 - ori;
figure, 
subplot(1,2,1), imshow(ori)
subplot(1,2,2), imshow(changed)