ori = imread('I1.jpg');
img = imread('I1.jpg'); 
  
[x, y, z] =size(img); 
   
for plane = 1: z 
    for i = 1 : x 
        len = y;  
        for j = 1 : y 
 
            if j < y/2  
                temp = img(i, j, plane); 
                img(i, j, plane) = img(i, len, plane); 
                img(i, len, plane) = temp; 
                len = len - 1; 
            end
        end
    end
end
   

subplot(1,2,1);
imshow(ori);
title('original image');

subplot(1,2,2);
imshow(img);
title('Mirror image'); 