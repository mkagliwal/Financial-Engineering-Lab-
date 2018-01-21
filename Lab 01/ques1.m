format short g
S=100;
K=105;
T=5;
r=0.05;
sig=0.3;
M=[1; 5; 10; 20; 50; 100; 200; 400];
n=length(M);
for i=1:n
    M(i,2)=CRR_call(S,K,T,r,sig,M(i));
    M(i,3)=CRR_put(S,K,T,r,sig,M(i));
end
disp(M)
