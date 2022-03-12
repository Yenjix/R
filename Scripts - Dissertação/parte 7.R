## Painel Efeito Fixo - Fixed Effects (within) => Vou fazer no Stata, ta dando erro em todos os efeitos aleatorios aqui

## Todos acesssados em: 30/10/2020

## Links: 
## http://karthur.org/2019/implementing-fixed-effects-panel-models-in-r.html
## https://datascienceplus.com/working-with-panel-data-in-r-fixed-vs-random-effects-plm/
## https://www.princeton.edu/~otorres/Panel101R.pdf

## Teste de Hausman - https://www4.eco.unicamp.br/docentes/gori/images/arquivos/PanelData/HO235_Lesson5_RandomHausman.pdf

## Vídeos: 
## Fixed and random effects panel regression in R using 'plm' package - https://www.youtube.com/watch?v=PxDPkiHedn0&ab_channel=MikeCrowson 
## Robust/White Standard Errors - https://www.youtube.com/watch?v=hFoDDwTF4KY&ab_channel=intromediateecon
## Robust or Clustered Errors and Post-Regression Statistics - R for Economists Moderate 2 - https://www.youtube.com/watch?v=d9B-ySRR2GA&ab_channel=NickHuntington-Klein


library(plm) ## Efeito fixo e random || Teste de Hausman
library(lmtest) ## coeftest function and Breusch-Pagan test (para usar Robust erros)
library(stargazer)
library(readxl)

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/")

####################################
##  Variavel dependente Obitos  ####
####################################

######################################################################################################################################################
## V2 - Motocicleta

moto<-read_xlsx("V2/ProntoV2-2005-2016.xlsx")

moto$idade.quad<-moto$m.idade^2

FE_Moto <- plm(indice.ob.10k.frota~m.idade+idade.quad+idh,indice.frota.10.hab+PIB.REAL.P.Corrente.2016,
               data = moto,model="within", index=c("estado","ano"))
summary(FE_Moto)

## Efeito aleatorio dando erro aqui, vou fazer pelo STATA
RE_Moto <- FE_Moto <- plm(ob~m.idade+idade.quad+frota+pop+idh,data = moto,model="random",index=c("estado","ano"))

#Robust standard erro
stargazer(FE_Moto,coeftest(FE_Moto,vcovHC),type='text')
coeftest(FE_Moto,vcovHC)

# Breusch-Pagan test
bptest(FE_Moto)
## p-value muito baixo, deve-se utilizar o Robust Erros

#Hausman-Test
phtest(FE_Moto,RE_Moto)

pcdteste(FE_Moto)

######################################################################################################################################################
## V4 - Automóvel

carro<-read_xlsx("V4/ProntoV4-2005-2016.xlsx")
carro$idade.quad<-carro$m.idade^2

FE_Carro <- plm(ob~frota+pop+idh+m.idade+idade.quad,
                data=carro,model="within",index = c("municipio","ano"))
summary(FE_Carro)

## Efeito aleatorio dando erro aqui, vou fazer pelo STATA
RE_Carro <- plm(ob~frota+pop+idh+m.idade+idade.quad,data = carro,model="random",index=c("estado","ano"))

#Robust standard erro
stargazer(FE_Carro,coeftest(FE_Carro,vcovHC),type='text')
coeftest(FE_Carro,vcovHC)

# Breusch-Pagan test
bptest(FE_Carro)
## p-value muito baixo, deve-se utilizar o Robust Erros

#Hausman-Test
phtest(FE_Carro,RE_Carro)

pcdteste(FE_Carro)


######################################################################################################################################################
## V0-V7 - Todos os acidentes de trânsito

All<-read_xlsx("V0-V7/ProntoV0-V07-2005-2016.xlsx")

All$idade.quad<-All$m.idade^2

FE_All <- plm(ob~frota+pop+idh+m.idade+idade.quad,data = All,model="within", index=c("estado","ano"))
summary(FE_All)

RE_All <- FE_All <- plm(ob~frota+pop+idh+m.idade+idade.quad,data = All,model="random",index=c("estado","ano"))

#Robust standard erro
stargazer(FE_All,coeftest(FE_All,vcovHC),type='text')
coeftest(FE_All,vcovHC)

# Breusch-Pagan test
bptest(FE_All)
## p-value muito baixo, deve-se utilizar o Robust Erros

#Hausman-Test
phtest(FE_All,RE_All)

pcdteste(FE_All)

######################################################################################################################################################
## V2-V4-V5-V6-V7 - Acidentes de trânsito envolvendo transporte

Transporte<-read_xlsx("V-2-4-5-6-7/ProntoV-2-4-5-6-7-2005-2016.xlsx")

Transporte$idade.quad<-Transporte$m.idade^2

FE_Transporte <- plm(ob~frota+pop+idh+m.idade+idade.quad,data = Transporte,model="within", index=c("estado","ano"))
summary(FE_Transporte)

RE_Transporte <- FE_Transporte <- plm(ob~frota+pop+idh+m.idade+idade.quad,data = Transporte,model="random",index=c("estado","ano"))

#Robust standard erro
stargazer(FE_Transporte,coeftest(FE_Transporte,vcovHC),type='text')
coeftest(FE_Transporte,vcovHC)

# Breusch-Pagan test
bptest(FE_Transporte)
## p-value muito baixo, deve-se utilizar o Robust Erros

#Hausman-Test
phtest(FE_Transporte,RE_Transporte)

pcdteste(FE_Transporte)



######################################################################################################################################################
## V2-V4-V5-V6-V7_5 - Acidentes de trânsito envolvendo transporte + motorista identificado

Motorista<-read_xlsx("V_5/ProntoV_5-2005-2016.xlsx")

Motorista$idade.quad<-Motorista$m.idade^2

FE_Motorista <- plm(ob~frota+pop+idh+m.idade+idade.quad,data = Motorista,model="within", index=c("estado","ano"))
summary(FE_Motorista)

RE_Motorista <- FE_Motorista <- plm(ob~frota+pop+idh+m.idade+idade.quad,data = Motorista,model="random",index=c("estado","ano"))

#Robust standard erro
stargazer(FE_Motorista,coeftest(FE_Motorista,vcovHC),type='text')
coeftest(FE_Motorista,vcovHC)

# Breusch-Pagan test
bptest(FE_Motorista)
## p-value muito baixo, deve-se utilizar o Robust Erros

#Hausman-Test
phtest(FE_Motorista,RE_Motorista)

pcdteste(FE_Motorista)



##############################################################
##  Variavel dependente Índice  Obitos por 100k habitantes ###
##############################################################