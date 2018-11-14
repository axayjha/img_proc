a=imread('original.pgm');
row=size(a, 1);
col=size(a, 2);

count = zeros(256, 1);

for i=1:row
    for j=1:col
        count(a(i, j)) = count(a(i, j)) + 1;
    end
end
thresh = 0;
P1=0;
P2=0;
cumm_mean1 = 0;
maximum=0.0;
mg = dot( (0:255), count); 
total=sum(count);
for ii=1:256
    P1 = P1 + count(ii);
    P2 = total - P1;
    if (P1 == 0 || P2 == 0)
        continue;
    end
    cumm_mean1 = cumm_mean1 +  (ii-1) *count(ii);
    cumm_mean2 = (mg - cumm_mean1);
    m1 = (1/P1)*cumm_mean1;
    m2 = (1/P2)*cumm_mean2;
    between = P1 * P2 * (m1 - m2) * (m1 - m2);
    if ( between >= maximum )
        thresh = ii;
        maximum = between;
    end
end
disp(thresh);

b=a;
for i=1:row
    for j=1:col
        if a(i, j) < thresh
            b(i, j)=0;
        else
            b(i, j)=255;
        end
    end
end

imshow(b);