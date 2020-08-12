function se = RPMobj_ll(betagamma, breaking, P, X)
m = size(breaking, 1);
beta = betagamma(1:size(betagamma,2)-1);
gamma = betagamma(end);

se = 0;
E = (reweight(P,gamma)*X);
number_of_questions = size(E,2)/size(beta,2);
new_beta = zeros(1,number_of_questions*size(beta,2));
for i = 1:number_of_questions
    new_beta(size(beta,2)*(i-1)+1:size(beta,2)*(i)) = beta;
V = E*new_beta';

for i1 = 1:(m-1)
    for i2 = (i1+1):m
        f21=normcdf(V(i2)-V(i1),0,sqrt(2));
        f12=1-f21;
        se=se-breaking(i1,i2)*log(f12)-breaking(i2,i1)*log(f21);
    end
end
end
