%trapz
function likelihood = get_ranking_likelihood(ranking,prospect_values,sd)
%F =X.*Y.*Z;
likelihood = 1;
X1 = [];
X2 = [];
X3 = [];
for x3 = -10:0.1:10
    for x2 = x3:0.1:10
        for x1 = x2:0.1:10
            X1 = [X1;x1];
            X2 = [X2;x2];
            X3 = [X3;x3];
            disp(X1)
        end
    end
end
%[X,Y] = meshgrid(x,y);