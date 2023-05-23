//Importing the Data File//
use "Poultry Data File.dta"
label variable HHID "Household identifier"
label variable revenues "Total income from sale of chicken and chicken products"
label variable healthcost "Cost of healthcare services per chicken"
label variable feedcost "Expenditure on feeds per chicken"

//Generating the  Inverse Hyperbolic Sine Transformation for Income///
gen invhypsinehincome = ln(OnfarmIncometotal + (( OnfarmIncometotal ^2 +1)^0.5))
gen invhypsinehnonfainc = ln(Offfarmincome + (( Offfarmincome ^2 +1)^0.5))
summarize invhypsinehincome
summarize invhypsinehnonfainc

//Descriptive Statistics//
pwcorr AssignedClass mortalityrate hasanychickendiedfromyourf usedantibiotics, star(0.1) sig
pwcorr AssignedClass mortalityrate hasanychickendiedfromyourf usedantibiotics, star(0.05) sig
pwcorr AssignedClass mortalityrate hasanychickendiedfromyourf usedantibiotics, star(0.01) sig
oneway mortalityrate AssignedClass, tabulate
pwmean mortalityrate , over( AssignedClass ) mcompare(tukey) effects
tabulate usedantibiotics AssignedClass , chi2
tabulate GenderofHH AssignedClass , chi2
tabulate accessedinformation AssignedClass , chi2

oneway PerceptionIndex AssignedClass, tabulate
pwmean PerceptionIndex, over(AssignedClass)mcompare(tukey) effects
oneway PoultryProduc~e AssignedClass, tabulate
pwmean PoultryProduc~e, over(AssignedClass)mcompare(tukey) effects
oneway FlockSize AssignedClass, tabulate
pwmean FlockSize, over(AssignedClass)mcompare(tukey) effects
oneway FarmSize AssignedClass, tabulate
oneway EducationofHH AssignedClass, tabulate
pwmean EducationofHH, over(AssignedClass)mcompare(tukey) effects
oneway AgeofHH AssignedClass, tabulate
pwmean AgeofHH, over(AssignedClass)mcompare(tukey) effects
oneway FAMILYSIZE AssignedClass, tabulate
pwmean FAMILYSIZE, over(AssignedClass)mcompare(tukey) effects
oneway invhypsinehincome AssignedClass, tabulate
pwmean invhypsinehincome, over(AssignedClass)mcompare(tukey) effects
oneway invhypsinehnonfainc AssignedClass, tabulate
pwmean accessedinformation , over(AssignedClass)mcompare(tukey) effects
oneway accessedinformation AssignedClass, tabulate
pwmean accessedinformation , over(AssignedClass)mcompare(tukey) effects
oneway GenderofHH AssignedClass, tabulate
pwmean GenderofHH , over(AssignedClass)mcompare(tukey) effects

//Correlation Analysis//
pwcorr AssignedClass PerceptionIndex accessedinformation PoultryProduc~e FlockSize FarmSize EducationofHH GenderofHH AgeofHH KeepsIndigeno~n, star(0.1) sig
pwcorr AssignedClass PerceptionIndex accessedinformation PoultryProduc~e FlockSize FarmSize EducationofHH GenderofHH AgeofHH KeepsIndigeno~n, star(0.1) sig
pwcorr PerceptionIndex accessedinformation PoultryProduc~e FlockSize FarmSize EducationofHH GenderofHH AgeofHH KeepsIndigeno~n, star(0.1) sig

//Generating the Interation Term for Age, Experience, and Years of Formal Education//
gen intagexp = AgeofHH* PoultryProductionYearsofExpe* EducationofHH

//Specifying the MLogit Model//
mlogit AssignedClass PerceptionIndex i.accessedinformation PoultryProduc~e FlockSize FarmSize EducationofHH i.GenderofHH AgeofHH agesquared  FAMILYSIZE invhypsinehincome invhypsinehnonfainc intagexp, base(1) nolog

//MLogit Marginal Effects//
asdoc margins, dydx(*) atmeans predict(pr outcome(1)), replace
asdoc margins, dydx(*) atmeans predict(pr outcome(2))
asdoc margins, dydx(*) atmeans predict(pr outcome(3))