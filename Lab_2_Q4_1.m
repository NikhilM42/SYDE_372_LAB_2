clc;
clear;

load('lab2_3.mat','a');
load('lab2_3.mat','b');

points = 1;
gw = [];
gw0 = [];
naBj = [];
nbAj = [];
maxj = 0;
while points == 1
    sizea = size(a);
    sizeb = size(b);
    rpa = round(rand*sizea(1))+1;
    rpb = round(rand*sizeb(1))+1;
    if rpb>sizeb(1)
        rpb = sizeb(1);
    end
    if rpa>sizea(1)
        rpa = sizea(1);
    end
    randoma = a(rpa,:);
    randomb = b(rpb,:);
    
    naB = 0;
    nbA = 0;
    
    W = randomb-randoma;
    W0 = 0.5*(randomb*randomb.'-randoma*randoma.');
    %MED
    ta = [];
    tb = [];
    for z=1:sizea(1)
        ga = W*a(z,:)' - W0;
        if ga>0
            naB = naB + 1;
            ta(end+1,:) = a(z,:);
        end
    end
    for z=1:sizeb(1)
        gb = W*b(z,:)' - W0;
        if gb<0
            nbA = nbA + 1;
            tb(end+1,:) = b(z,:);
        end
    end
    if ( naB == 0 || nbA == 0 )
        gw(end+1,:) = W;
        gw0(end+1) = W0;
        naBj(end+1) = naB;
        nbAj(end+1) = nbA;
        maxj = maxj + 1;
    end
    if( naB == 0)
        b = [];
        b = tb;
    end
    if( nbA == 0)
        a = [];
        a = ta;
    end
    tempsizea = size(a);
    tempsizeb = size(b);
    if(tempsizea(1) == 0 || tempsizeb(1) == 0)
        points = 0;
    end
end

xa = [];
ya = [];
xb = [];
yb = [];

for z=1:1:600
    for y=1:1:450
        for j = 1:maxj
            gtest = gw(j,:)*[z,y]' - gw0(j);
            if ((gtest < 0) && (nbAj(j) == 0))
                xa(end+1) = z;
                ya(end+1) = y;
            elseif (gtest > 0 && naBj(j) == 0)
                xb(end+1) = z;
                yb(end+1) = y;
            end
        end
    end
end

load('lab2_3.mat','a');
load('lab2_3.mat','b');

hold on;
scatter(xa,ya);
scatter(xb,yb);
scatter(a(:,1),a(:,2));
scatter(b(:,1),b(:,2));
title('Sequential Discriminants Estimation 1');
xlabel('X');
ylabel('Y');
legend('Boundary A','Boundary B','A','B');
hold off;
