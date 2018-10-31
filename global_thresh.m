a=imread('original.pgm');
row=size(a, 1);
col=size(a, 2);
t=200;
m1=0;
countm1=0;
m2=0;
countm2=0;
tnew=100;
while abs(t-tnew) > 1
    t=tnew;
    m1=double(0);
    countm1=double(0);
    m2=double(0);
    countm2=double(0);
    for i=1:row
        for j=1:col
            if a(i, j) < t
                m1=double(double(m1)+double(a(i, j)));
                countm1=double(countm1)+1;
            else
                m2=double(double(m2)+double(a(i, j)));
                countm2=double(countm2)+1;
            end
        end
    end
    m1=round(double(m1)/double(countm1));
    m2=round(double(m2)/double(countm2));
    (m1+m2);
    tnew=round((m1+m2)/2);
end

disp(tnew);

b=a;
for i=1:row
    for j=1:col
        if a(i, j) < tnew
            b(i, j)=0;
        else
            b(i, j)=255;
        end
    end
end

imshow(b);
