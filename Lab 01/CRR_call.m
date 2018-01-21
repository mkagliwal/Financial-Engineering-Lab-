function in_price = CRR_call(S,K,T,r,sig,M)
    dt=T/M;
    u=exp(sig*sqrt(dt)+(r-sig^2/2)*dt);
    d=exp(-sig*sqrt(dt)+(r-sig^2/2)*dt);
    if d<exp(r*dt) & exp(r*dt)<u
        p=(exp(r*dt)-d)/(u-d);
        q=1-p;
        for i=1:M+1
            price(i,M+1)=u^(M+1-i)*d^(i-1)*S;
            price(i,M+1)=max(price(i,M+1)-K,0);
        end
        for i=1:M
            for j=1:M-i+1
                price(j,M-i+1)=exp(-r*dt)*(p*price(j,M-i+2)+q*price(j+1,M-i+2));
            end
        end
        in_price=price(1,1);
    else
        disp('Arbitrage')
        in_price=0;
    end
end
        
            
        
        