% Meta matlab script to work tasks in one go

addpath('../toolbox')

% Interpolation of mask from model to obs grid
remap_mask_m2o_M

% Compute distances from calving front
comp_dist_M_0d6km

% Remap dist back to model grid
remap_dist_o2m
