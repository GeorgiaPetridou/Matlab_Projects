function [ filtOut ] = myBandPassGauss( sigmaLow , sigmaHigh , M )
    narrow = myHighPassGauss (sigmaLow , M);
    wide = myLowPassGauss (sigmaHigh , M);
    filtOut = wide - narrow;
end
