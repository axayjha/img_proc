a=imread('lena_noisy1.pgm');
Q=1;
[row, col] = size(a);
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

for i=2:row-1
    for j=2:col-1
        summ1=0;
        summ2=0;
        for x=-1:1
            for y=-1:1
                summ1 = summ1 + double(b(i+x, j+y))^(1+Q);
                summ2 = summ2 + double(b(i+x, j+y))^(Q);
            end
        end
        summ = summ1/summ2;
        b(i, j)=uint8(summ);
    end
end               

for i=1:row-2
    for j=1:col-2
        out(i, j) = b(i+1,j+1);                       
    end
end 

%disp(size(out));    
imwrite(out, 'avgfilter.pgm');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(uint8(out));