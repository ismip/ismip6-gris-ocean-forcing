function ncwrite(ancfile,avar,varname)
% ncwrite(ancfile,avar,varname)
% write variables to a netcdf file
%
% Written by Heiko Goelzer

dimnames={'x','y'};
% Open netCDF file.
ncid = netcdf.create(ancfile,'CLOBBER');

% Define the dimensions of the variable.
dimids=[];
for i=1:ndims(avar)
  dimids = [dimids,netcdf.defDim(ncid,dimnames{i},size(avar,i))];
end
% Define a new variable in the file.
my_varID = netcdf.defVar(ncid,varname,'double',dimids);

% Leave define mode and enter data mode to write data.
netcdf.endDef(ncid);

% Write data to variable.
netcdf.putVar(ncid,my_varID,avar);

netcdf.close(ncid);
