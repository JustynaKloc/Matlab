function [b0,b1]=regresja1210(X,Y)
%plot(X,Y,'ko');hold on;
n=length(X);
b1=(sum(X.*Y)-n*mean(X)*mean(Y))/(sum(X.^2)-n*mean(X)^2);
b0=mean(Y)-b1*mean(X);
t=linspace(min(X),max(X),10^3);
plot(t,b0+b1*t,'r')
