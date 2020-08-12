%get likelihood of a ranking
%f3([1,2,3],[1,1,1],1,10,-10,0.1)
%f([],[1,2,3],[1,1,1],1,10,-10,0.1,3,3)

%get_likelihood example
hist = containers.Map;
hist("231") = 3;
hist("123") = 1;
prospect_values = [1,1,1];
get_likelihood(hist,prospect_values,1,10,-10,0.1)

%acm example
preference_profiles = [];
preference_profiles(1,:) = [123,213,123,123];
preference_profiles(2,:) = [132,231,231,123];

breaking = create_breaking(preference_profiles);
prospect_matrix = [3,2,1;2,2,2];
AIC(preference_profiles,4,prospect_matrix,1,10,-10,0.1)





