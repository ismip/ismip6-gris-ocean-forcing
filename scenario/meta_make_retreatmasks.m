% Run for a number of scenarios


%amodel='OBS'
%amodel='OBSSH'
%amodel='IMAUICE16'
%amodel='IMAUICE16V2'
%amodel='CISM'
%amodel='ELMER'
%amodel='ISSMUCIJPL'
%amodel='IMAUICE16V5'
%amodel='IMAUICE16V3'
%aver = 'v1'

% continuous from hist
%amodel='IMAUICE16V2HISTHIGH'
%aver = 'hist_high_v1'

%amodel='IMAUICE16V2HISTMED'
amodel='IMAUICE16v8histmed'
aver = 'hist_med_v1'

%amodel='IMAUICE16V2HISTLOW'
%aver = 'hist_low_v1'

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

agcm = 'MIROC5'
ascen = 'rcp26'
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
           
