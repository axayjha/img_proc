%% gamma correction

a=imread('original.pgm');
gamma=1.2;
c=1;
[row, col] = size(a);
for i=1:row
    for j=1:col
        b(i,j) = c*(double(a(i,j)).^(gamma));
    end
end
imwrite(b, 'power.png');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(uint8(b));
