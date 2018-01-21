format short g
S=100;
K=105;
T=5;
r=0.05;
sig=0.3;
M=20;
dt=T/M;
u=exp(sig*sqrt(dt)+(r-sig^2/2)*dt);
d=exp(-sig*sqrt(dt)+(r-sig^2/2)*dt);
t=[0, 0.5, 1, 1.5, 3, 4.5];
interval=t/dt;
interval=interval+1;

call_price=CRR_call_matrix(S,K,r,M,dt,u,d);
put_price=CRR_put_matrix(S,K,r,M,dt,u,d);
call_matrix=zeros(M+1,length(interval));
put_matrix=zeros(M+1,length(interval));

for i=1:length(interval)
    call_matrix(:,i)=call_price(:,interval(i));
    put_matrix(:,i)=put_price(:,interval(i));
end
disp('call')
call_matrix
disp('put')
put_matrix