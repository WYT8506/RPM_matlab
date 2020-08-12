
persons_data.feature_values(:,:,1)= [1,2;1,0;1,0];
persons_data.feature_values(:,:,2)= [3,2;2,0;1,3];
persons_data.feature_values(:,:,3)= [3,1;2,1;1,3];
persons_data.p_with = [0.5,0.4,0.6;0.45,0.7,0.4;0.2,0.8,0.9];
persons_data.p_without = [0.2,0.23,0.35;0.3,0.4,0.6;0.22,0.34,0.19];

ds = create_data_structure(persons_data);
dg = create_data_generator(ds,[1,3],0.5);
disp(sample_a_ranking(dg.prospect_value_matrix,1,0));

%test algorithm
preference_profiles = [];
preference_profiles(1,:) = [321,213,123];
preference_profiles(2,:) = [132,231,231];
preference_profiles(3,:) = [132,231,123];
breaking = create_breaking(preference_profiles);

synthetic_pfs = [];
for i = 1:3
    pf = [];
    for j = 1:1000     
         ranking= sample_a_ranking(dg.prospect_value_matrix,i,0);
         decimal = 0;
         for k = 1:size(ranking,2)
             decimal = ranking(1,k)*10^(size(ranking,2)-k)+decimal;            
         end
         pf(1,j) = decimal;
    end
    synthetic_pfs(i,:) = pf;
end
synthetic_breaking = create_breaking(synthetic_pfs);


%cll = RPMobj_ll([1,1,0.5], breaking, ds.outcome_probabilities_matrixs1, ds.outcome_feature_matrixs1);
%best_beta_gamma = cml_rpm( breaking, ds.outcome_probabilities_matrixs1, ds.outcome_feature_matrixs1,ds.number_of_features);
best_beta_gamma = cml_rpm( breaking, ds.outcome_probabilities_matrixs, ds.outcome_feature_matrixs,ds.number_of_features);
rum_best = cml_rum(breaking, ds.outcome_probabilities_matrixs, ds.outcome_feature_matrixs,ds.number_of_features);
disp(rum_best);

best_dg = create_data_generator(ds,best_beta_gamma(1:ds.number_of_features),best_beta_gamma(ds.number_of_features+1));

%AIC(synthetic_pfs,3,best_dg.prospect_value_matrix,1,100,-100,1)
%comparison_dg = create_data_generator(ds,[3,2],0.2);
%AIC(synthetic_pfs,3,comparison_dg.prospect_value_matrix,1,100,-100,1)