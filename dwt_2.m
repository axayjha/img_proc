clear all;
close all;
i=imread('original.pgm');
sX=size(i);
[LL,LH,HL,HH]=dwt2(i,'db1');
figure(1)
subplot(2,2,1);imshow(LL);title('LL band of image');
subplot(2,2,2);imshow(LH);title('LH band of image');
subplot(2,2,3);imshow(HL);title('HL band of image');
subplot(2,2,4);imshow(HH);title('HH band of image');
X = idwt2(LL,LH,HL,HH,'db1',sX);
figure(2),imshow(uint8(X));