function y = reweight(p,gamma)
    y = p.^gamma./(p.^gamma+(1-p).^gamma).^(1/gamma);
end