a=imread('low_cameraman.pgm');
%b=255-a;
[row col] = size(a);
lmin = min(min(a));
lmax = max(max(a));
%lmin=0;
%lmax=255;
mmax = 255;
mmin = 0;


for i=1:row
    for j=1:col
        b(i,j) = mmax*(log(double(a(i,j)-lmin+1))/log(double(lmax-lmin+1))) + mmin;
    end
end
imwrite(uint8(b), 'nonlinearstretch.png');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(b);

%figure(1), imshow(a);
%figure(2), imshow(b);
%disp(a)