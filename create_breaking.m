function breaking = create_breaking(preference_profiles)

number_of_lotteries = size(dec2base(preference_profiles(1,1),10) - '0',2);
breaking = zeros(number_of_lotteries*size(preference_profiles,1),number_of_lotteries*size(preference_profiles,1));
for question_number = 1:size(preference_profiles,1)
    offset = (question_number-1)*number_of_lotteries;
    pf = preference_profiles(question_number,:);
    for ranking_number = 1:size(pf,2)
        ranking = dec2base(pf(1,ranking_number),10) - '0';
        for j1 = 1:size(ranking,2)
            for j2 = 1:size(ranking,2)
                if find(ranking ==j1)<find(ranking == j2)
                    breaking(offset+j1,offset+j2) = breaking(offset+j1,offset+j2)+1;
                end
            end
        end
    end
end

breaking = breaking/size(preference_profiles,2);

end