# drying rate survey
# Andrew MacDonald March 2012

dry.survey <-
  read.table("drying.survey.csv",
             comment.char="#",sep=",",
             header=TRUE)
dry.survey$max.log <- log(dry.survey$max)
dry.survey$actual.log <- log(dry.survey$actual)

png("plots.png",width=500,height=300)
par(mfrow=c(1,2))

with(dry.survey,plot(actual~max,pch=21,bg='black',log="xy"))#,ylim=c(0,1400)))
abline(0,1)
lines(with(dry.survey,lowess(actual~max,f=0.5)),col='red',lty=2)
model <- with(dry.survey,lm(actual~max))
#abline(model,lty=2)

xs <- 50:1400
ys <- predict(model,list(max=xs))
lines(xs,ys)

ys.l <- predict(model.log,list(max.log=xs))
lines(xs,ys.l)

#summary(model)

#plot(model)


with(dry.survey,plot(actual.log~max.log,pch=21,bg='black'))#,ylim=c(0,1400)))
abline(0,1)
lines(with(dry.survey,lowess(actual.log~max.log,f=0.65)),col='red',lty=2)
model.log <- with(dry.survey,lm(actual.log~max.log))
abline(model.log,lty=2)

#plot(model.log)
dev.off()



x <- runif(20,min=0,max=50)
y <- x*3+rnorm(20,mean=0,sd=7)
plot(y~x,log="xy")
