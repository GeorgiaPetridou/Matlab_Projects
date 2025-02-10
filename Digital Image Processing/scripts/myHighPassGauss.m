function [ filtOut ] = myHighPassGauss( sigma , M)
    low = myLowPassGauss( sigma , M);
    filtOut = ones(M) - low;
end

