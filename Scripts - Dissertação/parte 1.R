library(dplyr)
library(readxl)
library(writexl)
library(stringr)
library(lubridate)


## Antes de mexer aqui é necessario transformar os aquivos do SIM/DATASUS do formato DBC para CSV
## Segue o link do video que ensina a fazer isso:
## Nome: "Convertendo DBC para CSV usando TabWin" / Postado em 19 de jul. 2019. Visto em Fev de 2020.
## Link: https://www.youtube.com/watch?v=4CW60eHGqQQ&t=361s&ab_channel=LucasR.Alves


# Código IBGE para as capitais por ordem númerica
# Estados:
# Região Norte
# 11 Rondônia (RO); 12 Acre (AC); 13 Amazonas (AM); 14 Roraima (RR);  15 Pará (PA); 16 Amapá (AP); 17 Tocantins (TO);

# Região Nordeste
# 21 Maranhão (MA); 22 Piauí (PI); 23 Ceará (CE); 24 Rio Grande do Norte (RN); 25 Paraíba (PB); 26 Pernambuco (PE); 27 Alagoas (AL); 28 Sergipe (SE); 29 Bahia (BA);

# Região Sudeste
# 31 Minas Gerais (MG); 32 Espírito Santo (ES); 33 Rio de Janeiro (RJ); 35 São Paulo (SP);

# Região Sul
# 41 Paraná (PR); 42 Santa Catarina (SC); 43 Rio Grande do Sul (RS);

# Região Centro-Oeste
# 50 Mato Grosso do Sul (MS); 51 Mato Grosso (MT); 52 Goiás (GO); 53 Distrito Federal (DF);

# Capitais
# Porto Velho (1100205); Rio Branco (1200401); Manaus (1302603); Boa Vista (1400100); Belém (1501402); Macapá (1600303); Palmas (1721000);
# São Luís (2111300); Teresina (2211001); Fortaleza (2304400); Natal (2408102); João Pessoa (2507507); Recife (2611606); Maceió (2704302); Aracaju (2800308); Salvador (2927408);
# Belo Horizonte (3106200); Vitória (3205309); Rio de Janeiro (3304557); São Paulo (3550308);
# Curitiba (4106902); Florianópolis (4205407); Porto Alegre (4314902);
# Campo Grande (5002704); Cuiabá (5103403); Goiânia (5208707); Brasília (5300108);




cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapá","Palmas","São Luís","Teresina","Fortaleza","Natal","João Pessoa", "Recife",
           "Maceió","Aracaju", "Salvador","Belo Horizonte","Vitória","Rio de Janeiro","São Paulo","Curitiba","Florianópolis","Porto Alegre","Campo Grande",
           "Cuiabá", "Goiânia", "Brasília")

# codigo para 2001 a 2005
codigo<-c(1100205,1200401,1302603,1400100,1501402,1600303,1721000,2111300,2211001,2304400,2408102,2507507,2611606,2704302,2800308,2927408,3106200,3205309,
          3304557,3550308,4106902,4205407,4314902,5002704,5103403,5208707,5300108)

estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")




setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/DATASUS/TABWin/Arquivos dbc_dbf_csv/Brasil")

ano <- seq(2005,2016,1)

