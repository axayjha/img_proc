a=imread('original.pgm');
[row, col] = size(a);
%kernel=[1 2 3; 6 2 3; 9 2 4];
%kernel=[1 4 1;4 -20 4; 1 4 1];
kernel=[0 -1 0; -1  8 -1; 0 -1 0];
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



c=b;
for i=2:row-1
    for j=2:col-1
        summ=0;
        
        p1=b(i-1, j-1);
        p2=b(i, j-1);
        p3=b(i-1, j);
        p4=b(i, j);
        c(i,j)= abs(p1-p4) + abs(p2-p3);
       
    end
end    

for i=1:row-2
    for j=1:col-2
        out(i, j) = c(i+1,j+1);                       
    end
end 
J=out;
J = J+a;
%disp(size(out));    
imwrite(J, 'prewitt.pgm');
subplot(1,2,1), imshow(a);
subplot(1,2,2), imshow(uint8(J));