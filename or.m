a = imread('original.pgm');
b = imread('cameraman.pgm');
[row, col] = size(a);

c=bitor(a,b);

imwrite(c, 'or.png');
subplot(1,3,1), imshow(a);
subplot(1,3,2), imshow(b);
subplot(1,3,3), imshow(uint8(c));