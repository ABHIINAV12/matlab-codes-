im = imread('img1.jpg');
im = .299*im(:,:,1) + .587*im(:,:,2) + .114*im(:,:,3);
im = imbinarize(im);
[row, col] = size(im);
subplot(2,1,1);
imshow(im);
title(" Original Image")
st = [1,1,1;1,1,1;1,1,1];
erosion = im;
dilation = im;
for u = 1:row
    for v = 1:col
        erosion(u,v) = 1;
        dilation(u,v) = 0;
        for t1 = 1:3
            for t2 = 1:3
                id1 = u+t1-2;
                id2 = v+t2-2;
                if id1>0 && id1<row && id2>0 &&id2<col
                    if (st(t1,t2) == im(id1,id2))
                        dilation(u,v) = 1;
                    else
                        erosion(u,v) = 0;
                    end
                end
            end
        end
    end
end
im = im - erosion;
subplot(2,1,2);
imshow(im);
title(" Extracted Image")
