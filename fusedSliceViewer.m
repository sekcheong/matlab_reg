function fusedSliceViewer(vol1, vol2)

    fig = figure('position',[360 500 400 400]);
    sz = size(vol1);
    index = int16 (sz(3) / 2);
    
    slider = uicontrol('style','slider','position',[0 0 200 20],'min', 1, 'max', sz(3), 'Value',index);

    c1 = vol1(:,:,index);
    c2 = vol2(:,:,index);

    d = imfuse(c1,c2,"falsecolor");
    imshow(d);

    addlistener(slider, 'Value', 'PostSet', @callback);
    movegui(fig, 'center')
    
    function callback(~, event)
        index  = int16(get(event.AffectedObject, 'Value'));
        c1 = vol1(:,:,index);
        c2 = vol2(:,:,index);
        d = imfuse(c1,c2,"falsecolor");
        imshow(d);
    end

end

