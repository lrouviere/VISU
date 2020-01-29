#library(bestglm)
#donnees <- SAheart
#var_exp <- "chd"
#nom.meth <- c("Aucune","AIC")
#n_app <- 300
library(plotROC)
library(MASS)
library(pROC)

trace_roc <- function(donnees,var_exp,n_app,nom.meth){
  if (ncol(donnees)>15){
    ind_IC <- na.omit(match(c("AIC","BIC"),nom.meth))
    if (length(ind_IC)>=1){
      nom.meth <- nom.meth[-ind_IC]
    }
  }
#    nom.meth <- nom.meth[-na.omit(match(c("AIC","BIC"),nom.meth))]}
  ind_app <- sample(nrow(donnees),n_app)
  ind.Y <- match(var_exp,names(donnees))
  donnees1 <- donnees[,-ind.Y]
  donnees1$Y <- donnees[,ind.Y]
  dapp <- donnees1[ind_app,]
  dtest <- donnees1[-ind_app,]
  model <- list()
  model1 <- list()
  nb.meth <- length(nom.meth)
  score <- data.frame(matrix(0,ncol=nb.meth,nrow=nrow(dtest)))
  for (i in 1:nb.meth){
    model[[i]] <- switch(nom.meth[i],
                    "Logistique"=glm(as.formula(paste(names(dapp)[ncol(dapp)],"~.")),data=dapp,family="binomial"),
                    "AIC"=bestglm(dapp,family=binomial,IC="AIC")$BestModel,
                    "BIC"=bestglm(dapp,family=binomial,IC="BIC")$BestModel,
                    "LDA"=lda(as.formula(paste(names(dapp)[ncol(dapp)],"~.")),data=dapp)
    )
    if (nom.meth[i]=="LDA"){
      score[,i] <- predict(model[[i]],newdata=dtest)$x
      model1[[i]] <- model[[i]]$scaling
    } else {
        score[,i] <- predict(model[[i]],newdata=dtest)
        model1[[i]] <- summary(model[[i]])$coefficients}
  }
  score$Y <- dtest[,ncol(dtest)]
  names(score)[1:nb.meth] <- nom.meth
  if (ncol(score)>2){
    score1 <- melt_roc(score,ncol(score),1:(ncol(score)-1))
    score1$name <- as.factor(score1$name)
    names(score1)[ncol(score1)] <- "Methode"
    score <- data.frame(score)
    AUC <- (apply(score[,1:nb.meth],2,auc,response=score$Y))
    AUC1 <-t(data.frame(AUC))
  } else {
    score1 <- cbind(score,nom.meth)
    names(score1) <- c("M","D","Methode")
    score <- data.frame(score)
    AUC1 <- data.frame(auc(score$Y,score[,1]))
    names(AUC1) <- nom.meth
  }
  rocplot <- ggplot(score1)+aes(m=M,d=D,color=Methode)+geom_roc()+theme_bw()
  return(list(model=model1,ROC=rocplot,auc=AUC1))
}

#res <- trace_roc(SAheart,"chd",200,c(nom.meth,"LDA"))

