function ncdata=ncload(ancfile)
% ncdata=ncload(ancfile)
% load variables of a netcdf file
%
% Written by Heiko Goelzer

% Open file 
ncid = netcdf.open(ancfile,'nowrite');
[ndims,nvars,ngatts,unlimdimid] = netcdf.inq(ncid);
% nc var ids
varids=netcdf.inqVarIDs(ncid);

cnt=0;
for varid=varids
  cnt = cnt+1;
%  netcdf.inqVar(ncid,varid)
  varnames{1,cnt}=netcdf.inqVar(ncid,varid);
% assign variables to names; permute in place
%  eval(['ncdata.' varnames{cnt} '= squeeze(netcdf.getVar(ncid,' num2str(cnt-1) '));']);
  eval(['ncdata.' varnames{cnt} '= squeeze(ncread(ancfile,''' varnames{cnt} '''));']);

end

netcdf.close(ncid);

