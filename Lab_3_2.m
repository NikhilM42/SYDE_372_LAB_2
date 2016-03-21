clc;
clear;

load('lab2_2.mat','al');
load('lab2_2.mat','bl');
load('lab2_2.mat','cl');

%% Maximum likelihood method
%% Parametric Estimation - Gaussian Pazen

sig = 20;

[pa, x_a, y_a] = parzen(al,1,sig);
[pb, x_b, y_b] = parzen(bl,1,sig);
[pc, x_c, y_c] = parzen(cl,1,sig);
sizea = size(al);
mesh(x_a,y_a,pa)
hold on;
mesh(x_b,y_b,pb);
mesh(x_c,y_c,pc);

figure(2);
mesh(x_a,y_a,pa,'EdgeColor','black')
hold on;
mesh(x_b,y_b,pb, 'EdgeColor','green');
mesh(x_c,y_c,pc, 'EdgeColor','blue');

xa = [];
ya = [];
xb = [];
yb = [];
xc = [];
yc = [];
x = [];
y = [];

% figure(2);
% for a = 1:sizea(2)
%     for b = 1:sizea(2)
%         
%         if ( yal >= ybl && yal >= ycl )
%             xa(end+1) = xxi_a(a,a);
%             ya(end+1) = yyi_a(b,b);
%         elseif ( ybl > yal && ybl >= ycl )
%             xb(end+1) = xxi_b(a,a);
%             yb(end+1) = yyi_b(b,b);
%         elseif ( ycl > yal && ycl > ybl )
%             xc(end+1) = xxi_c(a,a);
%             yc(end+1) = yyi_c(b,b);
%         else
%             x(end+1) = a;
%             y(end+1) = b;
%         end
%     end 
% end
% 
% hold on;
% plot(xa,ya,xb,yb,xc,yc,x,y);
% scatter(al(:,1),al(:,2))
% scatter(bl(:,1),bl(:,2))
% scatter(cl(:,1),cl(:,2))
% title('Parametric Estimation');
% xlabel('X');
% ylabel('Y');
% legend('Boundary AL','Boundary BL','Boundary CL','AL','BL','CL');
% hold off;

