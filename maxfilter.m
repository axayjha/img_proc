a=imread('lena_noisy1.pgm');

[row, col] = size(a);
kernel=[1 2 3; 6 2 3; 9 2 4];
k_sum=sum(sum(kernel));
for i=2:row+1
    for j=2:col+1
        b(i,j) = a(i-1,j-1);                       
    end
end 

for i=2:row+1
    b(i, 1) = a(i-1, 1);
    b(i, col+2) = a(i-1, col);
end

for j=1:col+2
    b(1, j) = b(2, j);
    b(row+2, j) = b(row+1, j);
end
row=row+2;
col=col+2;
b=c;
for i=2:row-1
    for j=2:col-1
        summ=0;
       
        for x=-1:1
            for y=-1:1
                window(x+2, y+2)=double(b(i+x, j+y));
            end
        end
        flatwindow=reshape(window, [1, 9]);
        flatwindow=sort(flatwindow);
        
        c(i, j)=uint8(max(flatwindow));
    end
end               
        

disp(size(c));    
imwrite(c, 'medianbfilter.pgm');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(uint8(c));