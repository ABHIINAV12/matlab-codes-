
im = [
    26 32 234 67 32;
    23 245 75 13 87;
    34 78 90 67 21;
    43 77 136 98 15;
    53 165 189 12 79;
    ];


[row, col] = size(im);
MAX = max(max(im));

intensity = 0:1:MAX;
histogram = double( zeros(size(intensity)) );



for i = 1:row
        for j = 1:col
             histogram(int32(im(i,j)) + 1 ) = histogram(int32(im(i,j)) + 1)  + 1;  
        end
end

bar(intensity , histogram);
