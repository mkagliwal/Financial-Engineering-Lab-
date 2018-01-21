function in_price = path_dependent_call(S,K,T,r,sig,M)
    dt=T/M;
    u=exp(sig*sqrt(dt));
    d=exp(-sig*sqrt(dt));
    p=(exp(r*dt)-d)/(u-d);
    q=1-p;
    price(1,1)=S;
    if d<exp(r*dt) & exp(r*dt)<u
        for j=2:M+1
            for i=1:2:(2^(j-1))-1
               price(i,j)=price((i+1)/2,j-1)*u;
               price(i+1,j)=price((i+1)/2,j-1)*d;
            end
        end
        for i=1:2^M
            new=i;
            avg=0;
            for j=M+1:-1:1
                avg=avg+price(new,j);
                new=ceil(new/2);
            end
            avg=avg/(M+1);
            price(i,M+1)=max(avg-K,0);
        end
        for j=M:-1:1
            for i=1:2^(j-1)
                price(i,j)=exp(-r*dt)*(p*price(2*i-1,j+1)+q*price(2*i,j+1));
            end
        end
        in_price=price(1,1);
    else
        disp('Arbitarage opportunity')
        in_price=NaN;
    end
end

