a = imread('original.pgm');
b = imread('cameraman.pgm');
[row, col] = size(a);
for i=1:row
    for j=1:col
        c(i,j) = abs (b(i,j) - a(i,j));
    end
end
imwrite(c, 'diff.png');
subplot(1,3,1), imshow(a);
subplot(1,3,2), imshow(b);
subplot(1,3,3), imshow(c);