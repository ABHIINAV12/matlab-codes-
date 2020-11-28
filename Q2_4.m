img = imread('Lena.png');
grey = .299*img(:,:,1) + .587*img(:,:,2) + .114*img(:,:,3); 
V = {1:86};
p = grey(37, 6);
q = grey(33, 10);

binaryImage = false(size(grey));

Vcontents = V{1};
for k = 1 : length(Vcontents)
    mask = Vcontents(k) == grey;
    binaryImage = binaryImage | mask;
end

labeledImage = bwlabel(binaryImage, 4);

if labeledImage(p) == labeledImage(q)
    
    
    imshow(labeledImage)
    
    subplot(1,3,1);
    imshow(img);
    title('original image');
    
    subplot(1,3,2);
    imshow(grey);
    title('Grey image'); 
    
    subplot(1,3,3);
    imshow(labeledImage);
    title('Labled image'); 
    
    title("4 - connected");
    
else
    disp(" NO connected");
end



