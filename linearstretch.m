a=imread('low_cameraman.pgm');
%b=255-a;
[row col] = size(a);
lmin = min(min(a));
lmax = max(max(a));
%lmin=0;
%lmax=255;
mmax = 255;
mmin = 0;

ratio = double(mmax-mmin)/(double(lmax-lmin));

for i=1:row
    for j=1:col
        b(i,j) = double(ratio*(a(i,j)-mmin)) + lmin;
    end
end
imwrite(uint8(b), 'stretch.png');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(b);

%figure(1), imshow(a);
%figure(2), imshow(b);
%disp(a)