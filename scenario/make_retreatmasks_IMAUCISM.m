% Combine distance map and retreat scenario to get a time dependent ice fraction mask
% Interpolate to model grid by binning
 
clear

%amodel='IMAU_CISM16'
%amodel='IMAU_CISM04'
amodel='IMAU_CISM04_RDS3'

%aver = 'v1'


% continuous from hist

%aver = 'hist_high_v1'

aver = 'hist_med_v1'

%aver = 'hist_low_v1'


% scenario setup 2014-2100, including init year 2014
ts = 87;

%ascenario='ZERO'

%ascenario='MIROC5-rcp85-Rmed'
%ascenario='MIROC5-rcp85-Rhigh'
%ascenario='MIROC5-rcp85-Rlow'

%ascenario='MIROC5-rcp26-Rmed'
%%ascenario='MIROC5-rcp26-Rhigh'
%%ascenario='MIROC5-rcp26-Rlow'

%ascenario='NorESM1-rcp85-Rmed'
%ascenario='NorESM1-rcp85-Rhigh'
%ascenario='NorESM1-rcp85-Rlow'

%ascenario='HadGEM2-ES-rcp85-Rmed'
%ascenario='HadGEM2-ES-rcp85-Rhigh'
%ascenario='HadGEM2-ES-rcp85-Rlow'

%ascenario='CSIRO-Mk3.6-rcp85-Rmed'
%ascenario='CSIRO-Mk3.6-rcp85-Rhigh'
%ascenario='CSIRO-Mk3.6-rcp85-Rlow'

ascenario='IPSL-CM5-MR-rcp85-Rmed'
%ascenario='IPSL-CM5-MR-rcp85-Rhigh'
%ascenario='IPSL-CM5-MR-rcp85-Rlow'

%ascenario='ACCESS1.3-rcp85-Rmed'
%ascenario='ACCESS1.3-rcp85-Rhigh'
%ascenario='ACCESS1.3-rcp85-Rlow'

% flag for plotting 
flg_plot=0;

addpath('../toolbox')

% read days for time axis 
caldays = load('../Data/Grid/days_1900-2300.txt');

filename=['../Models/' amodel '/retreatmasks_' aver '_' ascenario '_' amodel '.nc'];

% load Basin masks
bas = ncload(['../Data/Basins/ISMIP6_Ocean_Regions_0d6km.nc']);

NO = bas.IDs == 1;
NE = bas.IDs == 2;
CE = bas.IDs == 3;
SE = bas.IDs == 4;
SW = bas.IDs == 5;
CW = bas.IDs == 6;
NW = bas.IDs == 7;

% load regional retreats
load(['../Rates/' aver '/' ascenario '/retreat.mat']);
% variable retreat is positive for a retreating glacier  
rs = - retreat(:,1:ts);
nor = rs(1,:);
ner = rs(2,:);
cer = rs(3,:);
ser = rs(4,:);
swr = rs(5,:);
cwr = rs(6,:);
nwr = rs(7,:);

% load ice mask
ima = ncload(['../Models/' amodel '/sftgif_0d6.nc']);
g1 = ncload(['../Models/' amodel '/sftgif.nc']);
dist = ncload(['../Models/' amodel '/dist0d6km_M.nc']);
wght = ncload(['../Models/' amodel '/weight_0d6_ISMIP6_GrIS.nc']);
wght = max(wght.ww,0);

nx = size(ima.sftgif,1);
ny = size(ima.sftgif,2);
nt = size(rs,2);

% scenarios
time = 2014:1:2100; 

% historical
%time = 1959:1:2014; 

nxm = length(g1.x);
nym = length(g1.y);

[y,x] = meshgrid(double(dist.y),double(dist.x));
[yB, xB] = meshgrid(double(g1.y), double(g1.x));

% output on model grid
refr3 = single(zeros(nxm,nym,nt));

for k=1:nt
%for k=1:1
    k
    refr2 = single(zeros(nx,ny));

% retreat after n years
    retr = (dist.dist < nor(k));
    refr = max(double(ima.sftgif) - retr.*wght,0);
    refr2(:,:) = refr2(:,:) + refr.*NO;
%    shade(refr2(:,:,k))

    retr = (dist.dist < ner(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr2(:,:) = refr2(:,:) + refr.*NE;

    retr = (dist.dist < cer(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr2(:,:) = refr2(:,:) + refr.*CE;

    retr = (dist.dist < ser(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr2(:,:) = refr2(:,:) + refr.*SE;

    retr = (dist.dist < swr(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr2(:,:) = refr2(:,:) + refr.*SW;

    retr = (dist.dist < cwr(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr2(:,:) = refr2(:,:) + refr.*CW;

    retr = (dist.dist < nwr(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr2(:,:) = refr2(:,:) + refr.*NW;

%    shade(refr2(:,:))

    
% Matlab interpolation and weight creation 0d6 -> model grid
mask = double(refr2>0.);

% remap mask with binning
wmask = binToMatrix(y,x,mask,yB,xB);
wmask(~isfinite(wmask))=0.;

refr3(:,:,k) = wmask;

end


if (flg_plot)
    % plot retreats
    co = get(0,'DefaultAxesColorOrder');
    figure
    hold on; box on;
    plot(time,nor,'Color',co(1,:))
    plot(time,ner,'Color',co(2,:))
    plot(time,cer,'Color',co(3,:))
    plot(time,ser,'Color',co(4,:))
    plot(time,swr,'Color',co(5,:))
    plot(time,cwr,'Color',co(6,:))
    plot(time,nwr,'Color',co(7,:))
    legend({'NO','NE','CE','SE','SW','CW','NW'},'Location','nw')
end

if exist(filename)
     delete(filename)
end
nccreate(filename,'sftgif', 'Dimensions', {'x', nxm, 'y', nym, 'time', inf},'Datatype','single','DeflateLevel',1);
nccreate(filename,'time', 'Dimensions', {'time', inf});
ncwrite(filename, 'sftgif', refr3);
ncwrite(filename, 'time', time*31556926.);
ncwriteatt(filename,'time','units','seconds since 1995-1-1');

%% time axis
timestamp = caldays(time-1900+1,3);
time_bounds = [caldays(time-1900+1,2), caldays(time-1900+2,2)];

ncwrite_GrIS_retreatmasks(filename, refr3, 'sftgif' ,g1.x,g1.y,timestamp, time_bounds);
