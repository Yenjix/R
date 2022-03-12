library(dplyr)
library(readxl)
library(writexl)
library(stringr)
library(lubridate)
#######################################################################################
###           Capitais - V - Todos os Envolvidos em Acidentes - V0-V7       ###########
#######################################################################################

#### ESSA EH EXATAMENTE A PARTE3


################################################################################################
###           Capitais - Veiculos automotor envolvidos em Acidente - V2-V4-V5-V6-V7       ######
################################################################################################

cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapá","Palmas","São Luís","Teresina","Fortaleza","Natal","João Pessoa", "Recife",
           "Maceió","Aracaju", "Salvador","Belo Horizonte","Vitória","Rio de Janeiro","São Paulo","Curitiba","Florianópolis","Porto Alegre","Campo Grande",
           "Cuiabá", "Goiânia", "Brasília")

estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
codigo<-c(11,12,13,14,15,16,17,21,22,23,24,25,26,27,28,29,31,32,33,35,41,42,43,50,51,52,53)


ano <- seq(2005,2016,1)

p=1
j=1

for (p in 1:length(ano)) {
  for (j in 1:length(estado) ){
    
    dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/",estado[j],"-",cidades[j],ano[p],".xlsx" ))
    
    dados2<-dados2 %>% filter(!is.na(IDADE) & IDADE!=0 & IDADE<600 & IDADE>=400)
    
    dados2$ESC<-as.numeric(dados2$IDADE)

    
#    write_xlsx(dados2,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/DATASUS/TABWin/Arquivos dbc_dbf_csv/Revista/",ano[i],estados[j],".xlsx"))
    
    dados2$m.idade<-mean((dados2$IDADE-400))
    
    dados2$ob<-nrow(dados2)
    
    dados3<-dados2 %>% select(m.idade,ob)
    
    if (nrow(dados3)>1){
      
      guardar<-seq(2,nrow(dados3),1)
      dados3<-dados3[-guardar,]
    }
    
    if(nrow(dados3)==0){
      dados3[1,2]=0
    }
    
    dados3$ano<-ano[p]
    dados3$estado<-codigo[j]
    
    write_xlsx(dados3,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/",estado[j],"-",cidades[j],ano[p],".xlsx"))
    
    print(paste0(estado[j],"-",cidades[j],ano[p]))
    
  }
}

for (i in 1:length(ano)){
  dados1<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/DF-Brasília",ano[i],".xlsx"))
  dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/GO-Goiânia",ano[i],".xlsx"))
  dados3<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/MT-Cuiabá",ano[i],".xlsx"))
  dados4<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/MS-Campo Grande",ano[i],".xlsx"))
  dados5<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/RS-Porto Alegre",ano[i],".xlsx"))
  dados6<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/SC-Florianópolis",ano[i],".xlsx"))
  dados7<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/PR-Curitiba",ano[i],".xlsx"))
  dados8<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/SP-São Paulo",ano[i],".xlsx"))
  dados9<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados10<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/ES-Vitória",ano[i],".xlsx"))
  dados11<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/MG-Belo Horizonte",ano[i],".xlsx"))
  dados12<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/BA-Salvador",ano[i],".xlsx"))
  dados13<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/SE-Aracaju",ano[i],".xlsx"))
  dados14<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/AL-Maceió",ano[i],".xlsx"))
  dados15<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/PE-Recife",ano[i],".xlsx"))
  dados16<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/PB-João Pessoa",ano[i],".xlsx"))
  dados17<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/RN-Natal",ano[i],".xlsx"))
  dados18<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/CE-Fortaleza",ano[i],".xlsx"))
  dados19<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/PI-Teresina",ano[i],".xlsx"))
  dados20<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/MA-São Luís",ano[i],".xlsx"))
  dados21<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/TO-Palmas",ano[i],".xlsx"))
  dados22<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/AP-Macapá",ano[i],".xlsx"))
  dados23<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/PA-Belém",ano[i],".xlsx"))
  dados24<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/RR-Boa Vista",ano[i],".xlsx"))
  dados25<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/AM-Manaus",ano[i],".xlsx"))
  dados26<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/AC-Rio Branco",ano[i],".xlsx"))
  dados27<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/RO-Porto Velho",ano[i],".xlsx"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/",ano[i],".xlsx"))
  print(ano[i])
}


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/2016.xlsx")


junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)


### Não vou mais usar a variavel dummy

#for (i in 1:nrow(junta)) {
#  if (junta[i,4]< 2013){
#    junta$Dummy.ano[i] = 0
#  } else {
#    junta$Dummy.ano[i] = 1
#  }
#}

junta<- junta[order(junta[,3],junta[,4]),]

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/Capitais2005-2016.xlsx"))


##################################################################################################################
###           Capitais - V - Todos os identificados como Motoristas em Acidentes - V2-V4-V5-V6-V7_5 ##############
##################################################################################################################

cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapá","Palmas","São Luís","Teresina","Fortaleza","Natal","João Pessoa", "Recife",
           "Maceió","Aracaju", "Salvador","Belo Horizonte","Vitória","Rio de Janeiro","São Paulo","Curitiba","Florianópolis","Porto Alegre","Campo Grande",
           "Cuiabá", "Goiânia", "Brasília")

estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
codigo<-c(11,12,13,14,15,16,17,21,22,23,24,25,26,27,28,29,31,32,33,35,41,42,43,50,51,52,53)


ano <- seq(2005,2016,1)

p=1
j=1

for (p in 1:length(ano)) {
  for (j in 1:length(estado) ){
    
    dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/",estado[j],"-",cidades[j],ano[p],".xlsx" ))
    
    dados2<-dados2 %>% filter(!is.na(IDADE) & IDADE!=0 & IDADE<600 & IDADE>=400)
    
    dados2$ESC<-as.numeric(dados2$IDADE)
    
    dados2$m.idade<-mean((dados2$IDADE-400))
    
    dados2$ob<-nrow(dados2)
    
    dados3<-dados2 %>% select(m.idade,ob)
    
    if (nrow(dados3)>1){
      
      guardar<-seq(2,nrow(dados3),1)
      dados3<-dados3[-guardar,]
    }
    if(nrow(dados3)==0){
      dados3[1,2]=0
    }
    
    dados3$ano<-ano[p]
    dados3$estado<-codigo[j]
    
    write_xlsx(dados3,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/",estado[j],"-",cidades[j],ano[p],".xlsx"))
    
    print(paste0(estado[j],"-",cidades[j],ano[p]))
    
  }
}

for (i in 1:length(ano)){
  dados1<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/DF-Brasília",ano[i],".xlsx"))
  dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/GO-Goiânia",ano[i],".xlsx"))
  dados3<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/MT-Cuiabá",ano[i],".xlsx"))
  dados4<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/MS-Campo Grande",ano[i],".xlsx"))
  dados5<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/RS-Porto Alegre",ano[i],".xlsx"))
  dados6<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/SC-Florianópolis",ano[i],".xlsx"))
  dados7<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/PR-Curitiba",ano[i],".xlsx"))
  dados8<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/SP-São Paulo",ano[i],".xlsx"))
  dados9<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados10<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/ES-Vitória",ano[i],".xlsx"))
  dados11<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/MG-Belo Horizonte",ano[i],".xlsx"))
  dados12<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/BA-Salvador",ano[i],".xlsx"))
  dados13<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/SE-Aracaju",ano[i],".xlsx"))
  dados14<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/AL-Maceió",ano[i],".xlsx"))
  dados15<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/PE-Recife",ano[i],".xlsx"))
  dados16<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/PB-João Pessoa",ano[i],".xlsx"))
  dados17<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/RN-Natal",ano[i],".xlsx"))
  dados18<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/CE-Fortaleza",ano[i],".xlsx"))
  dados19<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/PI-Teresina",ano[i],".xlsx"))
  dados20<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/MA-São Luís",ano[i],".xlsx"))
  dados21<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/TO-Palmas",ano[i],".xlsx"))
  dados22<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/AP-Macapá",ano[i],".xlsx"))
  dados23<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/PA-Belém",ano[i],".xlsx"))
  dados24<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/RR-Boa Vista",ano[i],".xlsx"))
  dados25<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/AM-Manaus",ano[i],".xlsx"))
  dados26<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/AC-Rio Branco",ano[i],".xlsx"))
  dados27<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/RO-Porto Velho",ano[i],".xlsx"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/",ano[i],".xlsx"))
  print(ano[i])
}


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/2016.xlsx")


junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)


### Não vou mais usar a variavel dummy

#for (i in 1:nrow(junta)) {
#  if (junta[i,4]< 2013){
#    junta$Dummy.ano[i] = 0
#  } else {
#    junta$Dummy.ano[i] = 1
#  }
#}

junta<- junta[order(junta[,3],junta[,4]),]

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/Capitais2005-2016.xlsx"))


############################################################
###           Capitais - V2 - Motocicletas       ###########
############################################################


cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapá","Palmas","São Luís","Teresina","Fortaleza","Natal","João Pessoa", "Recife",
           "Maceió","Aracaju", "Salvador","Belo Horizonte","Vitória","Rio de Janeiro","São Paulo","Curitiba","Florianópolis","Porto Alegre","Campo Grande",
           "Cuiabá", "Goiânia", "Brasília")

estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
codigo<-c(11,12,13,14,15,16,17,21,22,23,24,25,26,27,28,29,31,32,33,35,41,42,43,50,51,52,53)


ano <- seq(2005,2016,1)

p=1
j=1

for (p in 1:length(ano)) {
  for (j in 1:length(estado) ){
    
    dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/",estado[j],"-",cidades[j],ano[p],".xlsx" ))
    
    dados2<-dados2 %>% filter(!is.na(IDADE) & IDADE!=0 & IDADE<600 & IDADE>=400)
    
    dados2$ESC<-as.numeric(dados2$IDADE)
    
    dados2$m.idade<-mean((dados2$IDADE-400))
    
    dados2$ob<-nrow(dados2)
    
    dados3<-dados2 %>% select(m.idade,ob)
    
    if (nrow(dados3)>1){
      
      guardar<-seq(2,nrow(dados3),1)
      dados3<-dados3[-guardar,]
    }
    
    ## Caso tenha vazio, ele ira preencher obitos com Zero e m.idade=NA
    if(nrow(dados3)==0){
      dados3[1,2]=0
    }
    
    dados3$ano<-ano[p]
    dados3$estado<-codigo[j]
    
    write_xlsx(dados3,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/",estado[j],"-",cidades[j],ano[p],".xlsx"))
    
    print(paste0(estado[j],"-",cidades[j],ano[p]))
    
  }
}

for (i in 1:length(ano)){
  dados1<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/DF-Brasília",ano[i],".xlsx"))
  dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/GO-Goiânia",ano[i],".xlsx"))
  dados3<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/MT-Cuiabá",ano[i],".xlsx"))
  dados4<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/MS-Campo Grande",ano[i],".xlsx"))
  dados5<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/RS-Porto Alegre",ano[i],".xlsx"))
  dados6<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/SC-Florianópolis",ano[i],".xlsx"))
  dados7<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/PR-Curitiba",ano[i],".xlsx"))
  dados8<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/SP-São Paulo",ano[i],".xlsx"))
  dados9<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados10<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/ES-Vitória",ano[i],".xlsx"))
  dados11<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/MG-Belo Horizonte",ano[i],".xlsx"))
  dados12<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/BA-Salvador",ano[i],".xlsx"))
  dados13<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/SE-Aracaju",ano[i],".xlsx"))
  dados14<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/AL-Maceió",ano[i],".xlsx"))
  dados15<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/PE-Recife",ano[i],".xlsx"))
  dados16<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/PB-João Pessoa",ano[i],".xlsx"))
  dados17<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/RN-Natal",ano[i],".xlsx"))
  dados18<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/CE-Fortaleza",ano[i],".xlsx"))
  dados19<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/PI-Teresina",ano[i],".xlsx"))
  dados20<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/MA-São Luís",ano[i],".xlsx"))
  dados21<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/TO-Palmas",ano[i],".xlsx"))
  dados22<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/AP-Macapá",ano[i],".xlsx"))
  dados23<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/PA-Belém",ano[i],".xlsx"))
  dados24<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/RR-Boa Vista",ano[i],".xlsx"))
  dados25<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/AM-Manaus",ano[i],".xlsx"))
  dados26<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/AC-Rio Branco",ano[i],".xlsx"))
  dados27<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/RO-Porto Velho",ano[i],".xlsx"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/",ano[i],".xlsx"))
  print(ano[i])
}


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/2016.xlsx")


junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)
junta<- junta[order(junta[,3],junta[,4]),]

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/Capitais2005-2016.xlsx"))


#########################################################
###           Capitais - V4 - Automovél       ########### 
#########################################################


cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapá","Palmas","São Luís","Teresina","Fortaleza","Natal","João Pessoa", "Recife",
           "Maceió","Aracaju", "Salvador","Belo Horizonte","Vitória","Rio de Janeiro","São Paulo","Curitiba","Florianópolis","Porto Alegre","Campo Grande",
           "Cuiabá", "Goiânia", "Brasília")

estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
codigo<-c(11,12,13,14,15,16,17,21,22,23,24,25,26,27,28,29,31,32,33,35,41,42,43,50,51,52,53)


ano <- seq(2005,2016,1)

p=1
j=1

for (p in 1:length(ano)) {
  for (j in 1:length(estado) ){
    
    dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/",estado[j],"-",cidades[j],ano[p],".xlsx" ))
    
    dados2<-dados2 %>% filter(!is.na(IDADE) & IDADE!=0 & IDADE<600 & IDADE>=400)
    
    dados2$ESC<-as.numeric(dados2$IDADE)
    
    dados2$m.idade<-mean((dados2$IDADE-400))
    
    dados2$ob<-nrow(dados2)
    
    dados3<-dados2 %>% select(m.idade,ob)
    
    if (nrow(dados3)>1){
      
      guardar<-seq(2,nrow(dados3),1)
      dados3<-dados3[-guardar,]
    }
    if(nrow(dados3)==0){
      dados3[1,2]=0
    }
    
    dados3$ano<-ano[p]
    dados3$estado<-codigo[j]
    
    write_xlsx(dados3,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/",estado[j],"-",cidades[j],ano[p],".xlsx"))
    
    print(paste0(estado[j],"-",cidades[j],ano[p]))
    
  }
}

for (i in 1:length(ano)){
  dados1<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/DF-Brasília",ano[i],".xlsx"))
  dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/GO-Goiânia",ano[i],".xlsx"))
  dados3<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/MT-Cuiabá",ano[i],".xlsx"))
  dados4<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/MS-Campo Grande",ano[i],".xlsx"))
  dados5<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/RS-Porto Alegre",ano[i],".xlsx"))
  dados6<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/SC-Florianópolis",ano[i],".xlsx"))
  dados7<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/PR-Curitiba",ano[i],".xlsx"))
  dados8<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/SP-São Paulo",ano[i],".xlsx"))
  dados9<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados10<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/ES-Vitória",ano[i],".xlsx"))
  dados11<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/MG-Belo Horizonte",ano[i],".xlsx"))
  dados12<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/BA-Salvador",ano[i],".xlsx"))
  dados13<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/SE-Aracaju",ano[i],".xlsx"))
  dados14<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/AL-Maceió",ano[i],".xlsx"))
  dados15<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/PE-Recife",ano[i],".xlsx"))
  dados16<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/PB-João Pessoa",ano[i],".xlsx"))
  dados17<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/RN-Natal",ano[i],".xlsx"))
  dados18<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/CE-Fortaleza",ano[i],".xlsx"))
  dados19<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/PI-Teresina",ano[i],".xlsx"))
  dados20<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/MA-São Luís",ano[i],".xlsx"))
  dados21<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/TO-Palmas",ano[i],".xlsx"))
  dados22<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/AP-Macapá",ano[i],".xlsx"))
  dados23<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/PA-Belém",ano[i],".xlsx"))
  dados24<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/RR-Boa Vista",ano[i],".xlsx"))
  dados25<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/AM-Manaus",ano[i],".xlsx"))
  dados26<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/AC-Rio Branco",ano[i],".xlsx"))
  dados27<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/RO-Porto Velho",ano[i],".xlsx"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/",ano[i],".xlsx"))
  print(ano[i])
}


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/2016.xlsx")


junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)
junta<- junta[order(junta[,3],junta[,4]),]

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/Capitais2005-2016.xlsx"))


###############################################
###           Capitais - V7 - Ônibus       ####
###############################################


cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapá","Palmas","São Luís","Teresina","Fortaleza","Natal","João Pessoa", "Recife",
           "Maceió","Aracaju", "Salvador","Belo Horizonte","Vitória","Rio de Janeiro","São Paulo","Curitiba","Florianópolis","Porto Alegre","Campo Grande",
           "Cuiabá", "Goiânia", "Brasília")

estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
codigo<-c(11,12,13,14,15,16,17,21,22,23,24,25,26,27,28,29,31,32,33,35,41,42,43,50,51,52,53)


ano <- seq(2005,2016,1)

p=1
j=1

for (p in 1:length(ano)) {
  for (j in 1:length(estado) ){
    
    dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/",estado[j],"-",cidades[j],ano[p],".xlsx" ))
    
    dados2<-dados2 %>% filter(!is.na(IDADE) & IDADE!=0 & IDADE<600 & IDADE>=400)
    
    dados2$ESC<-as.numeric(dados2$IDADE)
    
    dados2$m.idade<-mean((dados2$IDADE-400))
    
    dados2$ob<-nrow(dados2)
    
    dados3<-dados2 %>% select(m.idade,ob)
    
    if (nrow(dados3)>1){
      
      guardar<-seq(2,nrow(dados3),1)
      dados3<-dados3[-guardar,]
    }
    if(nrow(dados3)==0){
      dados3[1,2]=0
    }
    
    dados3$ano<-ano[p]
    dados3$estado<-codigo[j]
    
    write_xlsx(dados3,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/",estado[j],"-",cidades[j],ano[p],".xlsx"))
    
    print(paste0(estado[j],"-",cidades[j],ano[p]))
    
  }
}

for (i in 1:length(ano)){
  dados1<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/DF-Brasília",ano[i],".xlsx"))
  dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/GO-Goiânia",ano[i],".xlsx"))
  dados3<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/MT-Cuiabá",ano[i],".xlsx"))
  dados4<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/MS-Campo Grande",ano[i],".xlsx"))
  dados5<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/RS-Porto Alegre",ano[i],".xlsx"))
  dados6<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/SC-Florianópolis",ano[i],".xlsx"))
  dados7<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/PR-Curitiba",ano[i],".xlsx"))
  dados8<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/SP-São Paulo",ano[i],".xlsx"))
  dados9<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados10<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/ES-Vitória",ano[i],".xlsx"))
  dados11<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/MG-Belo Horizonte",ano[i],".xlsx"))
  dados12<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/BA-Salvador",ano[i],".xlsx"))
  dados13<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/SE-Aracaju",ano[i],".xlsx"))
  dados14<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/AL-Maceió",ano[i],".xlsx"))
  dados15<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/PE-Recife",ano[i],".xlsx"))
  dados16<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/PB-João Pessoa",ano[i],".xlsx"))
  dados17<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/RN-Natal",ano[i],".xlsx"))
  dados18<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/CE-Fortaleza",ano[i],".xlsx"))
  dados19<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/PI-Teresina",ano[i],".xlsx"))
  dados20<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/MA-São Luís",ano[i],".xlsx"))
  dados21<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/TO-Palmas",ano[i],".xlsx"))
  dados22<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/AP-Macapá",ano[i],".xlsx"))
  dados23<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/PA-Belém",ano[i],".xlsx"))
  dados24<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/RR-Boa Vista",ano[i],".xlsx"))
  dados25<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/AM-Manaus",ano[i],".xlsx"))
  dados26<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/AC-Rio Branco",ano[i],".xlsx"))
  dados27<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/RO-Porto Velho",ano[i],".xlsx"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/",ano[i],".xlsx"))
  print(ano[i])
}


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/2016.xlsx")


junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)
junta<- junta[order(junta[,3],junta[,4]),]

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/Capitais2005-2016.xlsx"))


###############################################
###           Capitais - V0 - Pedestre       ####
###############################################


cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapá","Palmas","São Luís","Teresina","Fortaleza","Natal","João Pessoa", "Recife",
           "Maceió","Aracaju", "Salvador","Belo Horizonte","Vitória","Rio de Janeiro","São Paulo","Curitiba","Florianópolis","Porto Alegre","Campo Grande",
           "Cuiabá", "Goiânia", "Brasília")

estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
codigo<-c(11,12,13,14,15,16,17,21,22,23,24,25,26,27,28,29,31,32,33,35,41,42,43,50,51,52,53)


ano <- seq(2005,2016,1)

p=1
j=1

for (p in 1:length(ano)) {
  for (j in 1:length(estado) ){
    
    dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/",estado[j],"-",cidades[j],ano[p],".xlsx" ))
    
    dados2<-dados2 %>% filter(!is.na(IDADE) & IDADE!=0 & IDADE<600 & IDADE>=400)
    
    dados2$m.idade<-mean((dados2$IDADE-400))
    
    dados2$ob<-nrow(dados2)
    
    dados3<-dados2 %>% select(m.idade,ob)
    
    if (nrow(dados3)>1){
      
      guardar<-seq(2,nrow(dados3),1)
      dados3<-dados3[-guardar,]
    }
    if(nrow(dados3)==0){
      dados3[1,2]=0
    }
    
    dados3$ano<-ano[p]
    dados3$estado<-codigo[j]
    
    write_xlsx(dados3,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/",estado[j],"-",cidades[j],ano[p],".xlsx"))
    
    print(paste0(estado[j],"-",cidades[j],ano[p]))
    
  }
}

for (i in 1:length(ano)){
  dados1<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/DF-Brasília",ano[i],".xlsx"))
  dados2<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/GO-Goiânia",ano[i],".xlsx"))
  dados3<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/MT-Cuiabá",ano[i],".xlsx"))
  dados4<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/MS-Campo Grande",ano[i],".xlsx"))
  dados5<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/RS-Porto Alegre",ano[i],".xlsx"))
  dados6<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/SC-Florianópolis",ano[i],".xlsx"))
  dados7<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/PR-Curitiba",ano[i],".xlsx"))
  dados8<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/SP-São Paulo",ano[i],".xlsx"))
  dados9<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/RJ-Rio de Janeiro",ano[i],".xlsx"))
  dados10<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/ES-Vitória",ano[i],".xlsx"))
  dados11<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/MG-Belo Horizonte",ano[i],".xlsx"))
  dados12<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/BA-Salvador",ano[i],".xlsx"))
  dados13<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/SE-Aracaju",ano[i],".xlsx"))
  dados14<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/AL-Maceió",ano[i],".xlsx"))
  dados15<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/PE-Recife",ano[i],".xlsx"))
  dados16<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/PB-João Pessoa",ano[i],".xlsx"))
  dados17<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/RN-Natal",ano[i],".xlsx"))
  dados18<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/CE-Fortaleza",ano[i],".xlsx"))
  dados19<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/PI-Teresina",ano[i],".xlsx"))
  dados20<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/MA-São Luís",ano[i],".xlsx"))
  dados21<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/TO-Palmas",ano[i],".xlsx"))
  dados22<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/AP-Macapá",ano[i],".xlsx"))
  dados23<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/PA-Belém",ano[i],".xlsx"))
  dados24<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/RR-Boa Vista",ano[i],".xlsx"))
  dados25<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/AM-Manaus",ano[i],".xlsx"))
  dados26<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/AC-Rio Branco",ano[i],".xlsx"))
  dados27<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/RO-Porto Velho",ano[i],".xlsx"))
  
  dados.capitais<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.capitais, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/",ano[i],".xlsx"))
  print(ano[i])
}


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/2016.xlsx")


junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)
junta<- junta[order(junta[,3],junta[,4]),]

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/Capitais2005-2016.xlsx"))

