a=imread('original.pgm');

[row, col] = size(a);
for i=1:row
    for j=1:col
        b(i,j) = a(i,j)+ 80;                       
    end
end
imwrite(b, 'region.png');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(uint8(b));