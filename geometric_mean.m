a=imread('lena_noisy1.pgm');

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
        summ=1;
        for x=-1:1
            for y=-1:1
                if (b(i+x, j+y) ~= 0)
                    summ = summ * double(b(i+x, j+y));
                end
            end
        end
        summ = summ^(1/9);
        b(i, j)=uint8(summ);
    end
end               

for i=1:row-2
    for j=1:col-2
        out(i, j) = b(i+1,j+1);                       
    end
end 

%disp(size(out));    
imwrite(out, 'geo_mean_filter.pgm');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(uint8(out));