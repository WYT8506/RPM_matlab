
function ds = create_data_structure(person_data)
ds.person_data = person_data;
ds.number_of_questions = size(person_data.p_with,1);
ds.number_of_persons = size(person_data.p_with,2);
ds.number_of_features = size(person_data.feature_values,2);
ds.outcomes = dec2bin(0:+1:2^ds.number_of_persons-1)-'0';

%create
%outcome_feature_matrixes,size is (number_of_outcomes,number_of_features,number_of_questions)
for i1 = 1: ds.number_of_questions
    outcome_feature_matrix = zeros(size(ds.outcomes,1),ds.number_of_features);
    for i2 = 1: size(ds.outcomes,1)
        outcome = ds.outcomes(i2,:);
        feature_vector = outcome*person_data.feature_values(:,:,i1);
        outcome_feature_matrix(i2,:) = feature_vector;
    end
    ds.outcome_feature_matrixs(:,:,i1) = outcome_feature_matrix;
end

%create outcome_probabilities_matrixs,size is (number_of_lotteries, number_of_outcomes, number_of_questions)
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
                        P = P*person_data.p_with(question_number,i);
                    else
                        P = P*(1-person_data.p_with(question_number,i));
                    end   
                else          
                    if outcome(i) == 1
                        P = P*person_data.p_without(question_number,i);
                    else
                        P = P*(1-person_data.p_without(question_number,i));
                    end 
                end 
            end
            outcome_probabilities(1,outcome_number) = P;
        end
        outcome_probabilities_matrix(lottery_number,:) = outcome_probabilities;
    end
    ds.outcome_probabilities_matrixs(:,:,question_number) = outcome_probabilities_matrix;
end
    
            
            
            
        
    
    
  

