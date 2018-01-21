format short g
K=50:150;
M=100;
T=1;
r=0.08;
sig=0.2;
S=100;

call_1=[];
call_2=[];
put_1=[];
put_2=[];

for i=1:length(K)
    [call_1(i),call_2(i)]=binomial_call(S,K(i),T,r,sig,M);
    [put_1(i),put_2(i)]=binomial_put(S,K(i),T,r,sig,M);
end

figure(1)
subplot(2,1,1)
plot(K,call_1);
title('Call option price vs K (set 1)')
xlabel('K')
ylabel('Call price at t=0')
subplot(2,1,2)
plot(K,put_1);
title('Put option price vs K (set 1)')
xlabel('K')
ylabel('Put price at t=0')

figure(2)
subplot(2,1,1)
plot(K,call_2);
title('Call option price vs K (set 2)')
xlabel('K')
ylabel('Call price at t=0')
subplot(2,1,2)
plot(K,put_1);
title('Put option price vs K (set 2)')
xlabel('K')
ylabel('Put price at t=0')



