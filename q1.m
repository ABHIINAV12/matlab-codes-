imgGiven = imread('morphology.tif'); 
imgGiven = double(imgGiven); 
imgO=ones(3, 3);
[I, J]=size(imgO);
imgDil=zeros(size(imgGiven, 1), size(imgGiven, 2));

for temp1=ceil(I/2):size(imgGiven, 1)-floor(I/2) 
    for temp2=ceil(J/2):size(imgGiven, 2)-floor(J/2) 
          v1=imgGiven(temp1-floor(I/2):temp1+floor(I/2), temp2-floor(J/2):temp2+floor(J/2));
          v2=v1(logical(imgO));
          imgDil(temp1, temp2)=max(v2(:));
    end
end

imgO=ones(3,3);
[I, J]=size(imgO);
imgEro=zeros(size(imgDil, 1), size(imgDil, 2));

for temp1=ceil(I/2):size(imgDil, 1)-floor(I/2) 
    for temp2=ceil(J/2):size(imgDil, 2)-floor(J/2)
        v1=imgDil(temp1-floor(I/2):temp1+floor(I/2), temp2-floor(J/2):temp2+floor(J/2));
        v2=v1(logical(imgO));
        imgEro(temp1, temp2)=min(v2(:));
    end
end

subplot(1,2,1)
imshow(imgEro); 
title('Close operation');

imgGiven = imread('morphology.tif'); 
imgGiven = double(imgGiven); 
imgO=ones(3, 3);
[I, J]=size(imgO);
imgEro=zeros(size(imgGiven, 1), size(imgGiven, 2));

for temp1=ceil(I/2):size(imgGiven, 1)-floor(I/2) 
    for temp2=ceil(J/2):size(imgGiven, 2)-floor(J/2)
        v1=imgGiven(temp1-floor(I/2):temp1+floor(I/2), temp2-floor(J/2):temp2+floor(J/2));
        v2=v1(logical(imgO));
        imgEro(temp1, temp2)=min(v2(:));
    end
end

imgO=ones(3,3);
[I, J]=size(imgO); 
imgDil=zeros(size(imgEro, 1), size(imgEro, 2));

for temp1=ceil(I/2):size(imgEro, 1)-floor(I/2) 
    for temp2=ceil(J/2):size(imgEro, 2)-floor(J/2) 
          v1=imgEro(temp1-floor(I/2):temp1+floor(I/2), temp2-floor(J/2):temp2+floor(J/2));
          v2=v1(logical(imgO));
          imgDil(temp1, temp2)=max(v2(:));
    end
end

subplot(1,2,2)
imshow(imgDil); 
title('Open operation');