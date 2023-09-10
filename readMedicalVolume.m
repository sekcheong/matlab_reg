function voldata = readMedicalVolume(path)
    vol = dicomreadVolume(path);
    files = dir(path + "/*.dcm");
    info = dicominfo(fullfile(files(1).folder,files(1).name));
    % remove 1 dim and apply pixel scaling to HU value
    vol = squeeze(vol);
    vol  = vol*info.RescaleSlope + info.RescaleIntercept;
    voldata.vol = vol;
    voldata.info = info;
end

