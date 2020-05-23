% Run for a number of scenarios: core experiments minus test case MIROC5


amodel='OBS'
%amodel='OBSSH'
%amodel='IMAUICE16'
%amodel='IMAUICE16V2'
%amodel='CISM'
%amodel='ELMER'
%amodel='IMAUICE16V5'
%amodel='IMAUICE16V3'
%amodel='ISSMUCIJPL'
%amodel='ISSM_JPLPALEO'
%amodel='ISSM_JPL'
%amodel='SICOPOLIS1'
%amodel='ISSM_GSFC'
%amodel='UAF_PISM2'

aver = 'v1'


%%%%%%%%%%%% Scenarios

%ascenario='ZERO'
%make_retreatmasks_func 

agcm = 'MIROC5'
ascen = 'rcp85'
%ascenario=[agcm '-' ascen '-Rmed']
%make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_func

agcm = 'NorESM1'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_func
           
agcm = 'MIROC5'
ascen = 'rcp26'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_func

agcm = 'HadGEM2-ES'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_func

