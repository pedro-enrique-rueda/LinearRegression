function [r2] = LinRegress(x,y)

    [n,m] = size(x);
    st = 0;
    sr = 0;
    
    a = (m*sum(x.*y) - sum(x)*sum(y)) / (m*sum(x.^2) - sum(x)^2);
    ymed = sum(y) / m;
    xmed = sum(x)/m;

    b = ymed - a*xmed;
    yfin = a*x + b;
        
    for i = 1:n
        st = st + (y(i) - ymed).^2;
        sr = sr + (y(i) - a*x(i) - b).^2;
    end
    
    r2 = (st - sr) / st;
    
    figure()  
    plot(x,yfin)
    hold on
    plot(x,y,'ob')
    
end