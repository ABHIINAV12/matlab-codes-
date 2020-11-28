input = imread('1.jpg');
img = 255 - input;


rotate = 135;

switch mod(rotate, 360)
    
    %  cases for multiple of 90
    case 0
        requiredImg = img;
    case 90
        requiredImg = rot90(img);
    case 180
        requiredImg = img(end:-1:1, end:-1:1);
    case 270
        requiredImg = rot90(img(end:-1:1, end:-1:1));

    otherwise

        x = rotate*pi/180;
        R = [+cos(x) +sin(x); -sin(x) +cos(x)];

        % Finding size of modified image
        [m,n,p] = size(img);
        destination = round( [1 1; 1 n; m 1; m n]*R );
        destination = bsxfun(@minus, destination, min(destination)) + 1;
        requiredImg = zeros([max(destination) p],class(img));

        % Mapping pixels of modified with original image
        for i = 1:size(requiredImg,1)
            for j = 1:size(requiredImg,2)
                source = ([i j]-destination(1,:))*R.';
                if all(source >= 1) && all(source <= [m n])

                    % Get all 4 surrounding pixels
                    C = ceil(source);
                    F = floor(source);

                    % Compute the relative areas
                    A = [...
                        ((C(2)-source(2))*(C(1)-source(1))),...
                        ((source(2)-F(2))*(source(1)-F(1)));
                        ((C(2)-source(2))*(source(1)-F(1))),...
                        ((source(2)-F(2))*(C(1)-source(1)))];

                    % Extracting colors and re-scaling
                    cols = bsxfun(@times, A, double(img(F(1):C(1),F(2):C(2),:)));

                    requiredImg(i,j,:) = sum(sum(cols),2);

                end
            end
        end        
end

figure(1), clf, hold on
subplot(1,2,1)
imshow(img);



subplot(1,2,2)
imshow(requiredImg);