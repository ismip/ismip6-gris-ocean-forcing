function ncwrite_mapping_GrIS(ancfile)
% Write GrIS mapping information to nectdf file <ancfile>

mapping = 'mapping';
nccreate(ancfile,'mapping','Datatype','char');
ncwriteatt(ancfile,'mapping', 'grid_mapping_name', 'polar_stereographic') ;
ncwriteatt(ancfile,'mapping', 'latitude_of_projection_origin', '90.') ;
ncwriteatt(ancfile,'mapping', 'standard_parallel', '70.') ;
ncwriteatt(ancfile,'mapping', 'straight_vertical_longitude_from_pole', '-45') ;
ncwriteatt(ancfile,'mapping', 'semi_major_axis', '6378137') ;
ncwriteatt(ancfile,'mapping', 'inverse_flattening', '298.257223563') ;
ncwriteatt(ancfile,'mapping', 'false_easting', '0.') ;
ncwriteatt(ancfile,'mapping', 'false_northing', '0.') ;

