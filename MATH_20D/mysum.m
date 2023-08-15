function mysum(r,n)
    sum = 1;
    for m=0:1:n
        sum = sum+ (1/(r^m));
    end
    disp(sum);
end