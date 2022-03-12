library(dplyr)
library(readxl)
library(writexl)
library(stringr)
library(lubridate)

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/BRASIL.TODO/")

ano=seq(2005,2016,1)
df=NULL
df=data.frame(df)

for (i in 1:length(ano)){
  a=read_xlsx(paste0("Brasil-V-V7-",ano[i],".xlsx"))
  b=read_xlsx(paste0("Brasil-V0-",ano[i],".xlsx"))
  c=read_xlsx(paste0("Brasil-V2-",ano[i],".xlsx"))
  d=read_xlsx(paste0("Brasil-V4-",ano[i],".xlsx"))
  df[i,1]=nrow(a)
  df[i,2]=b[1,1]
  df[i,3]=c[1,1]
  df[i,4]=d[1,1]
  df[i,5]=ano[i]
  print(ano[i])
}

df= df %>% rename("V0-V7"=V1) %>% rename("Pedestre"=V2) %>% rename("Motocicleta"=V3) %>% rename("Carro"=V4) %>% rename("Ano"=V5)

write_xlsx(df,"B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/Brasil-Mortos-2005-2016.xlsx")


### Analisar por Capital? ou Total das Capitais?
#for (i in 1:length(ano)){
#  a=read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/Capitais/OK/Capitais-V-V7-",ano[i],".xlsx"))
#  df[i,1]=a[1,8]
 # 
  #b
  
  #c=read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/",ano[i],".xlsx"))
  #df[i,2]=colSums(c[2])
  
  #d=read_xlsx(paste0())
  
#}



setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V0-V7/")

cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belem","Macapa","Palmas","Sao Luis","Teresina","Fortaleza","Natal","Joao Pessoa", "Recife",
           "Maceio","Aracaju", "Salvador","Belo Horizonte","Vitoria","Rio de Janeiro","Sao Paulo","Curitiba","Florianopolis","Porto Alegre","Campo Grande",
           "Cuiaba", "Goiania", "Brasilia")
ano=seq(2005,2016,1)

a=read_xlsx("ProntoV0-V07-2005-2016.xlsx")

for (i in 1:length(ano)) {
  b[1,]=a[i,10]
}



## Analise Descritiva - Capitais 2005-2016
setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/")

ano=seq(2005,2016,1)
estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belem","Macapa","Palmas","Sao Luis","Teresina","Fortaleza","Natal","Joao Pessoa", "Recife",
           "Maceio","Aracaju", "Salvador","Belo Horizonte","Vitoria","Rio de Janeiro","Sao Paulo","Curitiba","Florianopolis","Porto Alegre","Campo Grande",
           "Cuiaba", "Goiania", "Brasilia")
df=NULL
df2=NULL


a2005=read_xlsx(paste0("Capitais-V-V7-2005.xlsx"))
a2006=read_xlsx(paste0("Capitais-V-V7-2006.xlsx"))
a2007=read_xlsx(paste0("Capitais-V-V7-2007.xlsx"))
a2008=read_xlsx(paste0("Capitais-V-V7-2008.xlsx"))
a2009=read_xlsx(paste0("Capitais-V-V7-2009.xlsx"))
a2010=read_xlsx(paste0("Capitais-V-V7-2010.xlsx"))
a2011=read_xlsx(paste0("Capitais-V-V7-2011.xlsx"))
a2012=read_xlsx(paste0("Capitais-V-V7-2012.xlsx"))
a2013=read_xlsx(paste0("Capitais-V-V7-2013.xlsx"))
a2014=read_xlsx(paste0("Capitais-V-V7-2014.xlsx"))
a2015=read_xlsx(paste0("Capitais-V-V7-2015.xlsx"))
a2016=read_xlsx(paste0("Capitais-V-V7-2016.xlsx"))

df[1]=as.numeric(a2005[1,8])
df[2]=as.numeric(a2006[1,8])
df[3]=as.numeric(a2007[1,8])
df[4]=as.numeric(a2008[1,8])
df[5]=as.numeric(a2009[1,8])
df[6]=as.numeric(a2010[1,8])
df[7]=as.numeric(a2011[1,8])
df[8]=as.numeric(a2012[1,8])
df[9]=as.numeric(a2013[1,8])
df[10]=as.numeric(a2014[1,8])
df[11]=as.numeric(a2015[1,8])
df[12]=as.numeric(a2016[1,8])

df=data.frame(ano,df)

