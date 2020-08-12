function se = RPMobj_ll_quick(betagamma, breaking, P, X)
m = size(breaking, 1);
k = size(X,2);
beta = betagamma(1:k);
gamma = betagamma(end);
se = 0;
long_V = [];
for i = 1: size(P,3)
    E = reweight(P(:,:,i),gamma)*X(:,:,i);
    V = E*beta';
    long_V((i-1)* size(P,3)+1:(i)* size(P,3)) = V;
end
%disp(long_V);
V=long_V;
for i1 = 1:(m-1)
    for i2 = (i1+1):m
        f21=normcdf(V(i2)-V(i1),0,sqrt(2));
        f12=1-f21;
        se=se-breaking(i1,i2)*log(f12)-breaking(i2,i1)*log(f21);
    end
end
end
