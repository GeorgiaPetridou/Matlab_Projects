function [ filtOut ] = myLowPassIdeal( cutoff , M )
    filtOut = zeros(M);
    for i = 1:M/2
        for j = 1:M/2
            D = sqrt(power(i-M/2,2)+power(j-M/2,2));
            if D <= cutoff
                filtOut(i,j)=1;
                filtOut(M-i,M-j)=1;
                filtOut(M-i,j)=1;
                filtOut(i,M-j)=1;
            end
        end
    end
end

