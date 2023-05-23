#Clearing the environment#
#=============================#

rm(list=ls())
gc() 
cat("\f")

#Activating the Package#
#==============================#

library(poLCA)

#Uploading the Data#
#==============================#
data.1 <- read.delim(file.choose())
attach(data.1)
names(data.1)

cbind(Do.you.have.a.poultry.Housing.Unit,
      East_West.orientation.for.the.slid.walls,
      House.have.laying.nests,
      vegetation.around.the.chicken.house,
      poultry.housing.unit.have.a.fence.around.it,
      Cleans.the.Poultry.Housing.Unit,
      cleaning.routine_Water.with.soap.or.detergents,
      Have.a.hand.washing.station,
      Have.a.footbath,
      Visitors.must.wash.hands.with.soap,
      visitors.must.Use.of.dedicated.protective.clothing, 
      separates.birds.by.production.groups,
      Insist.on.receiving.health.records.of.new.birds,
      Insist.that.added.birds.must.be.vaccinated,
      Isolate.new.birds.before.introducing.them.into.the.flock,
      Test.new.birds.for.specific.diseases.of.concern,
      Feed.eggs.to.other.animals.during.withdrawal,
      Consume.eggs.at.home.during.withdrawal,
      Dispose.eggs.during.withdrawal,
      Sell.eggs.as.usual.during.withdrawal,
      slaughters.and.consume.sick.birds.that.may.not.recover,
      sell.sick.chicken.as.live.birds,
      Do.not.interve.when.birds.are.sick,
      Buries.dead.carcasses,
      Burn.dead.carcasses,
      Feed.dead.carcasses.to.other.animals,
      Slaughter.and.Consume.dead.carcasses, 
      Dump.dead.carcasses.in.rubbish.pits,
      Deworms.the.birds,
      control.external.parasites.like.tick.and.fleas.in.Poultry,
      Control.vermin.like.rats.and.mice.in.your.poultry.farm,
      Vaccinate.against.Poultry.diseases,
      clean.equipment.with.water.and.soap.after.use,
      Keep.Poultry.Records,
      Follows.all_in.all_out.principle,
      Feeds.Commercial.concentrates,
      Feeds.Home.formulated.feeds,
      Feeds.Grains.such.as.maize.and.rice,
      Provides.additional.feed.supplements,
      Feeds.Protein.premixes,
      Feeds.Vitamin.premixes, 
      Feeds.Mineral.premixes,
      Feeds.Growth.promoters)~1-> dat1
#Implementing the LCA with different class models#
#==================================================#
LC1 <- poLCA(dat1, data=data.1, nclass=2, tol = 1e-10, na.rm = TRUE, probs.start = NULL, nrep = 1, 
             verbose = TRUE, calc.se = TRUE)
LC2 <- poLCA(dat1, data=data.1, nclass=3, tol = 1e-10, na.rm = TRUE, probs.start = NULL, nrep = 1, 
             verbose = TRUE, calc.se = TRUE)
LC3 <- poLCA(dat1, data=data.1, nclass=4, tol = 1e-10, na.rm = TRUE, probs.start = NULL, nrep = 1, 
             verbose = TRUE, calc.se = TRUE)
LC4 <- poLCA(dat1, data=data.1, nclass=5, tol = 1e-10, na.rm = TRUE, probs.start = NULL, nrep = 1, 
             verbose = TRUE, calc.se = TRUE)
LC5 <- poLCA(dat1, data=data.1, nclass=6, tol = 1e-10, na.rm = TRUE, probs.start = NULL, nrep = 1, 
             verbose = TRUE, calc.se = TRUE)
LC6 <- poLCA(dat1, data=data.1, nclass=7, tol = 1e-10, na.rm = TRUE, probs.start = NULL, nrep = 1, 
             verbose = TRUE, calc.se = TRUE)
LC7 <- poLCA(dat1, data=data.1, nclass=8, tol = 1e-10, na.rm = TRUE, probs.start = NULL, nrep = 1, 
             verbose = TRUE, calc.se = TRUE)

pred.prob <- data.frame (LC3$posterior)

pred.class <- data.frame (LC3$predclass)

post.stat <- cbind(data.1, pred.prob, pred.class)