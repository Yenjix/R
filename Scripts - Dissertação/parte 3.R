library(dplyr)
library(readxl)
library(writexl)
library(stringr)
library(lubridate)


########################################################################################
###           Capitais - V - Todos os Envolvidos em Acidentes    V0-V7      ###########
########################################################################################


## -> Tem q remover os V8 E V9 (25/10/2020) -> Só pegar os dados da pasta/V-V7, OK, feito!


cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapá","Palmas","São Luís","Teresina","Fortaleza","Natal","João Pessoa", "Recife",
           "Maceió","Aracaju", "Salvador","Belo Horizonte","Vitória","Rio de Janeiro","São Paulo","Curitiba","Florianópolis","Porto Alegre","Campo Grande",
           "Cuiabá", "Goiânia", "Brasília")

estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
codigo<-c(11,12,13,14,15,16,17,21,22,23,24,25,26,27,28,29,31,32,33,35,41,42,43,50,51,52,53)


ano <- seq(2005,2017,1)

p=1
j=1

for (p in 1:length(ano)) {
  for (j in 1:length(estado) ){
    
    dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/",estado[j],"-",cidades[j],ano[p],".xlsx" ))
    
    dados2<-dados2 %>% filter(!is.na(IDADE) & IDADE!=0 & IDADE<600 & IDADE>400)
    
    dados2$ESC<-as.numeric(dados2$ESC)
    
    
    dados2$m.idade<-mean((dados2$IDADE-400))
    
    dados2$ob<-nrow(dados2)
    
    dados3<-dados2 %>% select(m.idade,ob)
    guardar<-seq(2,nrow(dados3),1)
    dados3<-dados3[-guardar,]
    dados3$ano<-ano[p]
    dados3$estado<-codigo[j]
    
    write_xlsx(dados3,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/",estado[j],"-",cidades[j],ano[p],".xlsx"))
    
    print(paste0(estado[j],"-",cidades[j],ano[p]))
    
  }
}

for (i in 1:length(ano)){
  dados1<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/DF-Brasília",ano[i],".xlsx"))
  dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/GO-Goiânia",ano[i],".xlsx"))
  dados3<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/MT-Cuiabá",ano[i],".xlsx"))
  dados4<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/MS-Campo Grande",ano[i],".xlsx"))
  dados5<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/RS-Porto Alegre",ano[i],".xlsx"))
  dados6<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/SC-Florianópolis",ano[i],".xlsx"))
  dados7<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/PR-Curitiba",ano[i],".xlsx"))
  dados8<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/SP-São Paulo",ano[i],".xlsx"))
  dados9<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados10<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/ES-Vitória",ano[i],".xlsx"))
  dados11<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/MG-Belo Horizonte",ano[i],".xlsx"))
  dados12<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/BA-Salvador",ano[i],".xlsx"))
  dados13<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/SE-Aracaju",ano[i],".xlsx"))
  dados14<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/AL-Maceió",ano[i],".xlsx"))
  dados15<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/PE-Recife",ano[i],".xlsx"))
  dados16<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/PB-João Pessoa",ano[i],".xlsx"))
  dados17<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/RN-Natal",ano[i],".xlsx"))
  dados18<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/CE-Fortaleza",ano[i],".xlsx"))
  dados19<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/PI-Teresina",ano[i],".xlsx"))
  dados20<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/MA-São Luís",ano[i],".xlsx"))
  dados21<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/TO-Palmas",ano[i],".xlsx"))
  dados22<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/AP-Macapá",ano[i],".xlsx"))
  dados23<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/PA-Belém",ano[i],".xlsx"))
  dados24<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/RR-Boa Vista",ano[i],".xlsx"))
  dados25<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/AM-Manaus",ano[i],".xlsx"))
  dados26<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/AC-Rio Branco",ano[i],".xlsx"))
  dados27<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/RO-Porto Velho",ano[i],".xlsx"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais",ano[i],".xlsx"))
  print(ano[i])
}


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2016.xlsx")


junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)


### Não vou mais usar a variavel dummy

#for (i in 1:nrow(junta)) {
#  if (junta[i,4]< 2013){
#    junta$Dummy.ano[i] = 0
#  } else {
#    junta$Dummy.ano[i] = 1
#  }
#}

junta<-junta[order(junta[,3],junta[,4]),]

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2005-2016.xlsx"))

## Lembrar de ordenar da forma crescente a coluna dos estados -> Fiz isso manualmente no Excel




setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/")

b<-NULL
c<-NULL
ano <- seq(2005,2016,1)
for (i in 1:length(ano)){
  a<-read_xlsx(paste0("Brasil",ano[i],".xlsx"))
  b[i]<-nrow(a)
}

c<-data.frame(b,ano)
write_xlsx(c,"B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil2005-2016-Mortos.xlsx")


