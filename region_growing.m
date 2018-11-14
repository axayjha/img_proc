a=imread('original.pgm');
row=size(a, 1);
col=size(a, 2);

s1=120;
s2=170;
s3=210;
s4=40;

for i=1:row
    for j=1:col
        if( (a(i, j) > s1-30) && (a(i, j) < s1 +30 ) )
            a(i ,j) = s1;
        elseif ( (a(i, j) > s2-30) && (a(i, j) < s2 +30 ) )
            a(i ,j) = s2;
        elseif ( (a(i, j) > s3-30) && (a(i, j) < s3 +30 ) )
            a(i ,j) = s3;
        elseif ( (a(i, j) > s4-30) &&(a(i, j) < s4 +30 ) )
            a(i ,j) = s4;    
        end
    end
end

imshow(a);
                