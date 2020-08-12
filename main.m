
persons_data.feature_values(:,:,1)= [1,2;1,0;1,0];
persons_data.feature_values(:,:,2)= [3,2;2,0;1,3];
persons_data.feature_values(:,:,3)= [3,1;2,1;1,3];
persons_data.p_with = [0.5,0.4,0.6;0.45,0.7,0.4;0.2,0.8,0.9];
persons_data.p_without = [0.2,0.23,0.35;0.3,0.4,0.6;0.22,0.34,0.19];

ds = create_data_structure(persons_data);
beta = [1,2];
phi = 0.5;
dg = create_data_generator(ds,beta,phi);
disp(sample_a_ranking(dg.prospect_value_matrix,1,0));

%test algorithm
preference_profiles = [];
preference_profiles(1,:) = [321,213,123];
preference_profiles(2,:) = [132,231,231];
preference_profiles(3,:) = [132,231,123];
breaking = create_breaking(preference_profiles);

%cll = RPMobj_ll([1,1,0.5], breaking, ds.outcome_probabilities_matrixs1, ds.outcome_feature_matrixs1);
best_beta_gamma = cml_rpm( breaking, ds.outcome_probabilities_matrixs1, ds.outcome_feature_matrixs1,ds.number_of_features);
disp(best_beta_gamma);

best_dg = create_data_generator(ds,best_beta_gamma(1:ds.number_of_features),best_beta_gamma(ds.number_of_features+1));
AIC(preference_profiles,3,best_dg.prospect_value_matrix,1,30,-30,1)
comparison_dg = create_data_generator(ds,[3,2],0.2);
AIC(preference_profiles,3,comparison_dg.prospect_value_matrix,1,30,-30,1)