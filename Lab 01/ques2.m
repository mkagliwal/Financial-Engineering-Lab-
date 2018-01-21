format short g
S=100;
K=105;
T=5;
r=0.05;
sig=0.3;
M=1:400;
M=M';
N=1:5:400;
N=N';
call_1=[];
put_1=[];
call_5=[];
put_5=[];
for i=1:length(M)
    call_1(i)=CRR_call(S,K,T,r,sig,M(i));
    put_1(i)=CRR_put(S,K,T,r,sig,M(i));
end
for i=1:length(N)
    call_5(i)=CRR_call(S,K,T,r,sig,N(i));
    put_5(i)=CRR_put(S,K,T,r,sig,N(i));
end

figure(1);
plot(M',call_1);
title('Call option price vs M (1 step)')
xlabel('M')
ylabel('Call option price at t=0')
saveas(gcf,'a.png')

figure(2);
plot(M',put_1);
title('Put option price vs M (1 step)')
xlabel('M')
ylabel('Put option price at t=0')

figure(3);
plot(N',call_5);
title('Call option price vs M (5 steps)')
xlabel('M')
ylabel('Call option price at t=0')

figure(4);
plot(N',put_5);
title('Put option price vs M (5 steps)')
xlabel('M')
ylabel('Put option price at t=0')