clear all;
clc;

%reading image
input = imread("2.jpg"); 
i = input(:,:,1);

 % find the min. value of pixels in all the columns (row vector)
temp = min(i);         

 % find the min. value of pixel in the image
rmin = min(temp);     
rmi = rmin.*.15;

 % find the max. value of pixels in all the columns (row vector)
temp = max(i);        

 % find the max. value of pixel in the image
rmax = max(temp);     
rmx = rmax.*.70;

 % find the slope of line joining point (0,255) to (rmin,rmax)
m = 255/(rmx - rmi); 

 % find the intercept of the straight line with the axis
c = 255 - m*rmx;      

 % transform the image according to new slope
i_new = m*i + c;       

subplot(1,2,2);
figure,imshow(i_new);   

