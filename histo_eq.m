a=imread('low_cameraman.pgm');

[row, col] = size(a);

count=zeros(256, 1);

for i=1:row
    for j=1:col
        pix=(a(i,j)+1);
        count(pix) = count(pix) + 1;
    end
end

cumm = 0;
for i=1:256
    cumm = cumm + count(i);
    count(i) = round(cumm*255/(row*col));
end

b=a;

for i=1:row
    for j=1:col
        pix=(a(i,j)+1);
        b(i,j) = count(pix);
    end
end

imwrite(b, 'hist.pgm');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(uint8(b));
