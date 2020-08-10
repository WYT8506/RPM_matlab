function result = f1(x2,x3,ranking,prospect_values,sd,upper,interval)
X = x2:interval:upper;
Y = arrayfun(@(x) f0(x,x2,x3,ranking,prospect_values,sd),X); 
if size(X,2) ==1
    result = 0;
else
    result = trapz(X,Y);
end
end