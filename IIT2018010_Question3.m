rgb = imread('C.jpeg');
I = rgb2gray(rgb);

gmag = imgradient(I);

se = strel('disk',20);
Io = imopen(I,se);

Ie = imerode(I,se);
Iobr = imreconstruct(Ie,I);

Ioc = imclose(Io,se);

Iobrd = imdilate(Iobr,se);
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);

fgm = imregionalmax(Iobrcbr);

I2 = labeloverlay(I,fgm);

se2 = strel(ones(5,5));
fgm2 = imclose(fgm,se2);
fgm3 = imerode(fgm2,se2);
fgm4 = bwareaopen(fgm3,20);
I3 = labeloverlay(I,fgm4);

bw = imbinarize(Iobrcbr);

D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;

gmag2 = imimposemin(gmag, bgm | fgm4);
L = watershed(gmag2);
labels = imdilate(L==0,ones(3,3)) + 2*bgm + 3*fgm4;
I4 = labeloverlay(I,labels);

Lrgb = label2rgb(L,'jet','w','shuffle');
figure
subplot(2,1,1)
imshow(Lrgb)
title('Colored Watershed Label Matrix')

subplot(2,1,2)
imshow(I)
hold on
himage = imshow(Lrgb);
himage.AlphaData = 0.3;
title('Colored Labels Superimposed Transparently on Original Image')