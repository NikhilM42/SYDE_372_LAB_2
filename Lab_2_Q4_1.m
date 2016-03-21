clc;
clear;

load('lab2_3.mat','a');
load('lab2_3.mat','b');

hold on;
scatter(a(:,1),a(:,2));
scatter(b(:,1),b(:,2));
hold off;

points = 1;
g = [];
naBj = [];
nbAj = [];
maxj = 0;
while points == 1
    sizea = size(a);
    sizeb = size(b);
    rpa = round(rand*sizea(1))+1;
    rpb = round(rand*sizeb(1))+1;
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
        gb = W*b(z,:)' - W0;
        
        if ga>0
            naB = naB + 1;
        else
            ta(end+1,:) = a(z,:);
        end
        if gb<0
            nbA = nbA + 1;
        else
            tb(end+1,:) = b(z,:);
        end
    end
    if ( naB == 0 || nbA == 0 )
        g(end+1) = [W,W0];
        naBj(end+1) = naB;
        nbAj(end+1) = nbA;
        maxj = maxj + 1;
    end
    if( naB == 0)
        a = ta;
    end
    if( nbA == 0)
        b = tb;
    end
    tempsizea = size(a);
    tempsizeb = size(b);
    if(tempsizea(1) > 0 && tempsizeb(1) > 0)
        points = 0;
    end
end

for j = 1:maxj
    for z=1:sizea(1)
        gtesta = g(j,1)*a(z,:) - g(j,2);
        gtestb = g(j,1)*b(z,:) - g(j,2);

        if (gtesta < 0 && nbAj(j) == 0)
            
        end
    end
end



