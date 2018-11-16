function [zB,varargout] = binToMatrix(x,y,z,xB,yB)
%zB = binToMatrix(x,y,z,xB,yB)
%[zB, zBstd] = binToMatrix(x,y,z,xB,yB)
%[zB, zBstd, bin_population] = binToMatrix(x,y,z,xB,yB)
%Calculates zB = zB(xB,yB) which is the binned version of the randomly 
%sampled function z=z(x,y). It uses the bin centers of the equispaced 
%reference grid xB,yB (created with meshgrid). The first and last bins 
%in each direction also include data half a bin width outside of the 
%reference grid. If the bin contains no elements, NaN is returned for 
%that bin. Nan elements in z are ignored.
%
%Written by Karl Berggren, Royal Institute of Technology, Stockholm

data = [x(:) y(:) z(:)];

% Assume xB and yB equispaced (and created with meshgrid)

xDiff = xB(1,2)-xB(1,1);
yDiff = yB(2,1)-yB(1,1);

%Exclude any NaN and elements out of range
in_range = x(:) >= (xB(1,1)-xDiff/2) & x(:) < (xB(1,end)+xDiff/2) &...
    y(:) >= (yB(1,1)-yDiff/2) & y(:) < (yB(end,1)+yDiff/2) &...
    ~isnan(z(:));

data = data(in_range,:);

%Find indices
data(:,1) = floor((data(:,1)-(xB(1,1)-xDiff/2))/xDiff)+1;
data(:,2) = floor((data(:,2)-(yB(1,1)-yDiff/2))/yDiff)+1;

% Calculate mean, standard deviation and population for each bin
zB = zeros(size(xB));
zBsquare = zeros(size(xB));
population = zeros(size(xB));

for ii = 1:size(data,1)
   zB(data(ii,2),data(ii,1)) = zB(data(ii,2),data(ii,1)) + data(ii,3);
   zBsquare(data(ii,2),data(ii,1)) = zBsquare(data(ii,2),data(ii,1)) + data(ii,3)^2;
   population(data(ii,2),data(ii,1)) = population(data(ii,2),data(ii,1)) + 1;
end

population(population==0) = nan;
zB = zB./population;
zBstd = sqrt((zBsquare - population.*zB.^2)./(population-1)); %Normalize with n-1 samples for standard deviation
population(isnan(population)) = 0;

varargout{1} = zBstd;
varargout{2} = population;
end
    
