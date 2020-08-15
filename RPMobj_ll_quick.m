function se = RPMobj_ll_quick(betagamma, breaking, P, X)
disp(betagamma);
m = size(breaking, 1);
k = size(X,2);
beta = betagamma(1:k);
gamma = betagamma(end);
se = 0;
long_V = [];
for i = 1: size(P,3)
    E = reweight(P(:,:,i),gamma)*X(:,:,i);
    V = E*beta';
    long_V((i-1)* size(P,1)+1:(i)* size(P,1)) = V;
end
V=long_V;
for i1 = 1:(m-1)
    for i2 = (i1+1):m
        %disp(V(i2));
        %disp(V(i1));
        f21=normcdf(V(i2)-V(i1),0,sqrt(2));
        f12=1-f21;
        if f12 == 0
            f12 = 1e-15;
        end
        if f21 == 0
            f21 = 1e-15;
        end
        %disp(f12)
        %disp(f21)
        se=se-breaking(i1,i2)*log(f12)-breaking(i2,i1)*log(f21);
    end
end
disp(se)
end
