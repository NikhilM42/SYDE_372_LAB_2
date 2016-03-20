clc;
clear;

load('lab2_1.mat','a');
load('lab2_1.mat','b');

rua = 5;
rsa = 1;
lambda = 1;

sizea = size(a);
sizeb = size(b);

%% Parametric Estimation - Gaussian
%Maximum likelihood method
%mean
    %set a
    ua = (1/sizea(2))*sum(a,2);

%variance
    %set a
    sa = cov(a);

figure(1);
Xa = min(a):((max(a)-min(a))/sizea(2)):max(a);
Ya = normpdf(Xa,ua,sa);
Yar = normpdf(Xa,rua,rsa);
hold on;
plot(Xa,Ya,Xa,Yar,[ua ; ua],[0 ; 0.5],[rua ; rua],[0 ; 0.5]);
title('Parametric Estimation - Gaussian');
legend('Estimate','Real','Estimate Mean','Real Mean');
hold off;

rlambda = 1/((1/sizeb(2))*sum(b,2));
figure(2);
Xb = min(b):((max(b)-min(b))/sizeb(2)):max(b);
Yb = exppdf(Xb,lambda);
Ybr = exppdf(Xb,rlambda);
hold on;
plot(Xb,Yb,Xb,Ybr,[lambda ; lambda],[0 ; 0.5],[rlambda ; rlambda],[0 ; 0.5]);
title('Parametric Estimation - Exponential');
legend('Estimate','Real','Estimate Mean','Real Mean');
hold off;
