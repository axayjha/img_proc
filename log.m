a=imread('original.pgm');

c=40;
[row, col] = size(a);
for i=1:row
    for j=1:col
        b(i,j) = c*log(double(a(i,j)) + 1);
    end
end
imwrite(b, 'power.png');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(uint8(b));