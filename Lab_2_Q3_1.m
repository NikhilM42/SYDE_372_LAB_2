clc;
clear;

load('lab2_2.mat','al');
load('lab2_2.mat','bl');
load('lab2_2.mat','cl');

%% Maximum likelihood method
%% Parametric Estimation - Gaussian

ual = mean(al);
ubl = mean(bl);
ucl = mean(cl);
sal = cov(al);
sbl = cov(bl);
scl = cov(cl);

sizeal = size(al);
sizebl = size(bl);
sizecl = size(cl);

yal = mvnpdf(al,ual,sal);
ybl = mvnpdf(bl,ubl,sbl);
ycl = mvnpdf(cl,ucl,scl);

xa = [];
ya = [];
xb = [];
yb = [];
xc = [];
yc = [];
x = [];
y = [];

for a = 0:1:450
    for b = 0:1:450
        yal = mvnpdf([a,b],ual,sal);
        ybl = mvnpdf([a,b],ubl,sbl);
        ycl = mvnpdf([a,b],ucl,scl);
        if ( yal > ybl && yal > ycl )
            xa(end+1) = a;
            ya(end+1) = b;
        elseif ( ybl > yal && ybl > ycl )
            xb(end+1) = a;
            yb(end+1) = b;
        elseif ( ycl > yal && ycl > ybl )
            xc(end+1) = a;
            yc(end+1) = b;
        else
            x(end+1) = a;
            y(end+1) = b;
        end
    end 
end

hold on;
plot(xa,ya,xb,yb,xc,yc,x,y);
scatter(al(:,1),al(:,2))
scatter(bl(:,1),bl(:,2))
scatter(cl(:,1),cl(:,2))
title('Parametric Estimation');
xlabel('X');
ylabel('Y');
legend('Boundary AL','Boundary BL','Boundary CL','AL','BL','CL');
hold off;

