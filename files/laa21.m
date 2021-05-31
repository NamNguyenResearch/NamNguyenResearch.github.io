clear

m=100;
n=80;
r=3;
c=4*(1+sqrt(2));
ntrials=1e2;

rng(0)

M=randn(m,r)*randn(r,n);
[Um,~,Vm]=svd(M);
Pu2=Um(:,r+1:end)*Um(:,r+1:end)';
Pv2=Vm(:,r+1:end)*Vm(:,r+1:end)';
M=M/norm(M,'fro');
Sm=svd(M);
sr=Sm(r);
ss=logspace(-6,0,51);

log_err=zeros(length(ss),ntrials);
for i=1:length(ss)
    s=ss(i);
    for t=1:ntrials
        D=randn(m,n)*s;
        Mh=M+D;
        [U,S,V]=svd(Mh);
        PrMh=U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
        L=D-Pu2*D*Pv2;
        log_err(i,t)=norm(PrMh-M,'fro')^2;
    end
end
mean_err=mean(log_err,2)';
order0=m*n*ss.^2;
order1=r*(m+n-r)*ss.^2;
order2=order1+3*(m-r)*(n-r)*sum(1./(Sm(1:r).^2))*ss.^4;
upperbound=(sqrt(r*(m+n-r)) + 4*(1+sqrt(2))/sr*sqrt(m^2*n^2+2*m*n)*ss).^2.*ss.^2;
upperbound2=(sqrt(r*(m+n-r)) + 2*(1+sqrt(2))*sqrt(m*n))^2*ss.^2;
upperbound3=min(upperbound,upperbound2);

p=1.1;
s2=(sqrt(m*n)-sqrt(r*(m+n-r)))*sr/4/(1+sqrt(2))/sqrt(m^2*n^2+2*m*n)
s3=sqrt((p-1)*r*(m+n-r)/3/(m-r)/(n-r)/sum(1./(Sm(1:r).^2)))
s1=sr*(sqrt(p)-1)/4/(1+sqrt(2))/sqrt(m^2*n^2+2*m*n)*sqrt(r*(m+n-r))


figure(1)
loglog(ss,mean_err)
hold on
loglog(ss,order0)
loglog(ss,order1,'-.')
loglog(ss,order2,'-.')
loglog(ss,upperbound3)
plot(s1,r*(m+n-r)*s1^2,'ko')
plot(s2,m*n*s2^2,'ko')
plot(s3,r*(m+n-r)*s3^2,'ko')
text(s1,r*(m+n-r)*s1^2,'\sigma_1','VerticalAlignment','top','HorizontalAlignment','left')
text(s2,m*n*s2^2,'\sigma_2','VerticalAlignment','top','HorizontalAlignment','left')
text(s3,r*(m+n-r)*s3^2,'\sigma_3','VerticalAlignment','top','HorizontalAlignment','left')
hold off
grid on
grid off
grid on
legend('Empirical Average','$E[||\tilde{X}-X||_F^2]$','1st approx.','2nd approx.',...
    'Upper bound', 'Location','best','interpreter','latex')
xlabel('\sigma')
ylabel('$E[||\hat{X}-X||_F^2]$','interpreter','latex')
ylim([1e-10,1e6])
