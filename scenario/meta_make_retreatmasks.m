% Run for a number of scenarios

amodel='OBS'
%amodel='OBSSH'
%amodel='IMAUICE16'
%amodel='CISM'
%amodel='ELMER'
%amodel='ISSM_AWI_grid1'
%amodel='ISSM_AWI_grid2'
%amodel='ISSM_AWI_grid3'
%amodel='ISSMUCIJPL'
%amodel='ISSM_JPLPALEO'
%amodel='ISSM_JPL'
%amodel='SICOPOLIS1'
%amodel='SICOPOLIS2'
%amodel='SICOPOLIS3'
%amodel='VUB_GISM_SIA'
%amodel='VUB_GISM_SIA2'
%amodel='VUB_GISM_HO2'
%amodel='UAF_PISM2'
%amodel='GRISLI_LSCE2'
%amodel='MUN_GSM2371'
%amodel='VUB_GISM_SIA3'
%amodel='NCAR_CISM2'
%amodel='VUB_GISM_SIA4'
%amodel='GRISLI_LSCE3'
%amodel='ISSM_AWI_gridY'
%amodel='VUB_GISM_HOMv2'

aver = 'v1'

%%%%%%%%%%%% Scenarios

ascenario='ZERO'
make_retreatmasks_func 

agcm = 'MIROC5'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'NorESM1'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func
           
agcm = 'MIROC5'
ascen = 'rcp26'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'HadGEM2-ES'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'CSIRO-Mk3.6'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'IPSL-CM5-MR'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'ACCESS1.3'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'CNRM-CM6'
ascen = 'ssp585'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'CNRM-CM6'
ascen = 'ssp126'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'CNRM-ESM2'
ascen = 'ssp585'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'UKESM1-CM6'
ascen = 'ssp585'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'CESM2'
ascen = 'ssp585'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func
