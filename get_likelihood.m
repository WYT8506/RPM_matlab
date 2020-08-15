function log_likelihood = get_likelihood(hist,prospect_values,sd,upper,lower,interval)
log_likelihood = 0;
keys = str2double(hist.keys());
values = cell2mat(hist.values());
for i = 1:size(keys,2)
    ranking = keys(i);
    ranking = dec2base(ranking,10) - '0';
    frequency = values(i);
    %likelihood = likelihood*f3(ranking,prospect_values,sd,upper,lower,interval)^frequency;
    log_likelihood = log_likelihood+log(f([],ranking,prospect_values,sd,upper,lower,interval,size(ranking,2),size(ranking,2)))*frequency;
end

    