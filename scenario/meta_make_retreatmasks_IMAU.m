% Run for a number of scenarios

% continuous from hist
% 3a
%amodel='IMAUICE16V2HISTLOW'
%aver = 'hist_low_v1'
% 3b
%amodel='IMAUICE16V2HISTMED'
%aver = 'hist_med_v1'
% 3c
%amodel='IMAUICE16V2HISTHIGH'
%aver = 'hist_high_v1'

%amodel='IMAUICE16v8histmed'
%amodel='IMAUICE16v09histmed'
%amodel='IMAUICE16v08histmed'

%06b
amodel='IMAUICE16v06histmed'
aver = 'hist_med_v1'


%ascenario='ZERO'
%make_retreatmasks_IMAU_func

%agcm = 'MIROC5'
%ascen = 'rcp85'
%ascenario=[agcm '-' ascen '-Rmed']
%make_retreatmasks_IMAU_func
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_IMAU_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_IMAU_func

%agcm = 'NorESM1'
%ascen = 'rcp85'
%ascenario=[agcm '-' ascen '-Rmed']
%make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_IMAU_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_IMAU_func
%          
%agcm = 'HadGEM2-ES'
%ascen = 'rcp85'
%ascenario=[agcm '-' ascen '-Rmed']
%make_retreatmasks_func 
%ascenario=[agcm '-' ascen '-Rhigh']
%make_retreatmasks_IMAU_func
%ascenario=[agcm '-' ascen '-Rlow']
%make_retreatmasks_IMAU_func


agcm = 'MIROC5'
ascen = 'rcp26'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_IMAU_func
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_IMAU_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_IMAU_func

agcm = 'CSIRO-Mk3.6'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_IMAU_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_IMAU_func

agcm = 'IPSL-CM5-MR'
ascen = 'rcp85'
ascenario=[agcm '-' ascen '-Rmed']
make_retreatmasks_func 
ascenario=[agcm '-' ascen '-Rhigh']
make_retreatmasks_IMAU_func
ascenario=[agcm '-' ascen '-Rlow']
make_retreatmasks_IMAU_func
