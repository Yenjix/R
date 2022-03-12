library(dplyr)
library(readxl)
library(writexl)
library(stringr)
library(lubridate)


#########################################################################
###           Para o Brasil Todo - Todos os V (V0-V7)         ###########
#########################################################################

ano=seq(2005,2016,1)

for (i in 1:length(ano)) {
  
  dados1<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V1"))
  dados3<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V2"))
  dados4<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V3"))
  dados5<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V4"))
  dados6<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V5"))
  dados7<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V6"))
  dados8<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V7"))
  
  junta<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8)
  
  dados10<-dados1
  dados30<-dados3
  dados50<-dados5
  junta1<-junta
  
  dados10$ob1<-nrow(dados1)
  dados30$ob3<-nrow(dados3)
  dados50$ob5<-nrow(dados5)
  junta1$ob<-nrow(junta)
  
  dados10$ano1<-paste0(ano[i],".V0")
  dados30$ano3<-paste0(ano[i],".V3")
  dados50$ano5<-paste0(ano[i],".V5")
  junta1$ano<-paste0(ano[i],".V-ALL")
  
  guardar10<-seq(2,nrow(dados1),1)
  guardar30<-seq(2,nrow(dados3),1)
  guardar50<-seq(2,nrow(dados5),1)
  gjunta1<-seq(2,nrow(junta),1)
  
  dados10<-dados10 %>% select(ob1,ano1)
  dados30<-dados30 %>% select(ob3,ano3)
  dados50<-dados50 %>% select(ob5,ano5)
  junta1<-junta1 %>% select(ob,ano)
  
  dados10<-dados10[-guardar10,]
  dados30<-dados30[-guardar30,]
  dados50<-dados50[-guardar50,]
  junta1<-junta1[-gjunta1,]
  
  junta2<-cbind.data.frame(dados10,dados30,dados50,junta1)
  
  write_xlsx(junta,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-",ano[i],".xlsx"))
  write_xlsx(dados10,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V0-",ano[i],".xlsx"))
  write_xlsx(dados30,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V2-",ano[i],".xlsx"))
  write_xlsx(dados50,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V4-",ano[i],".xlsx"))
  write_xlsx(junta2,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste",ano[i],".xlsx"))
  
  print(ano[i])
}

dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste2016.xlsx")

junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)

write_xlsx(junta,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-teste-2005-2016.xlsx"))


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2016.xlsx")

junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)
junta0<-junta %>% filter(str_detect(CAUSABAS,"V0"))
junta2<-junta %>% filter(str_detect(CAUSABAS,"V2"))
junta4<-junta %>% filter(str_detect(CAUSABAS,"V4"))

## Fazer analise descritiva desse - Brasil Acidentes de trânsito
write_xlsx(junta,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2005-2016.xlsx"))
write_xlsx(junta0,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V0-2005-2016.xlsx"))
write_xlsx(junta2,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V2-2005-2016.xlsx"))
write_xlsx(junta4,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V4-2005-2016.xlsx"))

## Com esse aqui aquivo "Brasil-V-V7-2005-2016.xlsx" já consigo fazer a analise descriva para o Brasil sobre acidente de trânsito

analise<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V-V7-2005-2016.xlsx")

analise %>% count(SEXO)
analise %>% count(RACACOR)
analise %>% count(ESC)

analise$group <- cut(analise$IDADE, breaks = seq(400,999,by=15), right = TRUE)
analise %>% count(group)

#total de obitos
nrow(analise)

## Com esse aqui aquivo "Brasil-V-V7-2005-2016.xlsx" já consigo fazer a analise descriva para o Brasil sobre acidente de trânsito


## V0 - Pedestre
analise<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V0-2005-2016.xlsx")

analise %>% count(SEXO)
analise %>% count(RACACOR)
analise %>% count(ESC)

analise$group <- cut(analise$IDADE, breaks = seq(400,999,by=15), right = TRUE)
analise %>% count(group)

#total de obitos
nrow(analise)


## V2 - Motocicleta
analise<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V2-2005-2016.xlsx")

analise %>% count(SEXO)
analise %>% count(RACACOR)
analise %>% count(ESC)

analise$group <- cut(analise$IDADE, breaks = seq(400,999,by=15), right = TRUE)
analise %>% count(group)

#total de obitos
nrow(analise)


## V4 - Automóvel
analise<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/Brasil-V4-2005-2016.xlsx")

analise %>% count(SEXO)
analise %>% count(RACACOR)
analise %>% count(ESC)

analise$group <- cut(analise$IDADE, breaks = seq(400,999,by=15), right = TRUE)
analise %>% count(group)

#total de obitos
nrow(analise)
#########################################################################
###           Para as capitais - Todos os V (V0-V7)           ###########
#########################################################################

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/")

ano=seq(2005,2017,1)
estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")

for (i in 1:length(ano)) {
  
  dados1<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/AC-Rio Branco",ano[i],".xlsx"))
  dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/AL-Maceió",ano[i],".xlsx"))
  dados3<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/AM-Manaus",ano[i],".xlsx"))
  dados4<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/AP-Macapá",ano[i],".xlsx"))
  dados5<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/BA-Salvador",ano[i],".xlsx"))
  dados6<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/CE-Fortaleza",ano[i],".xlsx"))
  dados7<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/DF-Brasília",ano[i],".xlsx"))
  dados8<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/ES-Vitória",ano[i],".xlsx"))
  dados9<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/GO-Goiânia",ano[i],".xlsx"))
  dados10<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/MA-São Luís",ano[i],".xlsx"))
  dados11<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/MG-Belo Horizonte",ano[i],".xlsx"))
  dados12<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/MS-Campo Grande",ano[i],".xlsx"))
  dados13<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/MT-Cuiabá",ano[i],".xlsx"))
  dados14<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/PA-Belém",ano[i],".xlsx"))
  dados15<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/PB-João Pessoa",ano[i],".xlsx"))
  dados16<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/PE-Recife",ano[i],".xlsx"))
  dados17<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/PI-Teresina",ano[i],".xlsx"))
  dados18<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/PR-Curitiba",ano[i],".xlsx"))
  dados19<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados20<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/RN-Natal",ano[i],".xlsx"))
  dados21<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/RO-Porto Velho",ano[i],".xlsx"))
  dados22<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/RR-Boa Vista",ano[i],".xlsx"))
  dados23<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/RS-Porto Alegre",ano[i],".xlsx"))
  dados24<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/SC-Florianópolis",ano[i],".xlsx"))
  dados25<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/SE-Aracaju",ano[i],".xlsx"))
  dados26<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/SP-São Paulo",ano[i],".xlsx"))
  dados27<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/TO-Palmas",ano[i],".xlsx"))
  
  
  junta=rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  junta$obitos=nrow(junta)
  write_xlsx(junta,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-",ano[i],".xlsx"))
  
  print(ano[i])
}

dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2016.xlsx")
dados17<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2017.xlsx")

junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17)

## Fazer analise descritiva desse - Brasil Acidentes de transito
write_xlsx(junta,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2005-2017.xlsx"))

## Com esse aqui aquivo "Capitais-V-V7-2001-2018.xlsx" já consigo fazer a analise descriva para o Brasil sobre acidente de trânsito

analise<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-2005-2017.xlsx")

analise %>% count(SEXO)
analise %>% count(RACACOR)
analise %>% count(ESC)

analise$group <- cut(analise$IDADE, breaks = seq(400,999,by=15), right = TRUE)
analise %>% count(group)

#total de obitos
nrow(analise)
