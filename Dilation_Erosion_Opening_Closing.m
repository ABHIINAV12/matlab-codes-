

%----- NOTE: Both image and structuring element have to be in binary format
structure = [
    1 0 1; 
    0 0 0; 
    1 0 1 ];


im = [
     1 0 1 1 1;
     0 0 1 0 1;
     1 1 0 1 1;
     0 0 1 0 0;
     1 1 1 0 1];
 

%opening
erodedImg = erosion(im, structure);
openedImg = dilate(erodedImg, structure);

%closing
dilatedImg = dilate(im, structure);
closedImg = erosion(dilatedImg, structure);



function dilatedImg = dilate(image, structure)
dilatedImg = boolean(zeros(size(image)));
[ROWS, COLS] = size(image);

[st_ROWS, st_COLS] = size(structure);

st_centre_row = int32(st_ROWS / 2);
st_centre_col = int32(st_COLS / 2);

st_start_row = -st_centre_row + int32(1);
st_start_col = -st_centre_col + int32(1);

st_end_row = st_ROWS - st_centre_row;
st_end_col = st_COLS - st_centre_col;

for i=1:ROWS
    for j=1:COLS
        sum = 0;
        for x = st_start_row : st_end_row
            for y = st_start_col : st_end_col
                if(x+i<1 || x+i>ROWS || y+j<1 || y+j>COLS)
                    continue;
                end
                sum = sum + double(structure(st_centre_row + x, st_centre_col + y))* double( image(i+x, j+y));
            end
        end
        
        dilatedImg(i,j) = (sum > 0);

    end
end

end


function erodedImg = erosion(image, structure)
erodedImg = boolean(zeros(size(image)));
[ROWS, COLS] = size(image);

[st_ROWS, st_COLS] = size(structure);

st_centre_row = int32(st_ROWS / 2);
st_centre_col = int32(st_COLS / 2);

st_start_row = -st_centre_row + int32(1);
st_start_col = -st_centre_col + int32(1);

st_end_row = st_ROWS - st_centre_row;
st_end_col = st_COLS - st_centre_col;

for i=1:ROWS
    for j=1:COLS
        tempsum = 0;
        for x = st_start_row : st_end_row
            for y = st_start_col : st_end_col
                if(x+i<1 || x+i>ROWS || y+j<1 || y+j>COLS)
                    continue;
                end
                tempsum = tempsum + double(structure(st_centre_row + x, st_centre_col + y))* double( image(i+x, j+y));
            end
        end
        
        erodedImg(i,j) = (tempsum == sum(structure, 'all') );

    end

end
end


function openedImg = opening(image , structure)
erodedImg = erosion(image, structure);
openedImg = dilate(erodedImg, structure);
end

function closedImg = closing(image, structure)
dilatedImg = dilate(image, structure);
closedImg = erosion(dilatedImg, structure);
end
