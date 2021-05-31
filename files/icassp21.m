%%% Local convergence of GD for minimizing
%   f(X) = 1/4* || P_S(X*X^T - M) ||_F^2

clear

n=20;
r=3;
p=.7;   % sampling rate

% transpose matrix
T=eye(n^2);
Idp=reshape(1:n^2,n,n)';
idp=Idp(:);
T=T(idp,:);

% rng(0);
Xs=randn(n,r);
M=Xs*Xs';
[V,D]=eig(M);
[d,id]=sort(diag(D),'desc');
V=V(:,id);
d(1:r)=sort(randi(n,r,1),'desc');
d(r+1:end)=0;
V1=V(:,1:r);
V2=V(:,r+1:n);
PV2=V2*V2';
Xs=V1*diag(sqrt(d(1:r)));
M=Xs*Xs';
eta=1/2/norm(M);

% sampling set (symmetric)
R=triu(rand(n));
R=R>(1-p);
R=R+R';
R=R>0;
S=find(R);
Sc=find(~R);
Sm=eye(n^2);
Sm=Sm(S,:);

% rate
MM=kron(M,eye(n))+kron(eye(n),M);
P1=(eye(n^2)-kron(PV2,PV2));
P2=(eye(n^2)+T)/2;
P=P1*P2;
A=eye(n^2)-eta*MM*(Sm'*Sm);
H=P*A*P;
% rhoA=max(abs(eig(A)));
rho=max(abs(eig(H)));

% init
X0=Xs+1e-2*randn(n,r);

% GD
niters=3e3;
X=X0;
E=X*X'-M;
log_e=zeros(niters,3);
e=E(:);
e2=e;
for i=1:niters
    E=X*X'-M;
    e=H*e;
    e2=A*e2;
    
    log_e(i,1)=norm(E,'fro');
    log_e(i,2)=norm(e);
    log_e(i,3)=norm(e2);
    
    E(Sc)=0;    
    df=E*X;
    X=X-eta*df;
    
end

figure(1)
semilogy(log_e(:,1),'b--^', 'LineWidth', 2,'MarkerIndices',1:200:length(log_e(:,1)),'MarkerSize',10)
hold on
semilogy(log_e(:,3),'k-s', 'LineWidth', 2,'MarkerIndices',1:200:length(log_e(:,3)),'MarkerSize',10)
semilogy(log_e(:,2),'r:o', 'LineWidth', 2,'MarkerIndices',100:200:length(log_e(:,2)),'MarkerSize',10)
semilogy(log_e(1,1)*rho.^(1:niters),'g-.', 'LineWidth', 3)
hold off
ylim([1e-12,1e0])
xlabel('$k$','interpreter','latex')
legend('$||E^k||_F$','$||A^k e^0||_2$','$||H^k e^0||_2$','$||e^0||_2 \rho(H)^k$',...
    'interpreter','latex','location','best')
grid on
grid off
grid on


















