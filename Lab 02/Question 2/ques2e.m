format short g
K2=100;
K1=95;
K3=105;
M=1:10;
T=1;
r=0.08;
sig=0.2;
S=100;

call1=[];
call2=[];
call3=[];

for i=1:length(M)
    call1(i)=path_dependent_call(S,K1,T,r,sig,M(i));
    call2(i)=path_dependent_call(S,K2,T,r,sig,M(i));
    call3(i)=path_dependent_call(S,K3,T,r,sig,M(i));
end

figure(1)
plot(M,call1,'r');
hold on
plot(M,call2,'g');
hold on
plot(M,call3,'b');
title('Asian call option price vs M (set 1)')
xlabel('M')
ylabel('Asian call option price at t=0')
legend('K=95','K=100','K=105')
saveas(gcf,'2e.png')
