% make time series of retreat

%NO ~ 8 km
%NE ~ 10 km
%CE ~ 12 km
%SE ~ 12 km
%SW ~ 10 km
%CW ~ 15 km
%NW ~ 10 km

tot = [8,10,12,12,10,15,10]*1.5;

time = 0:1:105;

lin = 0:(1/80):1;

retreat = zeros(7,106);

for k=1:7
    retreat(k,:) = tot(k);
    retreat(k,1:81) = lin*tot(k);
    retreat(k,52:60) = tot(k)/8*5;
    retreat(k,62:70) = tot(k)/8*6;
    retreat(k,72:80) = tot(k)/8*7;
end


% Plotting
figure
plot(time, retreat(:,:),'-o')
xlabel('Time [yr]')
ylabel('Retreat [km]')
print -dpng -r300 retreat_scenarios

save retreat_test.mat retreat
