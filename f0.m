function result = f0(x1,x2,x3,ranking,prospect_values,sd)
  pdf1 = normpdf(x1,prospect_values(1,ranking(1,1)),sd);
  pdf2 = normpdf(x2,prospect_values(1,ranking(1,2)),sd);
  pdf3 = normpdf(x3,prospect_values(1,ranking(1,3)),sd);
  result = pdf1*pdf2*pdf3;
end