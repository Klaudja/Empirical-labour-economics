use "C:\Users\luigi\Desktop\Tutto\Bergamo\Università\I anno\II semestre\Empoirical Labour Economics\laureati.dta"

cd "C:\Users\luigi\Desktop\Tutto\Bergamo\Università\I anno\II semestre\Empoirical Labour Economics\empirical project"

by y_degree, sort : summarize
codebook
correlate
twoway (bar lnwage LM_num if y_degree == 0 & Gender == 0) (scatter lnwage LM_num if y_degree == 1 & Gender == 0) (scatter lnwage LM_num if y_degree == 1 & Gender == 1) (bar lnwage LM_num if y_degree == 0 & Gender == 1)


ttest lnwage, by(y_degree) unequal
/*With this test we check the null hypothesis:  the difference of the average lnwage by y of degree is equal to 0 (mean(0) - mean(1)). Even if the difference is very small, around -.0500393 , looking at the bottom part of the output, the one with the p-values, we can see that for our H0 there is a p-value of 0. This means that the difference is statistically different from 0. So, there is a relevant difference between the wage for class_2009 and the wage for class_2012 5 years after the degree. The output suggestst that the average wage for class_2012 is higher than the average waeg for class_2009 5 years after degree. */

encode LM, generate(LM_num) 
/*To use this categorical variable in the regression we transformed it in a numberical variable (factor).*/

reg lnwage y_degree##Experience y_degree##Gender y_degree##LM_num, robust
/*Graduating in 2012 increase the wage 5 years from graduation of 3.6% with respect to graduating in 2009 and this increase is statistically significant. This is also confirmed by the ttest we have already done.
Having a job before graduating (=Experience) increase the wage 5 years after graduation of 6.6% with respect to not having a job at graduation (statistically significant).
Having experience and graduating in 2012 increase the wage of 2.3% with respect to not having experience and graduating in 2009. This result is not statistically significant at a confidence level of 5%.
Being a female, decrease the wage of 16% (controlling for year of degree, experience and LM).
Being a female graduated in 2012 increase the wage of 1.2% with respect to being a male and graduating in 2009 (?) (I am not sure about the base level, is it 0 0 or maybe 0 1 or 1 0?). Maybe it is 0 1, so with respect to being a female and graduating in 2009.
Then there is the effect of graduating in different LM on the wage.
Finally we have the interaction between the LM and the year or degree. For example, graduating in 2012 in LM - 46 increase the wage of 10% then graduating in 2009 and it is statisticaloly significant. Only 3 LM are not statistically significant.*/





/*reg lnwage y_degree Experience Gender LM_num y_degree#Experience y_degree#Gender y_degree#LM_num, robust*(questa però non funge)/
