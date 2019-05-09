% Test run for one scenarios


%amodel='OBS'
%amodel='OBSSH'
%amodel='IMAUICE16'
%amodel='IMAUICE16V2'
%amodel='CISM'
%amodel='ELMER'
%amodel='IMAUICE16V5'
%amodel='IMAUICE16V3'
%aver = 'v1'

%amodel='ISSMUCIJPL'
%aver = 'v1'

%amodel='AWI_ISSM'
%amodel='AWI_ISSM_grid1'
%amodel='AWI_ISSM_grid2'
%amodel='AWI_ISSM_grid3'
%amodel='AWI_ISSM_grid4'
%aver = 'v1'

%amodel='ISSM_JPLPALEO'
amodel='ISSM_JPL'
aver = 'v1'

%amodel='SICOPOLIS1'
%aver = 'v1'

%amodel='ISSM_GSFC'
%aver = 'v1'

%%%%%%%%%%%% Scenarios

%ascenario='ZERO'
%make_retreatmasks_func 

agcm = 'MIROC5'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_func

%agcm = 'MIROC5'
%ascen = 'rcp26'
%ascenario=[agcm '-' ascen '-Rmed']
%make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_func

%agcm = 'NorESM1'
%ascen = 'rcp85'
%ascenario=[agcm '-' ascen '-Rmed']
%make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_func
           
%agcm = 'HadGEM2-ES'
%ascen = 'rcp85'
%ascenario=[agcm '-' ascen '-Rmed']
%make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_func

%agcm = 'CSIRO-Mk3.6'
%ascen = 'rcp85'
%ascenario=[agcm '-' ascen '-Rmed']
%make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_func

%agcm = 'IPSL-CM5-MR'
%ascen = 'rcp85'
%ascenario=[agcm '-' ascen '-Rmed']
%make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_func
