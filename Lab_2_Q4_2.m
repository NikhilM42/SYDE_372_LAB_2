clc;
clear;

avge = [];
mine = [];
maxe = [];
stda = [];
for w=1:5
    
    error = [];

    for v=1:20
        load('lab2_3.mat','a');
        load('lab2_3.mat','b');

        points = 1;
        gw = [];
        gw0 = [];
        naBj = [];
        nbAj = [];
        maxj = 0;
        while maxj < w
            sizea = size(a);
            sizeb = size(b);
            rpa = round(rand*sizea(1))+1;
            rpb = round(rand*sizeb(1))+1;
            if rpb>sizeb(1)
                rpb = sizeb(1);
            elseif rpb == 0
                rpb =1;
            end
            if rpa>sizea(1)
                rpa = sizea(1);
            elseif rpa == 0
                rpa = 1;
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

        load('lab2_3.mat','a');
        load('lab2_3.mat','b');
        sizea = size(a);
        sizeb = size(b);
        ca = 0;
        wa = 0;
        cb = 0;
        wb = 0;
        for z=1:1:sizea(1)
            for j = 1:maxj
                gtest = gw(j,:)*a(z,:)' - gw0(j);
                if (gtest < 0 && nbAj(j) == 0)
                    ca = ca +1;
                elseif (gtest > 0 && naBj(j) == 0)
                    wa = wa +1;
                else
                    wa = wa +1;
                end
            end
        end
        for z=1:1:sizeb(1)
            for j = 1:maxj
                gtest = gw(j,:)*b(z,:)' - gw0(j);
                if (gtest < 0 && nbAj(j) == 0)
                    wb = wb +1;
                elseif (gtest > 0 && naBj(j) == 0)
                    cb = cb +1;
                else
                    wb = wb +1;
                end
            end
        end

        error(end+1) = (wa+wb)/(ca+wa+cb+wb);
    end

    avge(end+1) = mean(error);
    mine(end+1) = min(error);
    maxe(end+1) = max(error);
    stda(end+1) = std(error);
end
hold on;
J = 1:1:5;
plot(J,avge,J,mine,J,maxe,J,stda);
title('Error Rates Versus Number of Discriminants');
xlabel('J');
ylabel('Error Rate');
legend('Average','Minimum','Maximum','Standard Deviation');
hold off;
