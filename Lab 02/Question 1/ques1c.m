format short g
K=100;
M=100;
T=1;
r=0.01:0.001:1;
sig=0.2;
S=100;

call_1=[];
call_2=[];
put_1=[];
put_2=[];

for i=1:length(r)
    [call_1(i),call_2(i)]=binomial_call(S,K,T,r(i),sig,M);
    [put_1(i),put_2(i)]=binomial_put(S,K,T,r(i),sig,M);
end

figure(1)
subplot(2,1,1)
plot(r,call_1);
title('Call option price vs r (set 1)')
xlabel('r')
ylabel('Call price at t=0')
subplot(2,1,2)
plot(r,put_1);
title('Put option price vs r (set 1)')
xlabel('r')
ylabel('Put price at t=0')

figure(2)
subplot(2,1,1)
plot(r,call_2);
title('Call option price vs r (set 2)')
xlabel('r')
ylabel('Call price at t=0')
subplot(2,1,2)
plot(r,put_1);
title('Put option price vs r (set 2)')
xlabel('r')
ylabel('Put price at t=0')



