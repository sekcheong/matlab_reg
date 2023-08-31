clc;
close all;
fixed = imread('fixed.jpg');
moving = imread('moving.jpg');

fixed = im2gray(fixed);
moving = im2gray(moving);
imshowpair(fixed, movingReg);
[D,movingReg] = imregdemons(moving,fixed,[500 400 200],'AccumulatedFieldSmoothing',1.3);
imshowpair(fixed, movingReg);
r = imwarp(m, D);