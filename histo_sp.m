a=imread('original.pgm');

[row1, col1] = size(a);

count1=zeros(256, 1);

for i=1:row1
    for j=1:col1
        pix1=(a(i,j)+1);
        count1(pix1) = count1(pix1) + 1;
    end
end

cumm1 = 0;
for i=1:256
    cumm1 = cumm1 + count1(i);
    count1(i) = round(cumm1*255/(row1*col1));
end

aout=a;

for i=1:row1
    for j=1:col1
        pix1=(a(i,j)+1);
        aout(i,j) = count1(pix1);
    end
end

b=imread('low_cameraman.pgm');

[row2, col2] = size(b);

count2=zeros(256, 1);

for i=1:row2
    for j=1:col2
        pix2=(b(i,j)+1);
        count2(pix2) = count2(pix2) + 1;
    end
end

cumm2 = 0;
for i=1:256
    cumm2 = cumm2 + count2(i);
    count2(i) = round(cumm2*255/(row2*col2));
end

bout=b;


for i=1:row2
    for j=1:col2
        pix2=(b(i,j)+1);
        bout(i,j) = count2(pix2);
    end
end

spec=aout;

count3=count1;

for i=1:256
    smallest=count2(1);
    jmin=1;
    for j=1:256
        if abs(count1(i)-count2(j)) < abs(smallest - count2(j))
            smallest=count2(j);
            jmin=j;
        end
        
    end
    count3(i)=jmin-1;
end


for i=1:row1
    for j=1:col1
        pix3=(a(i,j)+1);
        spec(i,j) = count3(pix3);
    end
end
        
disp(count3);



imwrite(spec, 'hist_spec.pgm');
subplot(1,3,1), imshow(a);
subplot(1,3,2), imshow(b);
subplot(1,3,3), imshow(uint8(spec));
