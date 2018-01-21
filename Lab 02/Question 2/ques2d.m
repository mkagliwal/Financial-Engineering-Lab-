format short g
K=100;
M=10;
T=1;
r=0.08;
sig=0.01:0.01:1;
S=100;

call=[];

for i=1:length(sig)
    call(i)=path_dependent_call(S,K,T,r,sig(i),M);
end

figure(1)
plot(sig,call);
title('Asian call option price vs sigma (set 1)')
xlabel('sigma')
ylabel('Asian call option price at t=0')
saveas(gcf,'2d.png')
