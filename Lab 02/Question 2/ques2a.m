format short g
K=100;
M=10;
T=1;
r=0.08;
sig=0.2;
S=50:150;

call=[];

for i=1:length(S)
    call(i)=path_dependent_call(S(i),K,T,r,sig,M);
end

figure(1)
plot(S,call);
title('Asian call option price vs S0 (set 1)')
xlabel('S0')
ylabel('Asian call option price at t=0')
saveas(gcf,'2a.png')
