f=imread('original_airplane.pgm'); 
[M N]=size(f);
figure(1),imshow(f);
% compute fft and display its spectra
F=fft2(double(f));
figure(2),imshow(abs(fftshift(F)/256));
%compute Ideal Low Pass Filter
u0 = 100; % set cut off frequency
u=0:(M-1);
v=0:(N-1);
idx=find(u>M/2);
u(idx)=u(idx)-M;
idy=find(v>N/2);
v(idy)=v(idy)-N;
[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);
H=double(D<=u0);
% display
figure(3),imshow(fftshift(H));
% Apply filter and do inverse FFT
G=H.*F;
g=real(ifft2(double(G)));
% Show Result
figure(4),imshow(uint8(g));