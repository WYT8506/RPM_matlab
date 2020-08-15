function data_generator = create_data_generator(data_structure,beta,phi)
data_generator.E_matrixs = zeros(data_structure.number_of_persons,data_structure.number_of_features,data_structure.number_of_questions);
data_generator.E_rum_matrixs = zeros(data_structure.number_of_persons,data_structure.number_of_features,data_structure.number_of_questions);
data_generator.prospect_value_matrix = zeros(data_structure.number_of_questions, data_structure.number_of_persons);
data_generator.rum_prospect_value_matrix = zeros(data_structure.number_of_questions, data_structure.number_of_persons);
data_generator.p_reweighted_matrixs = arrayfun(@(p) p_reweight(p,phi),data_structure.outcome_probabilities_matrixs);

for question_number = 1:data_structure.number_of_questions
    outcome_feature_matrix = data_structure.outcome_feature_matrixs(:,:,question_number);
    p_reweighted_matrix = data_generator.p_reweighted_matrixs(:,:,question_number);
    E_matrix = p_reweighted_matrix*outcome_feature_matrix;
    E_rum_matrix = data_structure.outcome_probabilities_matrixs(:,:,question_number)*outcome_feature_matrix;
    data_generator.E_matrixs(:,:,question_number) = E_matrix;
    data_generator.E_rum_matrixs(:,:,question_number) = E_rum_matrix;
end

for question_number = 1:data_structure.number_of_questions
    data_generator.prospect_value_matrix(question_number,:) = transpose(data_generator.E_matrixs(:,:,question_number)*transpose(beta));
    data_generator.rum_prospect_value_matrix(question_number,:) = transpose(data_generator.E_rum_matrixs(:,:,question_number)*transpose(beta));
end
    
    