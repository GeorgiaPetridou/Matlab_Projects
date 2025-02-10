function [ filtOut ] = myLowPassButterworth( cutoff , n , M)
    filtOut = zeros(M);
    for i = 1:M/2
        for j = 1:M/2
            D = sqrt(power(i-M/2,2)+power(j-M/2,2));
            filtOut(i,j)=power(1+power(D/cutoff,2*n),-1);
            filtOut(M-i,M-j)=filtOut(i,j);
            filtOut(M-i,j)=filtOut(i,j);
            filtOut(i,M-j)=filtOut(i,j);
        end
    end
end

