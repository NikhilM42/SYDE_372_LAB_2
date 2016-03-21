clc;
clear;

load('lab2_1.mat','a');
load('lab2_1.mat','b');

sizea = size(a);
sizeb = size(b);

h1 = 0.1;
h2 = 0.4;

%% Parzen for a with h = 0.1
figure(1);
% real part
rua = 5;
rsa = 1;
Xa = min(a):((max(a)-min(a))/sizea(2)):max(a);
Yar = normpdf(Xa,rua,rsa);

ua = sum(a)/sizea(2);
[f, xi] = ksdensity(a, 'width', h1);
hold on;
plot(xi,f,Xa,Yar,[ua ; ua],[0 ; 0.5],[rua ; rua],[0 ; 0.5]);
title('Non-Parametric Estimation - Parzen Method (samples a, h=0.1)');
legend('Estimate','Real','Estimate Mean','Real Mean');
hold off;

%% Parzen with h = 0.4
figure(2);
[f, xi] = ksdensity(a, 'width', h2);
hold on;
plot(xi,f,Xa,Yar,[ua ; ua],[0 ; 0.5],[rua ; rua],[0 ; 0.5]);
title('Non-Parametric Estimation - Parzen Method (samples a, h=0.4)');
legend('Estimate','Real','Estimate Mean','Real Mean');
hold off;

%% Parzen for b with h = 0.1
figure(3);
% real part
rlambda = 1/((1/sizeb(2))*sum(b,2));
Xb = min(b):((max(b)-min(b))/sizeb(2)):max(b);
Ybr = exppdf(Xb,rlambda);

ub = sum(b)/sizeb(2);
[f, xi] = ksdensity(b, 'width', h1);
hold on;
plot(xi,f,Xb,Ybr,[ub ; ub],[0 ; 0.5],[rlambda ; rlambda],[0 ; 0.5]);
title('Non-Parametric Estimation - Parzen Method (samples b, h=0.1)');
legend('Estimate','Real','Estimate Mean','Real Mean');
hold off;

%% Parzen with h = 0.4
figure(4);
[f, xi] = ksdensity(b, 'width', h2);
hold on;
plot(xi,f,Xb,Ybr,[ub ; ub],[0 ; 0.5],[rlambda ; rlambda],[0 ; 0.5]);
title('Non-Parametric Estimation - Parzen Method (samples b, h=0.4)');
legend('Estimate','Real','Estimate Mean','Real Mean');
hold off;