a=imread('original.pgm');
%b=255-a;
[row col] = size(a);
for i=1:row
    for j=1:col
        b(i,j) = 255 - a(i,j);
    end
end
imwrite(b, 'neg.png');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(b);

%figure(1), imshow(a);
%figure(2), imshow(b);
%disp(a)