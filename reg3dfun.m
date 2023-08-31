function [v, d] = reg3dfun(movingVol, fixedVol)
    [d, v] =  imregdemons(movingVol, fixedVol,[400 300 100],'AccumulatedFieldSmoothing',0.5);
end