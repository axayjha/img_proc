function a = sort1(a)
    n=size(a, 2);
    for i=1:n
        for j=1:n-i
            if (a(j)>a(j+1))
                temp=a(j);
                a(j)=a(j+1);
                a(j+1)=temp;
            end
        end                
    end
end    