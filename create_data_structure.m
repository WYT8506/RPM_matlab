
function ds = create_data_structure(person_matrix)
ds.person_matrix = person_matrix;
ds.number_of_questions = size(person_matrix,1);
ds.number_of_persons = size(person_matrix,2);
ds.number_of_features = size(person_matrix(1,1).feature_values,2);
ds.outcomes = dec2bin(0:+1:2^ds.number_of_persons-1)-'0';

%create outcome_feature_matrixes
for i1 = 1: ds.number_of_questions
    outcome_feature_matrix = zeros(size(ds.outcomes,1),ds.number_of_features);
    for i2 = 1: size(ds.outcomes,1)
        outcome = ds.outcomes(i2,:);
        feature_vector = zeros(size(person_matrix(1,1).feature_values));
        for i3 = 1:size(ds.outcomes,2)
            if outcome(i3) == 1
                feature_vector = feature_vector + person_matrix(i1,i3).feature_values;
            end
        end
        outcome_feature_matrix(i2,:) = feature_vector;
    end
    ds.outcome_feature_matrixs(:,:,i1) = outcome_feature_matrix;
end

for question_number = 1: ds.number_of_questions
    outcome_probabilities_matrix = zeros(ds.number_of_persons,size(ds.outcomes,1));
    for lottery_number = 1: ds.number_of_persons
        outcome_probabilities = zeros(1,size(ds.outcomes,1));
        for outcome_number = 1:size(ds.outcomes,1)
            outcome = ds.outcomes(outcome_number,:);
            P = 1;
            for i = 1:size(ds.outcomes,2)
                if i == lottery_number
                    if outcome(i) == 1
                        P = P*person_matrix(question_number,i).p_with;
                    else
                        P = P*(1-person_matrix(question_number,i).p_with);
                    end   
                else          
                    if outcome(i) == 1
                        P = P*person_matrix(question_number,i).p_without;
                    else
                        P = P*(1-person_matrix(question_number,i).p_without);
                    end 
                end 
            end
            outcome_probabilities(1,outcome_number) = P;
        end
        outcome_probabilities_matrix(lottery_number,:) = outcome_probabilities;
    end
    ds.outcome_probabilities_matrixs(:,:,question_number) = outcome_probabilities_matrix;
end
    
            
            
            
        
    
    
  

