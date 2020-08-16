function aic_bic = AIC(preference_profiles,k,prospect_matrix,sd,upper,lower,interval)
    total_ll = 0;
    for question_number = 1:size(prospect_matrix,1)
        hist = containers.Map;
        pf = preference_profiles(question_number,:);
        for ranking_number = 1:size(pf,2)
            ranking = pf(1,ranking_number);
            ranking = string(ranking);
            if hist.isKey(ranking) == 0
                hist(ranking) =1;
            else 
                hist(ranking) = hist(ranking)+1;
            end
        end
        disp(hist.keys())
        disp(hist.values())
        ll = get_likelihood(hist,prospect_matrix(question_number,:),sd,upper,lower,interval);
        disp(ll);
        %disp(likelihood);
        total_ll = total_ll+ll;
    end 
    N = size(preference_profiles,1)*size(preference_profiles,2)*log2(factorial(size(prospect_matrix,2)));
    aic = -2*total_ll +2*k;
    bic = -2*ll+log(N)*k;
    aic_bic = [aic,bic];
    
    