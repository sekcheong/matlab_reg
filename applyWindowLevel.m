function outvol = applyWindowLevel(vol,ww,wl)
    s = size(vol);
    outvol = zeros(s,"uint8");
    
    L = wl - ww/2;
    H = wl + ww/2;
    
    for i=1:1:s(1)
        for j=1:1:s(2)
            for k=1:1:s(3)
                c = vol(i,j,k);
                if (c<L) 
                    outvol(i,j,k) = 0 ;
                elseif (c>H)
                    outvol(i,j,k) = 255;
                else
                    outvol(i,j,k) = uint8((double((c - L))/double(H-L))*255);
                end
            end
        end
    end
end