for (i in 1:length(ano)){
  
  for (j in 1:length(estado)) {
    
    dados<-read.csv(paste0("DO",estado[j],ano[i],".csv"))%>% select(IDADE,ESC,SEXO,RACACOR,CODMUNRES,CODMUNOCOR,CAUSABAS) %>% filter(str_detect(CAUSABAS, "V"))
    
    write_xlsx(dados,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/",estado[j],ano[i],".xlsx"))
    print(paste0(estado[j],ano[i]))
  }
}


setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/")

for (i in 1:length(ano)){
  
  dados1<-read_xlsx(paste0("AC",ano[i],".xlsx"))
  dados2<-read_xlsx(paste0("AL",ano[i],".xlsx"))
  dados3<-read_xlsx(paste0("AM",ano[i],".xlsx"))
  dados4<-read_xlsx(paste0("AP",ano[i],".xlsx"))
  dados5<-read_xlsx(paste0("BA",ano[i],".xlsx"))
  dados6<-read_xlsx(paste0("CE",ano[i],".xlsx"))
  dados7<-read_xlsx(paste0("ES",ano[i],".xlsx"))
  dados8<-read_xlsx(paste0("GO",ano[i],".xlsx"))
  dados9<-read_xlsx(paste0("MA",ano[i],".xlsx"))
  dados10<-read_xlsx(paste0("MG",ano[i],".xlsx"))
  dados11<-read_xlsx(paste0("MS",ano[i],".xlsx"))
  dados12<-read_xlsx(paste0("MT",ano[i],".xlsx"))
  dados13<-read_xlsx(paste0("PA",ano[i],".xlsx"))
  dados14<-read_xlsx(paste0("PB",ano[i],".xlsx"))
  dados15<-read_xlsx(paste0("PE",ano[i],".xlsx"))
  dados16<-read_xlsx(paste0("PI",ano[i],".xlsx"))
  dados17<-read_xlsx(paste0("PR",ano[i],".xlsx"))
  dados18<-read_xlsx(paste0("RJ",ano[i],".xlsx"))
  dados19<-read_xlsx(paste0("RN",ano[i],".xlsx"))
  dados20<-read_xlsx(paste0("RO",ano[i],".xlsx"))
  dados21<-read_xlsx(paste0("RR",ano[i],".xlsx"))
  dados22<-read_xlsx(paste0("RS",ano[i],".xlsx"))
  dados23<-read_xlsx(paste0("SC",ano[i],".xlsx"))
  dados24<-read_xlsx(paste0("SE",ano[i],".xlsx"))
  dados25<-read_xlsx(paste0("SP",ano[i],".xlsx"))
  dados26<-read_xlsx(paste0("TO",ano[i],".xlsx"))
  dados27<-read_xlsx(paste0("DF",ano[i],".xlsx"))
  
  dados.brasil<-rbind.data.frame(dados1,dados2,dados3,dados4,dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16,dados17,dados18,dados19,dados20,dados21,dados22,dados23,dados24,dados25,dados26,dados27)
  
  write_xlsx(dados.brasil,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx"))
  print(paste0("Brasil",ano[i]))
}


#########################################################################################################################
## Cuidado com o codigo do municipios de 2001 a 2005 são diferentes dos 2006 em diante, esse ultimo tem um digito a menos
#########################################################################################################################

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/")

cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belém","Macapá","Palmas","São Luís","Teresina","Fortaleza","Natal","João Pessoa", "Recife",
           "Maceió","Aracaju", "Salvador","Belo Horizonte","Vitória","Rio de Janeiro","São Paulo","Curitiba","Florianópolis","Porto Alegre","Campo Grande",
           "Cuiabá", "Goiânia", "Brasília")

codigo<-c(1100205,1200401,1302603,1400100,1501402,1600303,1721000,2111300,2211001,2304400,2408102,2507507,2611606,2704302,2800308,2927408,3106200,3205309,
          3304557,3550308,4106902,4205407,4314902,5002704,5103403,5208707,5300108)

ano <- c(2005)

for (i in 1:length(ano)) {
  
  for (j in 1:length(codigo)) {
    dados<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx"))
    
    
    ## Aqui ele filtra só para as Capitais
    dados<-dados %>% filter(CODMUNRES==codigo[j])
    ##
    
    dados0<-dados %>% filter(str_detect(CAUSABAS,"V0"))
    dados1<-dados %>% filter(str_detect(CAUSABAS,"V1"))
    dados2<-dados %>% filter(str_detect(CAUSABAS,"V2"))
    dados3<-dados %>% filter(str_detect(CAUSABAS,"V3"))
    dados4<-dados %>% filter(str_detect(CAUSABAS,"V4"))
    dados5<-dados %>% filter(str_detect(CAUSABAS,"V5"))
    dados6<-dados %>% filter(str_detect(CAUSABAS,"V6"))
    dados7<-dados %>% filter(str_detect(CAUSABAS,"V7"))
    dados9<-dados %>% filter(str_detect(CAUSABAS,"V"))
    
    junta<-rbind.data.frame(dados2,dados4,dados5,dados6,dados7)
    junta2<-rbind.data.frame(dados2,dados4,dados5,dados6,dados7) %>% filter(str_detect(CAUSABAS,"5$"))
    junta3<-rbind.data.frame(dados0,dados1,dados2,dados3,dados4,dados5,dados6,dados7)
    
    
    #  dados2<-dados %>% filter(str_detect(CAUSABAS,"V2"))
    #  dados3<-dados %>% filter(str_detect(CAUSABAS,"V4"))
    #  dados4<-dados %>% filter(str_detect(CAUSABAS,"V5"))
    #  dados5<-dados %>% filter(str_detect(CAUSABAS,"V6"))
    #  dados6<-dados %>% filter(str_detect(CAUSABAS,"V7"))
    #  dados7<-dados %>% filter(str_detect(CAUSABAS,"V"))
    #  dados8<-dados %>% filter(str_detect(CAUSABAS,"V0"))
    #  dados9<-dados %>% filter(str_detect(CAUSABAS,"V1"))
    #  dados10<-dados %>% filter(str_detect(CAUSABAS,"V3"))
    #  dados11<-dados %>% filter(str_detect(CAUSABAS,"V8"))
    
    #  junta<-rbind.data.frame(dados2,dados3,dados4,dados5,dados6)
    #  junta2<-rbind.data.frame(dados2,dados3,dados4,dados5,dados6) %>% filter(str_detect(CAUSABAS,"5$"))
    #  junta3<-rbind.data.frame(dados2,dados3,dados4,dados5,dados6,dados8,dados9,dados10)
    
    
    write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(junta2, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    
    write_xlsx(dados0, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados2, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados4, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados5, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V5/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados6, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V6/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados7, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados9, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    
    write_xlsx(junta3, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    
    print(paste0(estado[j],"-",cidades[j],ano[i]))
    
  }
}

ano <- seq(2006,2016,1)

# codigo para 2006 a 2018
codigo<-c(110020,120040,130260,140010,150140,160030,172100,211130,221100,230440,240810,250750,261160,270430,280030,292740,310620,320530,
          330455,355030,410690,420540,431490,500270,510340,520870,530010)

for (i in 1:length(ano)) {
  
  for (j in 1:length(codigo)) {
    dados<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/Brasil",ano[i],".xlsx"))
    
    
    dados<-dados %>% filter(CODMUNRES==codigo[j])
    
    
    dados0<-dados %>% filter(str_detect(CAUSABAS,"V0"))
    dados1<-dados %>% filter(str_detect(CAUSABAS,"V1"))
    dados2<-dados %>% filter(str_detect(CAUSABAS,"V2"))
    dados3<-dados %>% filter(str_detect(CAUSABAS,"V3"))
    dados4<-dados %>% filter(str_detect(CAUSABAS,"V4"))
    dados5<-dados %>% filter(str_detect(CAUSABAS,"V5"))
    dados6<-dados %>% filter(str_detect(CAUSABAS,"V6"))
    dados7<-dados %>% filter(str_detect(CAUSABAS,"V7"))

    dados9<-dados %>% filter(str_detect(CAUSABAS,"V"))
    
    junta<-rbind.data.frame(dados2,dados4,dados5,dados6,dados7)
    junta2<-rbind.data.frame(dados2,dados4,dados5,dados6,dados7) %>% filter(str_detect(CAUSABAS,"5$"))
    junta3<-rbind.data.frame(dados0,dados1,dados2,dados3,dados4,dados5,dados6,dados7)
    
    
    write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(junta2, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    
    write_xlsx(dados0, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados2, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados4, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados5, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V5/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados6, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V6/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados7, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    write_xlsx(dados9, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    
    write_xlsx(junta3, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/",estado[j],"-",cidades[j],ano[i],".xlsx"))
    
    print(paste0(estado[j],"-",cidades[j],ano[i]))
    
  }
}
