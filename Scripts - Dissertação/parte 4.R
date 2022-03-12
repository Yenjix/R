library(dplyr)
library(readxl)
library(writexl)
library(stringr)
library(lubridate)

## Juntando as variaveis Frota de Veiculo, Populaçao a base e IDH Municipal

## Frota de Veiculos


setwd("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/")

cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belem","Macapa","Palmas","Sao Luis","Teresina","Fortaleza","Natal","Joao Pessoa", "Recife",
           "Maceio","Aracaju", "Salvador","Belo Horizonte","Vitoria","Rio de Janeiro","Sao Paulo","Curitiba","Florianopolis","Porto Alegre","Campo Grande",
           "Cuiaba", "Goiania", "Brasilia")

cidades<-toupper(cidades)

ano=seq(2005,2016,1)

i=1
j=1
w=1


municipio<-NULL
df<-NULL
frota<-NULL

estado<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS","MT","GO","DF")
df<-as.data.frame(df)

for (i in 1:length(ano)) {
  
  a<-read_xlsx(paste0(ano[i],".xlsx"))
  
  for (j in 1:length(cidades)) {
    
    for (w in 6:nrow(a)) {
      
      if ( (a[w,2] == cidades[j]) & (a[w,1] == estado[j]) ){
        
        frota[j]=as.numeric(a[w,3])
        municipio[j]=cidades[j]
        
        print(paste0(cidades[j],ano[i]))
        break
      }
      
    }
  }
  
  df<-data.frame(municipio,frota)
  write_xlsx(df,paste0("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/",ano[i],".xlsx"))
}



## Populaçao Municipal

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/")

cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belem","Macapa","Palmas","Sao Luis","Teresina","Fortaleza","Natal","Joao Pessoa", "Recife",
           "Maceio","Aracaju", "Salvador","Belo Horizonte","Vitoria","Rio de Janeiro","Sao Paulo","Curitiba","Florianopolis","Porto Alegre","Campo Grande",
           "Cuiaba", "Goiania", "Brasilia")

codigo<-c(1100205,1200401,1302603,1400100,1501402,1600303,1721000,2111300,2211001,2304400,2408102,2507507,2611606,2704302,2800308,2927408,3106200,3205309,
          3304557,3550308,4106902,4205407,4314902,5002704,5103403,5208707,5300108)

ano=seq(2005,2016,1)

i=1
j=1
w=1

municipio<-NULL
pop<-NULL
df<-NULL


a<-read_xls("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/ESTIMA_PO.2000-2018.xls")

for (i in 1:length(ano)) {
  
  for (j in 1:length(codigo)) {
    
    for (w in 2:nrow(a)) {
      
      if (a[w,20] == codigo[j]){
        
        pop[j]<-as.numeric(a[w,i+2])
        municipio[j]=cidades[j]
        
        print(paste0(cidades[j],ano[i]))
        
      }
    }
  }
  
  df<-data.frame(municipio,pop)
  write_xlsx(df,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/",ano[i],".xlsx"))
}



## IDH Municipal

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/")

cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belem","Macapa","Palmas","Sao Luis","Teresina","Fortaleza","Natal","Joao Pessoa", "Recife",
           "Maceio","Aracaju", "Salvador","Belo Horizonte","Vitoria","Rio de Janeiro","Sao Paulo","Curitiba","Florianopolis","Porto Alegre","Campo Grande",
           "Cuiaba", "Goiania", "Brasilia")


codigo2<-c(110020,120040,130260,140010,150140,160030,172100,211130,221100,230440,240810,250750,261160,270430,280030,292740,310620,320530,
          330455,355030,410690,420540,431490,500270,510340,520870,530010)

ano=seq(2005,2016,1)

i=1
j=1
w=1

municipio<-NULL
idh<-NULL
df<-NULL


a<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/IFDM Educação.xlsx")

