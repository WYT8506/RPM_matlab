
persons_data.feature_values(:,:,1)= [1,2;1,0;1,0];
persons_data.feature_values(:,:,2)= [3,2;2,0;2,3];
persons_data.feature_values(:,:,3)= [3,1;2,1;1,3];
persons_data.feature_values(:,:,4)= [3,1;2,2;3,4];
persons_data.feature_values(:,:,5)= [1,2;1,0;1,0];
persons_data.feature_values(:,:,6)= [3,2;2,0;2,3];
persons_data.feature_values(:,:,7)= [3,1;2,1;2,3];
persons_data.feature_values(:,:,8)= [3,1;1,2;3,4];
persons_data.feature_values(:,:,9)= [1,3;1,1;1,0];
persons_data.p_with = [0.5,0.4,0.6;0.45,0.7,0.4;0.2,0.8,0.9;0.5,0.6,0.5;0.65,0.4,0.6;0.45,0.75,0.4;0.3,0.82,0.9;0.7,0.6,0.5;0.45,0.4,0.86];
persons_data.p_without = [0.2,0.23,0.35;0.3,0.4,0.6;0.22,0.34,0.19;0.23,0.32,0.4;0.2,0.33,0.4;0.35,0.4,0.7;0.22,0.34,0.39;0.33,0.32,0.45;0.2,0.3,0.25];

ds = create_data_structure(persons_data);
dg = create_data_generator(ds,[1,3],0.5);
disp(sample_a_ranking(dg.prospect_value_matrix,1,0));

%test algorithm
preference_profiles = [];
preference_profiles(1,:) = [321,213,123];
preference_profiles(2,:) = [132,231,231];
preference_profiles(3,:) = [132,231,123];
preference_profiles(4,:) = [132,132,123];
preference_profiles(5,:) = [321,213,123];
preference_profiles(6,:) = [132,231,231];
preference_profiles(7,:) = [132,231,123];
preference_profiles(8,:) = [132,132,123];
preference_profiles(9,:) = [132,132,123];
breaking = create_breaking(preference_profiles);


synthetic_pfs = [];
for i = 1:9
    pf = [];
    for j = 1:10000     
         ranking= sample_a_ranking(dg.prospect_value_matrix,i,1);
         decimal = 0;
         for k = 1:size(ranking,2)
             decimal = ranking(1,k)*10^(size(ranking,2)-k)+decimal;            
         end
         pf(1,j) = decimal;
    end
    synthetic_pfs(i,:) = pf;
end
%synthetic_breaking = create_breaking(synthetic_pfs);


cll = RPMobj_ll_quick([1,3,0.5], synthetic_breaking, ds.outcome_probabilities_matrixs, ds.outcome_feature_matrixs);
disp(cll)
%best_beta_gamma = cml_rpm( breaking, ds.outcome_probabilities_matrixs1, ds.outcome_feature_matrixs1,ds.number_of_features);
best_beta_gamma = cml_rpm(synthetic_breaking, ds.outcome_probabilities_matrixs, ds.outcome_feature_matrixs,ds.number_of_features);
rum_best = cml_rum(synthetic_breaking, ds.outcome_probabilities_matrixs, ds.outcome_feature_matrixs,ds.number_of_features);
%disp(rum_best);
%disp(best_beta_gamma);


best_dg = create_data_generator(ds,best_beta_gamma(1:ds.number_of_features),best_beta_gamma(ds.number_of_features+1));
best_dg_rum = create_data_generator(ds,rum_best,best_beta_gamma(ds.number_of_features+1));

aic_best = AIC(synthetic_pfs,3,best_dg.prospect_value_matrix,1,30,-30,1);
rum_best_aic = AIC(synthetic_pfs,3,best_dg_rum.rum_prospect_value_matrix,1,30,-30,1);
comparison_dg_rpm = create_data_generator(ds,[1,3],0.45);
comparison_aic_rpm = AIC(synthetic_pfs,3,comparison_dg.prospect_value_matrix,1,30,-30,1);
