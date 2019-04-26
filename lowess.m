%% Master script for the surface calculation

%% File loading

clear all
points = load('all_points_yungay.mat'); %matrix with only coordinates

% 500 MHz GPR data
xb = points.Xb{1,1};
yb = points.Yb{1,1};
zb = points.Zb{1,1};

for ii = 2:26
    xb(end+1:end+length(points.Xb{1,ii})) = points.Xb{1,ii}; 
    yb(end+1:end+length(points.Yb{1,ii})) = points.Yb{1,ii};
    zb(end+1:end+length(points.Zb{1,ii})) = points.Zb{1,ii};
end

% filtering nans
nanZbr = find(isnan(zb));
zb(nanZbr) = [];
xb(nanZbr) = [];
yb(nanZbr) = [];

% surface fitting
[sf_500,gof_500,output_500] = fit([xb, yb],zb,'lowess');

% 1000 MHz GPR data
xb1000 = points_1000.Xb{1,1};
yb1000 = points_1000.Yb{1,1};
zb1000 = points_1000.Zb{1,1};

for ii = 2:26
    xb1000(end+1:end+length(points_1000.Xb{1,ii})) = points_1000.Xb{1,ii}; 
    yb1000(end+1:end+length(points_1000.Yb{1,ii})) = points_1000.Yb{1,ii};
    zb1000(end+1:end+length(points_1000.Zb{1,ii})) = points_1000.Zb{1,ii};
end

% filtering nans
nanzb1000r = find(isnan(zb1000));
zb1000(nanzb1000r) = [];
xb1000(nanzb1000r) = [];
yb1000(nanzb1000r) = [];

% surface fitting
[sf_1000,gof_1000,output_1000] = fit([xb1000, yb1000],zb1000,'lowess');


elev_new = feval(sf_elev,[all_points_YU(:,1),all_points_YU(:,2)]);
clay_d500 = feval(sf_500,[all_points_YU(:,1),all_points_YU(:,2)]);
clay_d1000 = feval(sf_1000,[all_points_YU(:,1),all_points_YU(:,2)]);
% clay_d5002 = feval(sf_5002,[all_points_YU(:,1),all_points_YU(:,2)]);
clay_500elev = elev_new-clay_d500;
% clay_500elev2 = elev_new-clay_d5002;

all_points_YU(:,6) = elev_new;
all_points_YU(:,7) = clay_500elev;
% all_points_YU(:,8) = clay_500elev2;

%% Clay elevation coupled surface

[sf_500elev,gof_500elev,output_500elev] = fit([all_points_YU(:,1),all_points_YU(:,2)],all_points_YU(:,7),'lowess');
% [sf_500elev2,gof_500elev2,output_500elev2] = fit([all_points_YU(:,1),all_points_YU(:,2)],all_points_YU(:,8),'lowess');
clay_500elev_new = feval(sf_500elev,[all_points_YU(:,1),all_points_YU(:,2)]);
% clay_500elev_new2 = feval(sf_500elev2,[all_points_YU(:,1),all_points_YU(:,2)]);

all_points_YU(:,9) = all_points_YU(:,6)-clay_500elev_new; %new thickness after topo correction
% all_points_YU(:,10) = all_points_YU(:,6)-clay_500elev_new2; %new thickness after topo correction

%% Clay thickness calculation

xq = linspace(min(all_points_YU(:,1)), max(all_points_YU(:,1)),1000);
yq = linspace(min(all_points_YU(:,2)), max(all_points_YU(:,2)),1000);
[X,Y] = meshgrid(xq,yq);
% Z = griddata(all_points_YU(:,1),all_points_YU(:,2),all_points_YU(:,9),X,Y);
% Z_1000 = griddata(all_points_YU(:,1),all_points_YU(:,2),all_points_YU(:,10),X,Y);
Zthick = griddata(all_points_YU(:,1),all_points_YU(:,2),clay_d500,X,Y);
Zthick1000 = griddata(all_points_YU(:,1),all_points_YU(:,2),clay_d1000,X,Y);
v= [0.80:0.05:1.15];

%% 

figure
surf(X,Y,Zthick)
demcmap(clay_d500)
shading interp
set(gca,'zdir','reverse')
daspect([1 1 0.05])
xlabel('Easting [m]+396500')
ylabel('Northing [m]+7334100')
zlabel('Depth [m]')
title('Thickness')
xlim([min(all_points_YU(:,1)) max(all_points_YU(:,1))])
ylim([min(all_points_YU(:,2)) max(all_points_YU(:,2))])
view(-15,25)

figure
surf(X,Y,Zthick1000)
demcmap(clay_d1000)
shading interp
set(gca,'zdir','reverse')
daspect([1 1 0.05])
xlabel('Easting [m]+396500')
ylabel('Northing [m]+7334100')
zlabel('Depth [m]')
title('Thickness')
xlim([min(all_points_YU(:,1)) max(all_points_YU(:,1))])
ylim([min(all_points_YU(:,2)) max(all_points_YU(:,2))])
view(-15,25)
% surf(X,Y,Z)
% demcmap(all_points_YU(:,8))
% shading interp
% set(gca,'zdir','reverse')
% daspect([1 1 0.05])
% xlabel('Easting [m]+396500')
% ylabel('Northing [m]+7334100')
% zlabel('Depth [m]')
% title('Thickness post topo')
% xlim([min(all_points_YU(:,1)) max(all_points_YU(:,1))])
% ylim([min(all_points_YU(:,2)) max(all_points_YU(:,2))])
% view(-15,25)