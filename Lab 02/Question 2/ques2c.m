format short g
K=100;
M=10;
T=1;
r=0.01:0.01:1;
sig=0.2;
S=100;

call=[];

for i=1:length(r)
    call(i)=path_dependent_call(S,K,T,r(i),sig,M);
end

figure(1)
plot(r,call);
title('Asian call option price vs r (set 1)')
xlabel('r')
ylabel('Asian call option price at t=0')
saveas(gcf,'2c.png')
