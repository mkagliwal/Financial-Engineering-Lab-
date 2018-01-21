format short g
K=100;
M=100;
T=1;
r=0.08;
sig=0.2;
S=50:150;

call_1=[];
call_2=[];
put_1=[];
put_2=[];

for i=1:length(S)
    [call_1(i),call_2(i)]=binomial_call(S(i),K,T,r,sig,M);
    [put_1(i),put_2(i)]=binomial_put(S(i),K,T,r,sig,M);
end

figure(1)
subplot(2,1,1)
plot(S,call_1);
title('Call option price vs S0 (set 1)')
xlabel('S0')
ylabel('Call option price at t=0')
subplot(2,1,2)
plot(S,put_1);
title('Put option price vs S0 (set 1)')
xlabel('S0')
ylabel('Put option price at t=0')

figure(2)
subplot(2,1,1)
plot(S,call_2);
title('Call option price vs S0 (set 2)')
xlabel('S0')
ylabel('Call option price at t=0')
subplot(2,1,2)
plot(S,put_1);
title('Put option price vs S0 (set 2)')
xlabel('S0')
ylabel('Put option price at t=0')







