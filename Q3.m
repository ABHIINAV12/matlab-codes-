Input = imread("3.jpg");
R =Input(:,:,1);
G =Input(:,:,2);
B =Input(:,:,3);
a = max(max(R));

%  Doubling the intensity of the pixels lying in the R layer
for i=1:543 
    for j = 1 : 815
        if(R(i,j) <= .33 * a)
            R(i,j) = 2*R(i,j);
        end
        
    end
end

%  Doubling the intensity of the pixels lying in the G layer
b = max(max(G));
for i=1:543 
    for j= 1 : 815
       if(G(i,j) >= .34 * b)
            if(G(i,j) <= 0.66 * b)
                 G(i,j) = 2*G(i,j);
            end
           
       end
        
    end
end

%  Doubling the intensity of the pixels lying in the B layer
c = max(max(B));
for i=1:543 
    for j= 1 : 815
        if(B(i,j) >= .67 * c)
            if(B(i,j) <= c)
                 B(i,j) = 2*B(i,j);
            end
           
        end
        
    end
end

im = cat(3,R,G,B);
imshow(im);