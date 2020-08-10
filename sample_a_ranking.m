function ranking = sample_a_ranking(prospect_value_matrix,question_number,sds) 
means = prospect_value_matrix(question_number,:);
sampled_values = zeros(size(means));
for i = 1: size(means,2)
    sampled_values(1,i) = normrnd(means(1,i),sds(1,i));
end
index_value_pairs = [1:size(means,2);sampled_values];
sorted_index_value_pairs = transpose(sortrows(transpose(index_value_pairs),2));
ranking = sorted_index_value_pairs(1,:);
end
   
%sample_a_ranking([,2,3],[1,1,1])