junta=rbind(a2005,a2006,a2007,a2008,a2009,a2010,a2011,a2012,a2013,a2014,a2015,a2016)

write_xlsx(df,"OK-14.12.20/Mortos por ano.xlsx")
write_xlsx(junta,"OK-14.12.20/Capitais2005-2016.xlsx")



##############################################################################
## Capitais V0-V7 (GERAL) - Analise Descritiva 
##############################################################################
setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/")
analise=read_xlsx("OK-14.12.20/Capitais2005-2016.xlsx")

analise %>% count(SEXO)
analise %>% count(RACACOR)
analise %>% count(ESC)
Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK-14.12.20/Capitais2005-2016.xlsx
#total de obitos
nrow(analise)

analise$group <- cut(analise$IDADE, breaks = seq(400,999,by=15), right = TRUE)
analise %>% count(group)

#######################################
## Capitais V0 - Analise Descritiva  ##
#######################################

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/")

ano=seq(2005,2016,1)
estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapa","Palmas","Sao Luis","Teresina","Fortaleza","Natal","Joao Pessoa", "Recife",
           "Maceio","Aracaju", "Salvador","Belo Horizonte","Vitoria","Rio de Janeiro","Sao Paulo","Curitiba","Florianopolis","Porto Alegre","Campo Grande",
           "Cuiaba", "Goiania", "Brasilia")

