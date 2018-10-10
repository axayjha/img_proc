a=imread('lena_noisy1.pgm');
[row, col] = size(a);
windowsize=3;
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
%c=b;
for i=2:row-1
    for j=2:col-1
        summ=0;
        flag=0;
        for x=-1*floor(windowsize/2):floor(windowsize/2)
            for y=-1*floor(windowsize/2):floor(windowsize/2)
                window(x+ceil(windowsize/2), y+ceil(windowsize/2))=double(b(i+x, j+y));
                if (window(x+ceil(windowsize/2), y+ceil(windowsize/2))~=0 | window(x+ceil(windowsize/2), y+ceil(windowsize/2))~=255)
                    flag=1;
                end                
            end
        end
        if(flag==0 & windowsize<=39)
            windowsize=windowsize+1;
            i=i-1;
            j=j-1;
        else
            windowsize=3;
        end
        
        flatwindow=reshape(window, [1, 9]);        
        b(i, j)=uint8(median(flatwindow));
    end
end               
        
for i=1:row-2
    for j=1:col-2
        out(i, j) = b(i+1,j+1);                       
    end
end 


%disp(size(out));    
imwrite(out, 'medianbfilter.pgm');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(uint8(out));