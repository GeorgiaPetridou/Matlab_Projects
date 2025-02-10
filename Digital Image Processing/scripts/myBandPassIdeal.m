function [ filtOut ] = myBandPassIdeal( cutoffLow , cutoffHigh , M )
    narrow = myLowPassIdeal (cutoffLow , M);
    wide = myLowPassIdeal (cutoffHigh , M);
    filtOut = wide - narrow;
end

