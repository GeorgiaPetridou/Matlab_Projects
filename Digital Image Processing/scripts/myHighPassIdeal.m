function [ filtOut ] = myHighPassIdeal( cutoff , M )
    low = myLowPassIdeal(cutoff,M);
    filtOut = ones(M) - low;
end

