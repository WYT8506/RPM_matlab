function result = f3(ranking,prospect_values,sd,upper,lower,interval)
X = lower:interval:upper;
Y = arrayfun(@(x) f2(x,ranking,prospect_values,sd,upper,interval),X);
if size(X,2) ==1
    result = 0;
else
    result = trapz(X,Y);
end
end