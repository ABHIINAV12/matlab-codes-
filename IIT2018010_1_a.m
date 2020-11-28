img=imread('2.jpg');
img = imresize(img,[256 256]);
img=rgb2gray(img);
result = uint8(256*mat2gray(img));
imshow(result);
