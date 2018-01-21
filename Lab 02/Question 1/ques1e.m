format short g
K2=100;
K1=95;
K3=105;
M=50:150;
T=1;
r=0.08;
sig=0.2;
S=100;

call_11=[];
call_12=[];
call_13=[];
call_21=[];
call_22=[];
call_23=[];
put_11=[];
put_12=[];
put_13=[];
put_21=[];
put_22=[];
put_23=[];

for i=1:length(M)
    [call_11(i),call_21(i)]=binomial_call(S,K1,T,r,sig,M(i));
    [put_11(i),put_21(i)]=binomial_put(S,K1,T,r,sig,M(i));
    [call_12(i),call_22(i)]=binomial_call(S,K2,T,r,sig,M(i));
    [put_12(i),put_22(i)]=binomial_put(S,K2,T,r,sig,M(i));
    [call_13(i),call_23(i)]=binomial_call(S,K3,T,r,sig,M(i));
    [put_13(i),put_23(i)]=binomial_put(S,K3,T,r,sig,M(i));
end

figure(1)
subplot(2,1,1)
plot(M,call_11,'b');
hold on
plot(M,call_12,'r');
hold on
plot(M,call_13,'g');
title('Call option price vs M (set 1)')
xlabel('M')
ylabel('Call price at t=0')
legend('K=95','K=100','K=105')
subplot(2,1,2)
plot(M,put_11,'b');
hold on
plot(M,put_12,'r');
hold on
plot(M,put_13,'g');
title('Put option price vs M (set 1)')
xlabel('M')
ylabel('Put price at t=0')
legend('K=95','K=100','K=105')

figure(2)
subplot(2,1,1)
plot(M,call_21,'b');
hold on
plot(M,call_22,'r');
hold on
plot(M,call_23,'g');
title('Call option price vs M (set 2)')
xlabel('M')
ylabel('Call price at t=0')
legend('K=95','K=100','K=105')
subplot(2,1,2)
plot(M,put_21,'b');
hold on
plot(M,put_22,'r');
hold on
plot(M,put_23,'g');
title('Put option price vs M (set 2)')
xlabel('M')
ylabel('Put price at t=0')
legend('K=95','K=100','K=105')


