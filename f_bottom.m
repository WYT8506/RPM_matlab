function result = f_bottom(values,ranking,prospect_values,sd)
result = 1;
for i = 1:size(values,2)
     result = result*normpdf(values(1,i),prospect_values(1,ranking(1,i)),sd);
end