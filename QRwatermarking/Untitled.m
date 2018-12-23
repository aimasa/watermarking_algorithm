clc
clear
close all

lambda = 0:5e-4:4;%原来是3:4
x = 0.4*ones(1,length(lambda));

N1 = 800;  % 前面的迭代点数(原来是400)
N2 = 200; % 后面的迭代点数（原来是100）

f = zeros(N1+N2,length(lambda));
for i = 1:N1+N2
    x = lambda .* x .* (1 - x);
    f(i,:) = x;
end
f = f(N1+1:end,:);

plot(lambda,f,'k.','MarkerSize',1)
xlabel('\lambda')
ylabel('x');
title('Logistic虫口模型-虫口随着λ的变化')
