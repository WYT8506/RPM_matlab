function result = f(values,ranking,prospect_values,sd,upper,lower,interval,current_layer,total_layers)
X = [];

if current_layer == total_layers
    X = lower:interval:upper;
else
    X = values(1,1):interval:upper;
end

%disp(current_layer)
%disp(X)

if current_layer == 1
    Y = arrayfun(@(x) f_bottom([x,values],ranking,prospect_values,sd),X); 
else
    Y = arrayfun(@(x) f([x,values],ranking,prospect_values,sd,upper,lower,interval,current_layer-1,total_layers),X);
end
if size(X,2) ==1
    result = 0;
else
    result = trapz(X,Y);
end
end