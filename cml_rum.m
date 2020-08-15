function beta = cml_rum( breaking, P, X,k)
%data must be 1-based, namely the alternatives are 1,2,3,4,5,6
%optimization
%x0 = 5*rand(1, m);
lb = [-100*ones(1, k)];
ub = [100*ones(1, k)];
beta0 = rand(1, k);
 
options = optimoptions('fmincon','MaxFunctionEvaluations',36000);
beta = fmincon(@(beta) RUMobj_ll_quick(beta, breaking, P, X),beta0,[],[],[],[],lb,ub,[],options);
end