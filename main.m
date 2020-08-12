p1 = create_person([1,2,3],0.5,0.2);
p2 = create_person([1,0,1],0.4,0.3);
p3 = create_person([1,0,10],0.4,0.3);
p4 = create_person([1,0,1],0.4,0.3);
p5 = create_person([1,0,1],0.4,0.3);
p6 = create_person([1,0,1],0.4,0.3);

persons_data.feature_values(:,:,1)= [1,2,3;1,0,1;1,0,10];
persons_data.feature_values(:,:,2)= [1,2,3;1,0,1;1,0,10];
persons_data.p_with = [0.5,0.4,0.4;0.4,0.4,0.4];
persons_data.p_without = [0.2,0.3,0.3;0.3,0.3,0.3];

ds = create_data_structure(persons_data);
beta = [1,2,3];
phi = 0.5;
dg = create_data_generator(ds,beta,phi);
disp(sample_a_ranking(dg.prospect_value_matrix,1,0));
