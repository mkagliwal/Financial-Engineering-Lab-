function [in_price1,in_price2] = binomial_put(S,K,T,r,sig,M)
    dt=T/M;
    u1=exp(sig*sqrt(dt));
    d1=exp(-sig*sqrt(dt));
    u2=exp(sig*sqrt(dt)+(r-sig^2/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r-sig^2/2)*dt);
    if d1<exp(r*dt) & exp(r*dt)<u1
        p1=(exp(r*dt)-d1)/(u1-d1);
        q1=1-p1;
        for i=1:M+1
            price1(i,M+1)=u1^(M+1-i)*d1^(i-1)*S;
            price1(i,M+1)=max(K-price1(i,M+1),0);
        end
        for i=1:M
            for j=1:M-i+1
                price1(j,M-i+1)=exp(-r*dt)*(p1*price1(j,M-i+2)+q1*price1(j+1,M-i+2));
            end
        end
        in_price1=price1(1,1);
    else
        disp('Arbitrage in set 1')
        in_price1=0;
    end
    if d2<exp(r*dt) & exp(r*dt)<u2
        p2=(exp(r*dt)-d2)/(u2-d2);
        q2=1-p2;
        for i=1:M+1
            price2(i,M+1)=u2^(M+1-i)*d2^(i-1)*S;
            price2(i,M+1)=max(K-price2(i,M+1),0);
        end
        for i=1:M
            for j=1:M-i+1
                price2(j,M-i+1)=exp(-r*dt)*(p2*price2(j,M-i+2)+q2*price2(j+1,M-i+2));
            end
        end
        in_price2=price2(1,1);
    else
        disp('Arbitrage in set 2')
        in_price2=0;
    end
end