for (i in 1:length(ano)) {
  dados1=read_xlsx(paste0("RO-Porto Velho",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados2=read_xlsx(paste0("AC-Rio Branco",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados3=read_xlsx(paste0("AM-Manaus",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados4=read_xlsx(paste0("RR-Boa Vista",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados5=read_xlsx(paste0("PA-Belém",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados6=read_xlsx(paste0("AP-Macapá",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados7=read_xlsx(paste0("TO-Palmas",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados8=read_xlsx(paste0("MA-São Luís",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados9=read_xlsx(paste0("PI-Teresina",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados10=read_xlsx(paste0("CE-Fortaleza",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados11=read_xlsx(paste0("RN-Natal",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados12=read_xlsx(paste0("PB-João Pessoa",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados13=read_xlsx(paste0("PE-Recife",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados14=read_xlsx(paste0("AL-Maceió",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados15=read_xlsx(paste0("SE-Aracaju",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados16=read_xlsx(paste0("BA-Salvador",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados17=read_xlsx(paste0("MG-Belo Horizonte",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados18=read_xlsx(paste0("ES-Vitória",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados19=read_xlsx(paste0("RJ-Rio de Janeiro",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados20=read_xlsx(paste0("SP-São Paulo",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados21=read_xlsx(paste0("PR-Curitiba",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados22=read_xlsx(paste0("SC-Florianópolis",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados23=read_xlsx(paste0("RS-Porto Alegre",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados24=read_xlsx(paste0("MS-Campo Grande",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados25=read_xlsx(paste0("MT-Cuiabá",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados26=read_xlsx(paste0("GO-Goiânia",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  dados27=read_xlsx(paste0("DF-Brasília",ano[i],".xlsx")) %>% filter(str_detect(CAUSABAS,"V0"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("V0/Capitais",ano[i],".xlsx"))
  print(ano[i])
  
}

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/")

dados1=read_xlsx("Capitais2005.xlsx")
dados2=read_xlsx("Capitais2006.xlsx")
dados3=read_xlsx("Capitais2007.xlsx")
dados4=read_xlsx("Capitais2008.xlsx")
dados5=read_xlsx("Capitais2009.xlsx")
dados6=read_xlsx("Capitais2010.xlsx")
dados7=read_xlsx("Capitais2011.xlsx")
dados8=read_xlsx("Capitais2012.xlsx")
dados9=read_xlsx("Capitais2013.xlsx")
dados10=read_xlsx("Capitais2014.xlsx")
dados11=read_xlsx("Capitais2015.xlsx")
dados12=read_xlsx("Capitais2016.xlsx")

dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12)
write_xlsx(dados.capitais,"Capitais2005-2016.xlsx")


analise=read_xlsx("Capitais2005-2016.xlsx")
analise %>% count(SEXO)
analise %>% count(RACACOR)
analise %>% count(ESC)

#total de obitos
nrow(analise)

analise$group <- cut(analise$IDADE, breaks = seq(400,999,by=15), right = TRUE)
analise %>% count(group)


#######################################
## Capitais V2 - Analise Descritiva  ##
#######################################
setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/")

ano=seq(2005,2016,1)
estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapa","Palmas","Sao Luis","Teresina","Fortaleza","Natal","Joao Pessoa", "Recife",
           "Maceio","Aracaju", "Salvador","Belo Horizonte","Vitoria","Rio de Janeiro","Sao Paulo","Curitiba","Florianopolis","Porto Alegre","Campo Grande",
           "Cuiaba", "Goiania", "Brasilia")

for (i in 1:length(ano)) {
  dados1=read_xlsx(paste0("RO-Porto Velho",ano[i],".xlsx"))
  dados2=read_xlsx(paste0("AC-Rio Branco",ano[i],".xlsx"))
  dados3=read_xlsx(paste0("AM-Manaus",ano[i],".xlsx"))
  dados4=read_xlsx(paste0("RR-Boa Vista",ano[i],".xlsx"))
  dados5=read_xlsx(paste0("PA-Belém",ano[i],".xlsx")) 
  dados6=read_xlsx(paste0("AP-Macapá",ano[i],".xlsx"))
  dados7=read_xlsx(paste0("TO-Palmas",ano[i],".xlsx")) 
  dados8=read_xlsx(paste0("MA-São Luís",ano[i],".xlsx")) 
  dados9=read_xlsx(paste0("PI-Teresina",ano[i],".xlsx"))
  dados10=read_xlsx(paste0("CE-Fortaleza",ano[i],".xlsx")) 
  dados11=read_xlsx(paste0("RN-Natal",ano[i],".xlsx"))
  dados12=read_xlsx(paste0("PB-João Pessoa",ano[i],".xlsx")) 
  dados13=read_xlsx(paste0("PE-Recife",ano[i],".xlsx")) 
  dados14=read_xlsx(paste0("AL-Maceió",ano[i],".xlsx")) 
  dados15=read_xlsx(paste0("SE-Aracaju",ano[i],".xlsx")) 
  dados16=read_xlsx(paste0("BA-Salvador",ano[i],".xlsx")) 
  dados17=read_xlsx(paste0("MG-Belo Horizonte",ano[i],".xlsx"))
  dados18=read_xlsx(paste0("ES-Vitória",ano[i],".xlsx"))
  dados19=read_xlsx(paste0("RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados20=read_xlsx(paste0("SP-São Paulo",ano[i],".xlsx"))
  dados21=read_xlsx(paste0("PR-Curitiba",ano[i],".xlsx")) 
  dados22=read_xlsx(paste0("SC-Florianópolis",ano[i],".xlsx")) 
  dados23=read_xlsx(paste0("RS-Porto Alegre",ano[i],".xlsx")) 
  dados24=read_xlsx(paste0("MS-Campo Grande",ano[i],".xlsx")) 
  dados25=read_xlsx(paste0("MT-Cuiabá",ano[i],".xlsx")) 
  dados26=read_xlsx(paste0("GO-Goiânia",ano[i],".xlsx")) 
  dados27=read_xlsx(paste0("DF-Brasília",ano[i],".xlsx"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("OK-15.12.20/Capitais",ano[i],".xlsx"))
  print(ano[i])
  
}

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK-15.12.20/")

dados1=read_xlsx("Capitais2005.xlsx")
dados2=read_xlsx("Capitais2006.xlsx")
dados3=read_xlsx("Capitais2007.xlsx")
dados4=read_xlsx("Capitais2008.xlsx")
dados5=read_xlsx("Capitais2009.xlsx")
dados6=read_xlsx("Capitais2010.xlsx")
dados7=read_xlsx("Capitais2011.xlsx")
dados8=read_xlsx("Capitais2012.xlsx")
dados9=read_xlsx("Capitais2013.xlsx")
dados10=read_xlsx("Capitais2014.xlsx")
dados11=read_xlsx("Capitais2015.xlsx")
dados12=read_xlsx("Capitais2016.xlsx")

dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12)
write_xlsx(dados.capitais,"Capitais2005-2016.xlsx")

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK-15.12.20/")


analise=read_xlsx("Capitais2005-2016.xlsx")
analise %>% count(SEXO)
analise %>% count(RACACOR)
analise %>% count(ESC)

#total de obitos
nrow(analise)

analise$group <- cut(analise$IDADE, breaks = seq(400,999,by=15), right = TRUE)
analise %>% count(group)
#######################################
## Capitais V4 - Analise Descritiva  ##
#######################################

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/")

ano=seq(2005,2016,1)
estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapa","Palmas","Sao Luis","Teresina","Fortaleza","Natal","Joao Pessoa", "Recife",
           "Maceio","Aracaju", "Salvador","Belo Horizonte","Vitoria","Rio de Janeiro","Sao Paulo","Curitiba","Florianopolis","Porto Alegre","Campo Grande",
           "Cuiaba", "Goiania", "Brasilia")

for (i in 1:length(ano)) {
  dados1=read_xlsx(paste0("RO-Porto Velho",ano[i],".xlsx"))
  dados2=read_xlsx(paste0("AC-Rio Branco",ano[i],".xlsx"))
  dados3=read_xlsx(paste0("AM-Manaus",ano[i],".xlsx"))
  dados4=read_xlsx(paste0("RR-Boa Vista",ano[i],".xlsx"))
  dados5=read_xlsx(paste0("PA-Belém",ano[i],".xlsx")) 
  dados6=read_xlsx(paste0("AP-Macapá",ano[i],".xlsx"))
  dados7=read_xlsx(paste0("TO-Palmas",ano[i],".xlsx")) 
  dados8=read_xlsx(paste0("MA-São Luís",ano[i],".xlsx")) 
  dados9=read_xlsx(paste0("PI-Teresina",ano[i],".xlsx"))
  dados10=read_xlsx(paste0("CE-Fortaleza",ano[i],".xlsx")) 
  dados11=read_xlsx(paste0("RN-Natal",ano[i],".xlsx"))
  dados12=read_xlsx(paste0("PB-João Pessoa",ano[i],".xlsx")) 
  dados13=read_xlsx(paste0("PE-Recife",ano[i],".xlsx")) 
  dados14=read_xlsx(paste0("AL-Maceió",ano[i],".xlsx")) 
  dados15=read_xlsx(paste0("SE-Aracaju",ano[i],".xlsx")) 
  dados16=read_xlsx(paste0("BA-Salvador",ano[i],".xlsx")) 
  dados17=read_xlsx(paste0("MG-Belo Horizonte",ano[i],".xlsx"))
  dados18=read_xlsx(paste0("ES-Vitória",ano[i],".xlsx"))
  dados19=read_xlsx(paste0("RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados20=read_xlsx(paste0("SP-São Paulo",ano[i],".xlsx"))
  dados21=read_xlsx(paste0("PR-Curitiba",ano[i],".xlsx")) 
  dados22=read_xlsx(paste0("SC-Florianópolis",ano[i],".xlsx")) 
  dados23=read_xlsx(paste0("RS-Porto Alegre",ano[i],".xlsx")) 
  dados24=read_xlsx(paste0("MS-Campo Grande",ano[i],".xlsx")) 
  dados25=read_xlsx(paste0("MT-Cuiabá",ano[i],".xlsx")) 
  dados26=read_xlsx(paste0("GO-Goiânia",ano[i],".xlsx")) 
  dados27=read_xlsx(paste0("DF-Brasília",ano[i],".xlsx"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("OK-15.12.20/Capitais",ano[i],".xlsx"))
  print(ano[i])
  
}

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK-15.12.20/")

dados1=read_xlsx("Capitais2005.xlsx")
dados2=read_xlsx("Capitais2006.xlsx")
dados3=read_xlsx("Capitais2007.xlsx")
dados4=read_xlsx("Capitais2008.xlsx")
dados5=read_xlsx("Capitais2009.xlsx")
dados6=read_xlsx("Capitais2010.xlsx")
dados7=read_xlsx("Capitais2011.xlsx")
dados8=read_xlsx("Capitais2012.xlsx")
dados9=read_xlsx("Capitais2013.xlsx")
dados10=read_xlsx("Capitais2014.xlsx")
dados11=read_xlsx("Capitais2015.xlsx")
dados12=read_xlsx("Capitais2016.xlsx")

dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12)
write_xlsx(dados.capitais,"Capitais2005-2016.xlsx")

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK-15.12.20/")


analise=read_xlsx("Capitais2005-2016.xlsx")
analise %>% count(SEXO)
analise %>% count(RACACOR)
analise %>% count(ESC)

#total de obitos
nrow(analise)

analise$group <- cut(analise$IDADE, breaks = seq(400,999,by=15), right = TRUE)
analise %>% count(group)


##############
# grafico - MQO
##

library(ggplot2)
library(ggpubr)
library(readxl)


## tem q arrumar os limites do grafico

a<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V0-V7/Backup-14.12.20-OK-ProntoV0-V07-2005-2016 -.xlsx")

regressao=ggplot(a,
                 aes(PIB.REAL.P.Corrente.2016,indice.ob.100k.hab),
                 geom_point())

regressao + expand_limits(x=c(10000,120000), y=c(0, 50))

ggplot(airquality,aes(sample=Ozone))+
  stat_qq(size=2.5,shape=21,
          fill="lightblue",col="dodgeblue4")+
  stat_qq_line(col="brown4",lwd=1.5)+
  theme_bw()+
  labs(y="QUantis das Amostras",
       x='Quantis Teóricos (Distribuição Normal')

 
library(ggpubr)
library(readxl)

teste1<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V0-V7/Backup-14.12.20-OK-ProntoV0-V07-2005-2016 -.xlsx")

ggscatter(teste1, x = "PIB.REAL.P.Corrente.2016", y = "indice.ob.100k.hab",
          color = "black", shape = 21, size = 2, # Points color, shape and size
          add = "reg.line",  # Add regressin line
          add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
          conf.int = FALSE, # Add confidence interval
          cor.coef = FALSE, # Add correlation coefficient. see ?stat_cor
          cor.coeff.args = list(method = "pearson", label.x = 3, label.sep = "/n"),
          xlab="PIB real (preço de 2016)",
          ylab="Índice de Óbito por 100mil Habitantes") + 
          stat_regline_equation(label.x = 51000,label.y = 37) + expand_limits (y=seq(0,50,5)) + 
          theme_bw()


ggscatter(teste1, x = "indice.frota.10.hab", y = "indice.ob.10k.frota",
          color = "black", shape = 21, size = 2, # Points color, shape and size
          add = "reg.line",  # Add regressin line
          add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
          conf.int = FALSE, # Add confidence interval
          cor.coef = FALSE, # Add correlation coefficient. see ?stat_cor
          cor.coeff.args = list(method = "pearson", label.x = 3, label.sep = "/n"),
          xlab="Veículos por 10 habitantes",
          ylab="Óbitos por 10 mil veículos") + 
          theme_bw()


library(ggpubr)
library(readxl)
        
teste2<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/Brasil-Mortos-2005-2016 - Arrumei na mao.xlsx")

ggscatter(teste2, x = "Veículos por 10 habitantes", y = "Obitos por 10mil Veiculos",
          color = "black", shape = 21, size = 2, # Points color, shape and size
          add = "reg.line",  # Add regressin line
          add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
          conf.int = FALSE, # Add confidence interval
          cor.coef = FALSE, # Add correlation coefficient. see ?stat_cor
          cor.coeff.args = list(method = "pearson", label.x = 3, label.sep = "/n"),
          xlab="Veículos por 10 habitantes",
          ylab="Obitos por 10mil Veiculos") + 
  theme_bw() + expand_limits (y=c(0,7))


teste2<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/Brasil-Mortos-2005-2016 - Arrumei na mao.xlsx")

ggscatter(teste2, x = "PIB real (preço 2016)", y = "Óbito por 100mil Habitantes",
          color = "black", shape = 21, size = 2, # Points color, shape and size
          add = "reg.line",  # Add regressin line
          add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
          conf.int = FALSE, # Add confidence interval
          cor.coef = FALSE, # Add correlation coefficient. see ?stat_cor
          cor.coeff.args = list(method = "pearson", label.x = 3, label.sep = "/n"),
          xlab="PIB real (preço 2016)",
          ylab="Obitos por 100 mil Habitantes") + 
          theme_bw() + expand_limits (y=c(0,18))

pib<-ggscatter(teste2, x = "Ano", y = "PIB real (preço 2016)",
               color = "black", shape = 21, size = 2, # Points color, shape and size),
               xlab="Ano",
               ylab="PIB real (preço 2016)") + 
  theme_bw() + expand_limits (y=c(0,35000))

taxa<-ggscatter(teste2, x = "Ano", y = "Óbito por 100mil Habitantes",
                     color = "black", shape = 21, size = 2, # Points color, shape and size),
                     xlab="Ano",
                     ylab="Óbito por 100mil Habitantes") + 
  theme_bw() + expand_limits (y=c(0,18))

ggarrange(pib,taxa)