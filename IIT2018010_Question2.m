im=imread('B.jpeg');
im = rgb2gray(im);
[n,m]=size(im);

im11=zeros([n-5, m-5]);
for i=1:n-5
    s2=0
    for j=1:m-5
        
        if j==1
           temp=im(i:i+5,j:j+5);
           s1=sum(temp(:))/25;
        else
           temp=im(i:i+5,j+5:j+6);
           s1=s2+sum(temp(:))/25
           temp=im(i:i+5,j-1:j);
           s1=s1-sum(temp(:))/25;
        end
        s2=s1
        for k=i:i+5
            for q=j:j+5
                if im(k,q)<s1
                    im11(k,q)=0;
                else    
                    im11(k,q)=255;
                end
            end
        end
    end
end

imshow(im11);