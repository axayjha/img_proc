a=imread('original.pgm');

[row, col] = size(a);
for i=1:row
    for j=1:col
        if a(i,j)<50
            b(i,j)=50;
        elseif a(i,j)<100
            b(i,j)=100;
        elseif a(i,j)<150
            b(i,j)=150;
        else 
            b(i,j)=200 ; 
        end    
                    
    end
end
imwrite(b, 'region.png');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(b);