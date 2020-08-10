function reweighted_p = p_reweight(p,phi)
gamma = phi(1,1);
reweighted_p = p^gamma/((p^gamma+(1-p)^gamma)^(1/gamma));

