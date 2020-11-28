
im = [
    26 32 234 67 32;
    23 245 75 13 87;
    34 78 90 67 21;
    43 77 136 98 15;
    53 165 189 12 79;
    ];


im_in_binary = dec2bin(im);
bitPlane = getBitPlane(im , 7);


function bitPlane = getBitPlane(image , planeNum)
    bitPlane = false(size(image));
    [ROWS, COLS] = size(image);
    
    for row = 1:ROWS
        for col = 1:COLS
            
            remainder = mod( int32(image(row,col)) , 2^planeNum );
            bitPlane(row, col) = (remainder >= 2^(planeNum - 1));   
        end
    end
    
end