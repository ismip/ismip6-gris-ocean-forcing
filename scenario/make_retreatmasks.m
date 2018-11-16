% Combine distance map and retreat scenario to get a time dependent ice fraction mask.
 
clear

amodel='OBS'
ascenario='test00'

filename=['../Models/' amodel '/retreatmasks_' ascenario '_' amodel '_01000m.nc'];

% load Basin masks
bas = ncload('../Data/Basins/ISMIP6_Ocean_Regions_01000m.nc');

% (bas.basin11 + bas.basin12 + bas.basin13 + bas.basin14) > 0;
NO = bas.IDs == 1;
NE = bas.IDs == 2;
CE = bas.IDs == 3;
SE = bas.IDs == 4;
SW = bas.IDs == 5;
CW = bas.IDs == 6;
NW = bas.IDs == 7;

% load regional retreats
load(['../Rates/' ascenario '/retreat_test.mat']);
rs = retreat(:,1:101);
nor = rs(1,:);
ner = rs(2,:);
cer = rs(3,:);
ser = rs(4,:);
swr = rs(5,:);
cwr = rs(6,:);
nwr = rs(7,:);

% load ice mask
ima = ncload(['../Models/' amodel '/sftgif_01000m.nc']);
dist = ncload(['../Models/' amodel '/dist_0d6_ISMIP6_GrIS_01km.nc']);
wght = ncload(['../Models/' amodel '/weight_0d6_ISMIP6_GrIS_01km.nc']);
wght = max(wght.ww,0);

nx = size(ima.sftgif,1);
ny = size(ima.sftgif,2);
nt = length(rs);
x = 1:nx;
y = 1:ny;
time = 0:1:100;
refr3 = single(zeros(nx,ny,length(time)));

for k=1:nt
    k
% retreat after n years
    retr = (dist.dist_bin < nor(k));
    refr = max(double(ima.sftgif) - retr.*wght,0);
    refr3(:,:,k) = refr3(:,:,k) + refr.*NO;
%    shade(refr3(:,:,k))

    retr = (dist.dist_bin < ner(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr3(:,:,k) = refr3(:,:,k) + refr.*NE;
%    shade(refr3(:,:,k))

    retr = (dist.dist_bin < cer(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr3(:,:,k) = refr3(:,:,k) + refr.*CE;
%    shade(refr3(:,:,k))

    retr = (dist.dist_bin < ser(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr3(:,:,k) = refr3(:,:,k) + refr.*SE;
%    shade(refr3(:,:,k))

    retr = (dist.dist_bin < swr(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr3(:,:,k) = refr3(:,:,k) + refr.*SW;
%    shade(refr3(:,:,k))

    retr = (dist.dist_bin < cwr(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr3(:,:,k) = refr3(:,:,k) + refr.*CW;

    retr = (dist.dist_bin < nwr(k));
    refr = max(double(ima.sftgif) - retr.*wght ,0);
    refr3(:,:,k) = refr3(:,:,k) + refr.*NW;
end

    shade(refr3(:,:,k))

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

% write out
if exist(filename)
     delete(filename)
end
nccreate(filename,'sftgif', 'Dimensions', {'x', nx, 'y', ny, 'time', inf},'Datatype','single');
nccreate(filename,'time', 'Dimensions', {'time', inf});
ncwrite(filename, 'sftgif', refr3);
ncwrite(filename, 'time', time);