for (i in 1:length(ano)) {
  
  for (j in 1:length(codigo)) {
    
    for (w in 2:(nrow(a)-1)) {
      
      if (a[w,1] == codigo[j]){
        
        idh[j]<-as.numeric(a[w,i+4])
        municipio[j]=cidades[j]
        
        print(paste0(cidades[j],ano[i]))
        
      }
    }
  }
  
  df<-data.frame(municipio,idh)
  write_xlsx(df,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/",ano[i],".xlsx"))
}


## PIB per capita

setwd("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/")

cidades<-c("Porto Velho","Rio Branco", "Manaus","Boa Vista","Belem","Macapa","Palmas","Sao Luis","Teresina","Fortaleza","Natal","Joao Pessoa", "Recife",
           "Maceio","Aracaju", "Salvador","Belo Horizonte","Vitoria","Rio de Janeiro","Sao Paulo","Curitiba","Florianopolis","Porto Alegre","Campo Grande",
           "Cuiaba", "Goiania", "Brasilia")

codigo1<-c(1100205,1200401,1302603,1400100,1501402,1600303,1721000,2111300,2211001,2304400,2408102,2507507,2611606,2704302,2800308,2927408,3106200,3205309,
           3304557,3550308,4106902,4205407,4314902,5002704,5103403,5208707,5300108)

ano1=seq(2005,2009,1)
ano2=seq(2010,2016,1)

municipio<-NULL
df<-NULL
pib.per.capita<-NULL
i=1
j=1
w=1

a<-read_xls("PIB dos Municípios - base de dados 2002-2009.xls")
b<-read_xls("PIB dos Municípios - base de dados 2010-2017.xls")


for (i in 1:length(ano1)) {
  
  for (j in 1:length(codigo1)) {
    
    #Tem 5560 cidades por ano, 5560x3 = 16680, p ele começar a procurar de 2005 em diante, só colocar em a[16681,1]
    #Tem q fazer um codigo de acordo com o ano q ele ta, se n vai demorar muito p fazer tudo
    #2005 começa em a[16681,1] e acaba em 22244
    #2006 começa em a[22245,1] e acaba em 27809
    #aumentou 3 cidades em 2005, wtf, total de 5563. e em 2006 aumentou mais uma... Vou colocar um cap de 5570 por loop, q eh o total de cdd no Brasil em 2020
    for (w in (5560*(2+i)):(5570*(3+i))){
      
      if((a[w,1]==ano[i] && a[w,7]==codigo1[j])){
        pib.per.capita[j]<-as.numeric(a[w,40])
        municipio[j]<-cidades[j]
        
        print(paste0(cidades[j],ano1[i]))
        break
      }
      
    }
    
  }
  
  df<-data.frame(ano1[i],municipio,pib.per.capita)
  write_xlsx(df,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/",ano1[i],".xlsx"))
}

municipio<-NULL
df<-NULL
pib.per.capita<-NULL
i=1
j=1
w=1

for (i in 1:length(ano2)) {
  
  for (j in 1:length(codigo1)) {
    
    #Tem 5560 cidades por ano, 5560x3 = 16680, p ele começar a procurar de 2005 em diante, só colocar em a[16681,1]
    #Tem q fazer um codigo de acordo com o ano q ele ta, se n vai demorar muito p fazer tudo
    #2010 começa em a[1,1] e acaba em 5565
    #2011 começa em a[5566,1] e acaba em 11130
    #aumentou 3 cidades em 2005, wtf, total de 5563. e em 2006 aumentou mais uma... Vou colocar um cap de 5570 por loop, q eh o total de cdd no Brasil em 2020
    #(w in (5560*(i-1)+1):(5570*(i)))
    for (w in (5560*(i-1)+1):(5570*(i))){
      
      if((b[w,1]==ano2[i] && b[w,7]==codigo1[j])){
        pib.per.capita[j]<-as.numeric(b[w,40])
        municipio[j]<-cidades[j]
        
        print(paste0(cidades[j],ano2[i]))
        break
      }
      
    }
    
  }
  
  df<-data.frame(ano2[i],municipio,pib.per.capita)
  write_xlsx(df,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/",ano2[i],".xlsx"))
}

## Add ano nas data frames

for (i in 1:length(ano)) {
  a<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/",ano[i],".xlsx"))
  b<-read_xlsx(paste0("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/",ano[i],".xlsx"))
  c<-read_xlsx(paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/",ano[i],".xlsx"))
  
  a$ano<-ano[i]
  b$ano<-ano[i]
  c$ano<-ano[i]
  
  write_xlsx(a,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/",ano[i],".xlsx"))
  write_xlsx(b,paste0("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/",ano[i],".xlsx"))
  write_xlsx(c,paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/",ano[i],".xlsx"))
  
  print(ano[i])
}


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/População/OK/2016.xlsx")


junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx"))


dados5<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2005.xlsx")
dados6<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2006.xlsx")
dados7<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2007.xlsx")
dados8<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2008.xlsx")
dados9<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2009.xlsx")
dados10<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2010.xlsx")
dados11<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2011.xlsx")
dados12<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2012.xlsx")
dados13<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2013.xlsx")
dados14<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2014.xlsx")
dados15<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2015.xlsx")
dados16<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/2016.xlsx")

junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)

write_xlsx(junta, paste0("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx"))


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2005.xlsx")
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2006.xlsx")
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2007.xlsx")
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2008.xlsx")
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2009.xlsx")
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2010.xlsx")
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2011.xlsx")
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2012.xlsx")
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2013.xlsx")
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2014.xlsx")
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2015.xlsx")
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/2016.xlsx")


junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx"))


dados5<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2005.xlsx") %>% rename("ano"=ano1.i.)
dados6<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2006.xlsx") %>% rename("ano"=ano1.i.)
dados7<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2007.xlsx") %>% rename("ano"=ano1.i.)
dados8<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2008.xlsx") %>% rename("ano"=ano1.i.)
dados9<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2009.xlsx") %>% rename("ano"=ano1.i.)
dados10<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2010.xlsx") %>% rename("ano"=ano2.i.)
dados11<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2011.xlsx") %>% rename("ano"=ano2.i.)
dados12<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2012.xlsx") %>% rename("ano"=ano2.i.)
dados13<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2013.xlsx") %>% rename("ano"=ano2.i.)
dados14<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2014.xlsx") %>% rename("ano"=ano2.i.)
dados15<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2015.xlsx") %>% rename("ano"=ano2.i.)
dados16<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2016.xlsx") %>% rename("ano"=ano2.i.)

junta<-rbind.data.frame(dados5,dados6,dados7,dados8,dados9,dados10,dados11,dados12,dados13,dados14,dados15,dados16)

write_xlsx(junta, paste0("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/PIB per capita2005-2016.xlsx"))


a<-read_xlsx("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/PIB per capita2005-2016.xlsx")
b<-read_xls("B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/ipeadata.xls")
df<-data.frame(PIB.REAL.P.Corrente.2016=double())


ano<-seq(2005,2016,1)

i=1
j=1
for (i in 1:length(ano)) {
  
  for (j in 1:nrow(a) ) {
    
    if(a[j,1]==b[i,4]){
      df[j,1] <- as.numeric(a[j,3]*b[i,6])
    }
    
  }
}

a<-cbind(a,df)
write_xlsx(a,"B:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2005-2016.Preço de 2016.real.xlsx")

