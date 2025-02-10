function [ imOut ] = myFiltFreq( imIn , someFilt )
    [N M] = size(imIn);
    [Nf Mf] = size(imIn);
    if N ~= Nf
        disp('the dimensions of the image and the filter given must agree');
        disp('try again with the correct dimensions');
    else
        %multiply with the chess and bring the center in the middle
        %h_ch = chess(N);
        h_ch = ones(N);
        for i = 1:2:N
            for j = 2:2:N
                h_ch(i,j) = -1;
                h_ch(i+1,j-1) = -1;
            end
        end
        im_ch = imIn.*h_ch;

        %make the fourier transform
        im_ch_f = fft2(im_ch);
        
        %compute the fourier output and compute the inverse transform
        imOut_f = someFilt.*im_ch_f;
        im0ut_ch = ifft2(imOut_f);

        %multiply with the chess again and bring the center in the beginning
        imOut = im0ut_ch.*h_ch;
    end
    
end

