function filtOut = myLowPassButterworthDir(cutOff , n, M, theta , phi)
    if mod(M,2)~= 0
        M = M+1;
    end
    %radtheta = theta*pi/180;
    %radphi = phi*pi/180;
    if phi>89
        disp('the angle phi extends the limits, try again with an angle less than 90deg');
        return
    end
    if theta<-360
        theta = mod(abs(theta),360);
    end
    if theta<0
        theta = theta+360;
    end
    if theta>=360
        theta = mod(theta,360);
    end
    
    angle1 = theta-phi/2;
    angle2 = theta+phi/2;
    
    if angle2>=360
        angle2 = mod(angle2,360);
    end
    if angle1<0
        angle1 = angle1+360;
    end
    
    % flag1 tetarthmorio arxhs kai flag2 tetarthmorio telous gwnias
    flag1 = ceil(angle1/89);
    flag2 = ceil(angle2/89);
    
    %xpix = round(pixels*power(cos(radtheta-radphi/2),2));
    %ypix = round(pixels*power(sin(radtheta-radphi/2),2));
    %pixels = round(sqrt(xpix^2 + ypix^2));
    
    %mask1 for the angle1
    if (angle1 == 0)||(angle1 == 180)||(angle1 == 90)||(angle1 == 270)
        mask1 = ones(M/2);
    elseif  angle1 == 45
        mask1 = ones(M/2);
        mask1 = tril(mask1,-1);
        mask1 = flipud(mask1);
    elseif (angle1 == 225)
        mask1 = ones(M/2);
        mask1 = triu(mask1,1);
        mask1 = flipud(mask1);
    elseif  (angle1 == 135)
        mask1 = ones(M/2);
        mask1 = tril(mask1,-1);
    elseif (angle1 == 315)
        mask1 = ones(M/2);
        mask1 = triu(mask1,1);
    else
        mask1 = zeros(M/2);
        newangle1 = mod(angle1,90);
        %disp(newangle1);disp(radangle1);disp(' ');
        %make the angles in the mask
        if newangle1<45
            radangle1 = newangle1*pi/180;
            step = round(1/tan(radangle1));
            j=1;
            for i=1:M/2
                %j = round(i/tan(radangle1));
                if j>M/2
                    break
                end
                mask1(i,j)=1;
                for k = 1:step
                    if j+k>M/2
                        break
                    end
                    mask1(i,j+k)=1;
                end
                j = j+step;
            end
        else
            newangle1 = 90-newangle1;
            radangle1 = newangle1*pi/180;
            step = round(1/tan(radangle1));
            i=1;
            for j=1:M/2
                %i = round(j/tan(radangle1));
                if i>M/2
                    break
                end
                mask1(i,j)=1;
                for k = 1:step
                    if i+k>M/2
                        break
                    end
                    mask1(i+k,j)=1;
                end
                i = i+step;
            end
        end
        %fill out with 1
        for j=1:M/2
            for i=1:M/2
                if mask1(i,j)==1
                    mask1(i:end,j)=1;
                    break
                end
            end
        end
        %bring to the right shape accordingly
        %if (angle1>0 && angle1<90)
        mask1 = flipud(mask1);
        if (angle1>90 && angle1<180)
            mask1 = rot90(mask1,1);
        elseif (angle1>180 && angle1<270)
            mask1 = rot90(mask1,2);
        elseif (angle1>270 && angle1<360)
            mask1 = rot90(mask1,3);
        end
    end
    
    %mask2 for the angle2 
    if (angle2 == 0)
        mask2 = zeros(M/2);
        mask2(end,:) = ones(1,M/2+1);
    elseif (angle2 == 180)
        mask2 = zeros(M/2);
        mask2(1,:) = ones(1,M/2+1);
    elseif  (angle2 == 90)
        mask2 = zeros(M/2);
        mask2(:,end) = ones(M/2+1,1);
    elseif (angle2 == 270)
        mask2 = zeros(M/2);
        mask2(:,1) = ones(M/2+1,1);
    elseif  angle2 == 45
        mask2 = ones(M/2);
        mask2 = triu(mask2);
        mask2 = flipud(mask2);
    elseif (angle2 == 225)
        mask2 = ones(M/2);
        mask2 = tril(mask2);
        mask2 = flipud(mask2);
    elseif  (angle2 == 135)
        mask2 = ones(M/2);
        mask2 = triu(mask2);
    elseif (angle2 == 315)
        mask2 = ones(M/2);
        mask2 = tril(mask2);
    else
        mask2 = zeros(M/2);
        newangle2 = mod(angle2,90);
        %disp(newangle2);disp(radangle2);disp(' ');
        %make the angles in the mask
        if newangle2<45
            radangle2 = newangle2*pi/180;
            step = round(1/tan(radangle2));
            j=1;
            for i=1:M/2
                %j = round(i/tan(radangle2));
                if j>M/2
                    break
                end
                mask2(i,j)=1;
                for k = 1:step
                    if j+k>M/2
                        break
                    end
                    mask2(i,j+k)=1;
                end
                j = j+step;
            end
        else
            newangle2 = 90-newangle2;
            radangle2 = newangle2*pi/180;
            step = round(1/tan(radangle2));
            i=1;
            for j=1:M/2
                %i = round(j/tan(radangle2));
                if i>M/2
                    break
                end
                mask2(i,j)=1;
                for k = 1:step
                    if i+k>M/2
                        break
                    end
                    mask2(i+k,j)=1;
                end
                i = i+step;
            end
        end
        %fill out with 1
        for j=1:M/2
            for i=1:M/2
                if mask2(i,j)==1
                    mask2(i:end,j)=1;
                    break
                end
            end
        end
        %but the fill out must be the opposite than before
        mask2 = ones(M/2)-mask2;
        %bring to the right shape accordingly
        %if (angle2>0 && angle2<90)
        mask2 = flipud(mask2);
        if (angle2>90 && angle2<180)
            mask2 = rot90(mask2,1);
        elseif (angle2>180 && angle2<270)
            mask2 = rot90(mask2,2);
        elseif (angle2>270 && angle2<360)
            mask2 = rot90(mask2,3);
        end
    end
    
    %sunenwsh twn mask1 kai mask2 sto filtro
    filtOut = zeros(M);
    %an anhkoun sto idio tetarthmorio
    if flag2-flag1 == 0
        mask = mask1.*mask2;
        if flag1 == 1
            filtOut(1:M/2,M/2+1:M)= mask;
            filtOut(M/2+1:M,1:M/2)= rot90(mask,2);
            %filtOut(M/2+1,M/2)= 0;
        end
        if flag1 == 2
            filtOut(1:M/2,1:M/2)= mask;
            filtOut(M/2+1:M,M/2+1:M)= rot90(mask,2);
            %filtOut(M/2+1,M/2+1)= 0;
        end
        if flag1 == 3
            filtOut(M/2+1:M,1:M/2)= mask;
            filtOut(1:M/2,M/2+1:M)= rot90(mask,2);
            %filtOut(M/2,M/2+1)= 0;
        end
        if flag1 == 4
            filtOut(M/2+1:M,M/2+1:M)= mask;
            filtOut(1:M/2,1:M/2)= rot90(mask,2);
            %filtOut(M/2,M/2)= 0;
        end
    %an anhkoun se diaforetika (synexomena) tetarthmoria
    else
        if flag1 == 1
            mask = zeros(M/2,M);
            mask(:,1:M/2)= mask2;
            mask(:,M/2+1:M)= mask1;
            filtOut(1:M/2,:)= mask;
            filtOut(M/2+1:M,:)= rot90(mask,2);
            %filtOut(M/2+1,M/2)= 0;
        end
        if flag1 == 2
            mask = zeros(M,M/2);
            mask(1:M/2,:)= mask1;
            mask(M/2+1:M,:)= mask2;
            filtOut(:,1:M/2)= mask;
            filtOut(:,M/2+1:M)= rot90(mask,2);
            %filtOut(M/2+1,M/2+1)= 0;
        end
        if flag1 == 3
            mask = zeros(M/2,M);
            mask(:,1:M/2)= mask1;
            mask(:,M/2+1:M)= mask2;
            filtOut(M/2+1:M,:)= mask;
            filtOut(1:M/2,:)= rot90(mask,2);
            %filtOut(M/2,M/2+1)= 0;
        end
        if flag1 == 4
            mask = zeros(M,M/2);
            mask(1:M/2,:)= mask2;
            mask(M/2+1:M,:)= mask1;
            filtOut(:,M/2+1:M)= mask;
            filtOut(:,1:M/2)= rot90(mask,2);
            %filtOut(M/2,M/2)= 0;
        end
    end
    %perasma apo idaniko
    filtOut = filtOut.*myLowPassButterworth(cutOff ,n, M);
end

