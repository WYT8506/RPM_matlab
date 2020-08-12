function beta = cml_rpm( breaking, P, X,k)
%data must be 1-based, namely the alternatives are 1,2,3,4,5,6
%optimization
%x0 = 5*rand(1, m);
lb = [-100*ones(1, k), 0];
ub = [100*ones(1, k), 1;];
betagamma0 = rand(1, k+1);
 
options = optimoptions('fmincon','MaxFunctionEvaluations',36000);
beta = fmincon(@(betagamma) RPMobj_ll(betagamma, breaking, P, X),betagamma0,[],[],[],[],lb,ub,[],options);
end