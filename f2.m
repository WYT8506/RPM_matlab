function result = f2(x3,ranking,prospect_values,sd,upper,interval)
X = x3:interval:upper;
Y =  arrayfun(@(x) f1(x,x3,ranking,prospect_values,sd,upper,interval),X);
if size(X,2) ==1
    result = 0;
else
    result = trapz(X,Y);
end

end