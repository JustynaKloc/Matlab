A=importdata('dane.csv');
X=A(:,1);
Y=A(:,2);
subplot(2,1,1)
[b0,b1]=regresja1210(X,Y);
ys=b0+b1*X;
Yr=Y-ys;
subplot(2,1,2)
plot(Yr,'o');hold on
ylim([-300,400])
for k = 0.05:0.05:0.45
    q1=quantile(Yr,k);
    q99=quantile(Yr,1-k);
    qq=1:length(Yr);
    Ypow=Yr(Yr>q99);
    Ypon=Yr(Yr<q1);
    I=find(Yr<q1|Yr>q99);
    hold off
    subplot(2,1,1)
    plot(X(I),Y(I),'ro');hold on
    I1=find(Yr>q1&Yr<q99);
    regresja1210(X(I1),Y(I1))
    subplot(2,1,2)
    ys=b0+b1*X;
    Yr=Y-ys;
    subplot(2,1,2)
    plot(Yr,'o');hold on
    ylim([-300,400])
    q1=quantile(Yr,k);
    q99=quantile(Yr,1-k);
    qq=1:length(Yr);
    plot(qq,q1*ones(1,length(qq)),'r')
    plot(qq,q99*ones(1,length(qq)),'r')
    Ypow=Yr(Yr>q99);
    plot(qq(Yr>q99),Ypow,'ro')
    Ypon=Yr(Yr<q1);
    plot(qq(Yr<q1),Ypon,'ro')
    I=find(Yr<q1|Yr>q99);
    getframe();
    pause(1)
end