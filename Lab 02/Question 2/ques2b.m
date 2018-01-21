format short g
K=50:150;
M=10;
T=1;
r=0.08;
sig=0.2;
S=100;

call=[];

for i=1:length(K)
    call(i)=path_dependent_call(S,K(i),T,r,sig,M);
end

figure(1)
plot(K,call);
title('Asian call option price vs K (set 1)')
xlabel('K')
ylabel('Asian call option price at t=0')
saveas(gcf,'2b.png')
