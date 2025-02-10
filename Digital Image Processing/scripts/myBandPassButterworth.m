function [ filtOut ] = myBandPassButterworth( cutoffLow , cutoffHigh , n , M )
    narrow = myLowPassButterworth (cutoffLow , n , M);
    wide = myLowPassButterworth (cutoffHigh , n , M);
    filtOut = wide - narrow;
end

