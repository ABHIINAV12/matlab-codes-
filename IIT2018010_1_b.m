img = imread('2.jpg'); 
img = imresize(img,[256 265]);
img = uint8(img);
result = zeros(256,256);
for x = 1:256
    result(x,1)=img(x,1);    
    result(1,x)=img(1,x);
    result(x,256)=img(x,256);
    result(256,x)=img(256,x);
end

for x = 2:255
    for y = 2:255
        res = 0;
        add = img(x-1,y) > img(x,y);
        res = res + add;
        add = img(x-1,y+1) > img(x,y);
        res = res + add*2;
        add = img(x,y+1)>img(x,y);
        res = res + add*4;
        add = img(x+1,y+1)>img(x,y);
        res = res + add*8;
        add = img(x+1,y)>img(x,y);
        res = res + add*16;
        add = img(x+1,y-1)>img(x,y);
        res = res + add*32;
        add = img(x,y-1)>img(x,y);
        res = res + add*64;
        add = img(x-1,y-1)>img(x,y);
        res = res + add*128;
        result(x,y) = res;
    end
end
result = uint8(result);
imshow(result);
