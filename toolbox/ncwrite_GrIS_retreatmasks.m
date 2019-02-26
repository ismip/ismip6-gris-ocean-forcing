function ncwrite_GrIS(ancfile,avar,varname,x1,y1,time, time_bounds)
% write variables to a netcdf file and add ISMIP6 specific information
% function ncwrite_GrIS(ancfile,avar,varname,x1,y1,time,time_bounds)

% TODO: check input arguments and sizes

% Always overwrite, remove destination if exists
if exist(ancfile, 'file') ~= 0;
    delete(ancfile)
end

nx = length(x1);
ny = length(y1);
nt = size(avar,3);

% write out
% Define
nccreate(ancfile,varname, 'Dimensions', {'x', nx, 'y', ny, 'time', inf},'Datatype','single');
nccreate(ancfile,'x','Dimensions',{'x',nx}, 'Datatype','single');
nccreate(ancfile,'y','Dimensions',{'y',ny}, 'Datatype','single');
nccreate(ancfile,'time', 'Dimensions', {'time', inf});
nccreate(ancfile,'time_bounds','Dimensions',{'nv',2,'time',nt}, 'Datatype','single');
% write
ncwrite(ancfile, varname, avar);
ncwrite(ancfile,'x',x1);
ncwrite(ancfile,'y',y1);
ncwrite(ancfile, 'time', time);
ncwrite(ancfile, 'time_bounds', time_bounds');

% Attributes
ncwriteatt(ancfile,'x', 'units', 'm') ;
ncwriteatt(ancfile,'x', 'standard_name', 'projection_x_coordinate') ;
ncwriteatt(ancfile,'x', 'axis', 'x') ;
ncwriteatt(ancfile,'y', 'units', 'm') ;
ncwriteatt(ancfile,'y', 'standard_name', 'projection_y_coordinate') ;
ncwriteatt(ancfile,'y', 'axis', 'y') ;
ncwriteatt(ancfile,'time', 'units', 'days since 1900-1-1 00:00:00') ;
ncwriteatt(ancfile,'time', 'standard_name', 'time') ;
ncwriteatt(ancfile,'time', 'calendar', 'gregorian') ;
ncwriteatt(ancfile,'time', 'bounds', 'time_bounds') ;
ncwriteatt(ancfile,'time', 'axis', 'T') ;

ncwriteatt(ancfile,'/','Conventions','CF-1.7')
ncwriteatt(ancfile,'/','proj4','+init=epsg:3413')
ncwriteatt(ancfile,'/','Description',['Retreat masks for outlet glacier forcing. Prepared for ISMIP6 by Heiko Goelzer (h.goelzer@uu.nl), IMAU, ', date ])
% Add attributes to variables
ncwriteatt(ancfile,varname, 'units', '1') ;
ncwriteatt(ancfile,varname, 'long_name', 'ice fraction mask for retreat parameterisation') ;
ncwriteatt(ancfile,varname, 'grid_mapping', 'mapping') ;
%ncwriteatt(ancfile,varname, '_FillValue', -9999.) ; 

% Mapping
ncwrite_mapping_GrIS(ancfile);
