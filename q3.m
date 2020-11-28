A = imread('UTK.tif');
B = imread('T.tif');

suff = zeros(size(B,1),1,1, 'uint8');
B = [B suff];
suff = zeros(1,size(B,2),1, 'uint8');
B = [B; suff];

res = hitormiss(A,B);
imshow(res);

function res = hitormiss(A, B)
    [m, n] = size(B);
    res = zeros(size(A), 'logical');
    a = floor(m/2);
    b = floor(n/2);
    for i =ceil(m/2):size(A, 1)-a
        for j =ceil(n/2):size(A, 2)-b 
            temp=A(i-a:i+a, j-b:j+b);  
            if temp==B
                res(i, j)=1;
            end       
        end
    end
end