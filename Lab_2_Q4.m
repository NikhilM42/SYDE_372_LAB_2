clc;
clear;

load('lab2_3.mat','a');
load('lab2_3.mat','b');

sizea = size(a);
sizeb = size(b);

gisgood = 1;
g = [];

while gisgood == 1
    rpa = round(rand*sizea(1))+1;
    rpb = round(rand*sizeb(1))+1;
    randoma = a(rpa,:);
    randomb = b(rpb,:);

    j = 0;
    naB = 0;
    nbA = 0;
    
    W = randomb-randoma;
    W0 = 0.5*(randomb*randomb.'-randoma*randoma.');
    %MED
    for z=1:sizea(1)
        ga = W*a(z,:) - W0;
        gb = W*b(z,:) - W0;
        
        if ga>0
            naB = naB + 1;
        end
        if gb<0
            nbA = nbA + 1;
        end
    end
    if naB == 0 && nbA == 0
        gisgood = 0;
        g(end+1) = [W,W0];
        j = j+1;
    end
end

