function [ filtOut ] = myHighPassButterworth( cutoff , n , M )
    low = myLowPassButterworth(cutoff , n , M);
    filtOut = ones(M) - low;
end
