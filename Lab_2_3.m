clc;
clear;

load('lab2_1.mat','a');
load('lab2_1.mat','b');

rua = 5;
rsa = 1;
lambda = 1;

sizea = size(a);
sizeb = size(b);

    %% Part 2.3a
 
figure(3);
uc_a = (max(a)+min(a))/2;
Xc_a = min(a):((max(a)-min(a))/sizea(2)):max(a);
Yc_a = unifpdf(Xc_a,min(a),max(a));
Yc_ar = normpdf(Xc_a,rua,rsa);
hold on;
plot(Xc_a,Yc_a,Xc_a,Yc_ar,[uc_a ; uc_a],[0 ; 0.5],[rua ; rua],[0 ; 0.5]);
title('Parametric Estimation - Uniform (Part A)');
legend('Estimate','Real','Estimate Mean','Real Mean');
hold off;

    %% Part 2.3b
 
figure(4);
uc_b = (max(b)+min(b))/2;
Xc_b = min(b):((max(b)-min(b))/sizea(2)):max(b);
rlambda = 1/((1/sizeb(2))*sum(b,2));
Xb = min(b):((max(b)-min(b))/sizeb(2)):max(b);
Yc_b = unifpdf(Xc_b,min(b),max(b));
Yc_br = exppdf(Xb,rlambda);
hold on;
plot(Xc_b,Yc_b,Xc_b,Yc_br,[uc_b ; uc_b],[0 ; 0.5],[rlambda ; rlambda],[0 ; 0.5]);
title('Parametric Estimation - Uniform (Part B)');
legend('Estimate','Real','Estimate Mean','Real Mean');
hold off;