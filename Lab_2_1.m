clc;
clear;

load('lab2_1.mat','a');
load('lab2_1.mat','b');

rua = 5;
rsa = 1;
rlambda = 1;

sizea = size(a);
sizeb = size(b);

%% Maximum likelihood method
%% Parametric Estimation - Gaussian
%data set a
ua = (1/sizea(2))*sum(a,2);
sa = cov(a);
figure(1);
Xa = min(a):((max(a)-min(a))/sizea(2)):max(a);
Ya = normpdf(Xa,ua,sa);
Yar = normpdf(Xa,rua,rsa);
hold on;
plot(Xa,Ya,Xa,Yar,[ua ; ua],[0 ; 0.5],[rua ; rua],[0 ; 0.5]);
title('Parametric Estimation - Gaussian - A');
legend('Estimate','Real','Estimate Mean','Real Mean');
xlabel('Value');
ylabel('Probability');
hold off;

%data set b
ub = (1/sizeb(2))*sum(b,2);
sb = cov(b);
figure(2);
Xb = min(b):((max(b)-min(b))/sizeb(2)):max(b);
Yb = normpdf(Xb,ub,sb);
Ybr = exppdf(Xb,rlambda);
hold on;
plot(Xb,Yb,Xb,Ybr,[ub ; ub],[0 ; 0.5],[rlambda ; rlambda],[0 ; 0.5]);
title('Parametric Estimation - Gaussian - B');
legend('Estimate','Real','Estimate Mean','Real Mean');
xlabel('Value');
ylabel('Probability');
hold off;

%% Parametric Estimation - Exponential
%data set a
lambdaa = 1/((1/sizea(2))*sum(a,2));
figure(3);
Xa2 = min(a):((max(a)-min(a))/sizea(2)):max(a);
Ya2 = exppdf(Xa2,lambdaa);
Yar2 = normpdf(Xa2,rua,rsa);
hold on;
subplot(2,1,1);
plot(Xa2,Ya2,[lambdaa ; lambdaa],[0 ; 0.0000045]);
title('Parametric Estimation - Exponential - A');
legend('Estimate','Estimate Mean');
ylabel('Probability');
subplot(2,1,2);
plot(Xa2,Yar2,[rua ; rua],[0 ; 0.5]);
legend('Real','Real Mean');
xlabel('Value');
ylabel('Probability');
hold off;

%data set b
lambdab = 1/((1/sizeb(2))*sum(b,2));
figure(4);
Xb2 = min(b):((max(b)-min(b))/sizeb(2)):max(b);
Yb2 = exppdf(Xb2,lambdab);
Ybr2 = exppdf(Xb,rlambda);
hold on;
plot(Xb2,Yb2,Xb2,Ybr2,[lambdab ; lambdab],[0 ; 0.5],[rlambda ; rlambda],[0 ; 0.5]);
title('Parametric Estimation - Exponential - B');
legend('Estimate','Real','Estimate Mean','Real Mean');
xlabel('Value');
ylabel('Probability');
hold off;

%% Paramteric Estimation - Uniform
b = max(b);
a = min(b);






