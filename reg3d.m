close all;
clear variables;
clc;

fixedVol = dicomreadVolume(".\2");
movingVol = dicomreadVolume(".\1");

fixedVol = squeeze(fixedVol);
movingVol = squeeze(movingVol);

tic
fixedVol = gpuArray(fixedVol);
movingVol = gpuArray(movingVol);
[D,movingRegVol] = imregdemons(movingVol, fixedVol,[400 300 100],'AccumulatedFieldSmoothing',0.5);
toc