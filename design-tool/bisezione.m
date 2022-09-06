function x = bisezione(y,p,num_it,xl,xu)
delta=10;
j=1;
while j< num_it
    if(delta>0.3)
        x= 0.5*(xl+xu);
        y_=p.a*exp(p.b*x)+p.c*(exp(p.d*x));
        if(y_<y)
            xu=x;
        else
            xl=x;
        end
        delta=abs(y-y_)/(y)*100;
        j=j+1;
    else
        j=num_it+1;
    
    end
end
end

