library(dplyr)
library(readxl)
library(writexl)
library(stringr)
library(lubridate)
###################################################################################################################################################################
###################################################################################################################################################################

### Juntando as Bases || Para V0-V07

#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016

a<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx")
b<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx")
c<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-V7/OK/OK2/Capitais2005-2016.xlsx")
f<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx")
g<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2005-2016.Preço de 2016.real.xlsx")
i<-c(-1,-2,-3)
g<-g[,i]

d<-data.frame(a,b,c,f,g)

write_xlsx(d,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V0-V7/ProntoV0-V07-2005-2016.xlsx")

## Esse indices foram vistos no trabalho de Kilsztajn (2001) [meu pdf ta com o nome: 2001 - Brasil e mundo - MQO Ln]
## Outro artigo importante é o: Mello Jorge, M. H. P. & Latorre, M. R. D. O. (1994). [meu pdf ta com o nome: 1994 - Capitais Analise Descritiva]
## Nesse último ele fala dessa base de dados do SIM/DATASUS, bem detalhado, ler!

## Calculando indice de mortalidade em acidente para 100mil habitantes
e<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V0-V7/ProntoV0-V07-2005-2016.xlsx")
e$indice.ob.100k.hab<-(e$ob/e$pop)*10^5

## Calculando indice de Veiculos p/ 10 hab
e$indice.frota.10.hab<-(e$frota/e$pop)*10

## Calculando indice de obitos para 10.000 veiculos
e$indice.ob.10k.frota<-(e$ob/e$frota)*10^4

e[,1]=e[,4]
i<-c(-3,-4,-6,-9,-11)
e<-e[,i]
e<- e %>%  rename("ano"=ano.3)

##Dummy por Região
##Região Norte
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^1")){
    e$Norte[i]=c(1)
  } else {e$Norte[i]=c(0)}
}
##Região Nordeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^2")){
    e$Nordeste[i]=c(1)
  } else {e$Nordeste[i]=c(0)}
}
##Região Sudeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^3")){
    e$Sudeste[i]=c(1)
  } else {e$Sudeste[i]=c(0)}
}
##Região Sul
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^4")){
    e$Sul[i]=c(1)
  } else {e$Sul[i]=c(0)}
}
##Região Centro-Oeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^5")){
    e$CentroOeste[i]=c(1)
  } else {e$CentroOeste[i]=c(0)}
}

write_xlsx(e,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V0-V7/ProntoV0-V07-2005-2016.xlsx")

###################################################################################################################################################################
###################################################################################################################################################################

### Juntando as Bases || Para V2-V4-V5-V6-V7

#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx

a<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx")
b<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx")
c<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V-2-4-5-6-7/OK/OK2/Capitais2005-2016.xlsx")
f<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx")
g<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2005-2016.Preço de 2016.real.xlsx")
i<-c(-1,-2,-3)
g<-g[,i]

d<-data.frame(a,b,c,f,g)

write_xlsx(d,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V-2-4-5-6-7/ProntoV0-V07-2005-2016.xlsx")

## Esse indices foram vistos no trabalho de Kilsztajn (2001) [meu pdf ta com o nome: 2001 - Brasil e mundo - MQO Ln]
## Outro artigo importante é o: Mello Jorge, M. H. P. & Latorre, M. R. D. O. (1994). [meu pdf ta com o nome: 1994 - Capitais Analise Descritiva]
## Nesse último ele fala dessa base de dados do SIM/DATASUS, bem detalhado, ler!

## Calculando indice de mortalidade em acidente para 100mil habitantes
e<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V-2-4-5-6-7/ProntoV0-V07-2005-2016.xlsx")
e$indice.ob.100k.hab<-(e$ob/e$pop)*10^5

## Calculando indice de Veiculos p/ 10 hab
e$indice.frota.10.hab<-(e$frota/e$pop)*10

## Calculando indice de obitos para 10.000 veiculos
e$indice.ob.10k.frota<-(e$ob/e$frota)*10^4

e[,1]=e[,4]
i<-c(-3,-4,-6,-9,-11)
e<-e[,i]
e<- e %>% rename("municipio"=municipio...1) %>% rename("ano"=ano...13)

##Dummy por Região
##Região Norte
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^1")){
    e$Norte[i]=c(1)
  } else {e$Norte[i]=c(0)}
}
##Região Nordeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^2")){
    e$Nordeste[i]=c(1)
  } else {e$Nordeste[i]=c(0)}
}
##Região Sudeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^3")){
    e$Sudeste[i]=c(1)
  } else {e$Sudeste[i]=c(0)}
}
##Região Sul
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^4")){
    e$Sul[i]=c(1)
  } else {e$Sul[i]=c(0)}
}
##Região Centro-Oeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^5")){
    e$CentroOeste[i]=c(1)
  } else {e$CentroOeste[i]=c(0)}
}

write_xlsx(e,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V-2-4-5-6-7/ProntoV-2-4-5-6-7-2005-2016.xlsx")
print("ProntoV-2-4-5-6-7-2005-2016")

###################################################################################################################################################################
###################################################################################################################################################################

### Juntando as Bases || Para V2-V4-V5-V6-V7_5 

#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx

a<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx")
b<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx")
c<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V_5/OK/OK2/Capitais2005-2016.xlsx")
f<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx")
g<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2005-2016.Preço de 2016.real.xlsx")
i<-c(-1,-2,-3)
g<-g[,i]

d<-data.frame(a,b,c,f,g)

write_xlsx(d,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V_5/ProntoV_5-2005-2016.xlsx")

## Esse indices foram vistos no trabalho de Kilsztajn (2001) [meu pdf ta com o nome: 2001 - Brasil e mundo - MQO Ln]
## Outro artigo importante é o: Mello Jorge, M. H. P. & Latorre, M. R. D. O. (1994). [meu pdf ta com o nome: 1994 - Capitais Analise Descritiva]
## Nesse último ele fala dessa base de dados do SIM/DATASUS, bem detalhado, ler!

## Calculando indice de mortalidade em acidente para 100mil habitantes
e<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V_5/ProntoV_5-2005-2016.xlsx")
e$indice.ob.100k.hab<-(e$ob/e$pop)*10^5

## Calculando indice de Veiculos p/ 10 hab
e$indice.frota.10.hab<-(e$frota/e$pop)*10

## Calculando indice de obitos para 10.000 veiculos
e$indice.ob.10k.frota<-(e$ob/e$frota)*10^4

e[,1]=e[,4]
i<-c(-3,-4,-6,-9,-11)
e<-e[,i]
e<- e %>% rename("municipio"=municipio...1) %>% rename("ano"=ano...13)

##Dummy por Região
##Região Norte
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^1")){
    e$Norte[i]=c(1)
  } else {e$Norte[i]=c(0)}
}
##Região Nordeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^2")){
    e$Nordeste[i]=c(1)
  } else {e$Nordeste[i]=c(0)}
}
##Região Sudeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^3")){
    e$Sudeste[i]=c(1)
  } else {e$Sudeste[i]=c(0)}
}
##Região Sul
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^4")){
    e$Sul[i]=c(1)
  } else {e$Sul[i]=c(0)}
}
##Região Centro-Oeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^5")){
    e$CentroOeste[i]=c(1)
  } else {e$CentroOeste[i]=c(0)}
}

write_xlsx(e,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V_5/ProntoV_5-2005-2016.xlsx")
print("Pronto-V_5-2005-2016")

###################################################################################################################################################################
###################################################################################################################################################################

### Juntando as Bases || Para V2 - Motocicleta

#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx

a<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx")
b<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx")
c<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V2/OK/OK2/Capitais2005-2016.xlsx")
f<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx")
g<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2005-2016.Preço de 2016.real.xlsx")
i<-c(-1,-2,-3)
g<-g[,i]

d<-data.frame(a,b,c,f,g)

write_xlsx(d,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V2/ProntoV2-2005-2016.xlsx")

## Esse indices foram vistos no trabalho de Kilsztajn (2001) [meu pdf ta com o nome: 2001 - Brasil e mundo - MQO Ln]
## Outro artigo importante é o: Mello Jorge, M. H. P. & Latorre, M. R. D. O. (1994). [meu pdf ta com o nome: 1994 - Capitais Analise Descritiva]
## Nesse último ele fala dessa base de dados do SIM/DATASUS, bem detalhado, ler!

## Calculando indice de mortalidade em acidente para 100mil habitantes
e<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V2/ProntoV2-2005-2016.xlsx")
e$indice.ob.100k.hab<-(e$ob/e$pop)*10^5

## Calculando indice de Veiculos p/ 10 hab
e$indice.frota.10.hab<-(e$frota/e$pop)*10

## Calculando indice de obitos para 10.000 veiculos
e$indice.ob.10k.frota<-(e$ob/e$frota)*10^4

e[,1]=e[,4]
i<-c(-3,-4,-6,-9,-11)
e<-e[,i]
e<- e %>% rename("municipio"=municipio...1) %>% rename("ano"=ano...13)

##Dummy por Região
##Região Norte
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^1")){
    e$Norte[i]=c(1)
  } else {e$Norte[i]=c(0)}
}
##Região Nordeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^2")){
    e$Nordeste[i]=c(1)
  } else {e$Nordeste[i]=c(0)}
}
##Região Sudeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^3")){
    e$Sudeste[i]=c(1)
  } else {e$Sudeste[i]=c(0)}
}
##Região Sul
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^4")){
    e$Sul[i]=c(1)
  } else {e$Sul[i]=c(0)}
}
##Região Centro-Oeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^5")){
    e$CentroOeste[i]=c(1)
  } else {e$CentroOeste[i]=c(0)}
}

write_xlsx(e,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V2/ProntoV2-2005-2016.xlsx")
print("Pronto-V2-2005-2016")

###################################################################################################################################################################
###################################################################################################################################################################

### Juntando as Bases || Para V4 - Automóvel

#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx

a<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx")
b<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx")
c<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V4/OK/OK2/Capitais2005-2016.xlsx")
f<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx")
g<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2005-2016.Preço de 2016.real.xlsx")
i<-c(-1,-2,-3)
g<-g[,i]

d<-data.frame(a,b,c,f,g)

write_xlsx(d,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V4/ProntoV4-2005-2016.xlsx")

## Esse indices foram vistos no trabalho de Kilsztajn (2001) [meu pdf ta com o nome: 2001 - Brasil e mundo - MQO Ln]
## Outro artigo importante é o: Mello Jorge, M. H. P. & Latorre, M. R. D. O. (1994). [meu pdf ta com o nome: 1994 - Capitais Analise Descritiva]
## Nesse último ele fala dessa base de dados do SIM/DATASUS, bem detalhado, ler!

## Calculando indice de mortalidade em acidente para 100mil habitantes
e<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V4/ProntoV4-2005-2016.xlsx")
e$indice.ob.100k.hab<-(e$ob/e$pop)*10^5

## Calculando indice de Veiculos p/ 10 hab
e$indice.frota.10.hab<-(e$frota/e$pop)*10

## Calculando indice de obitos para 10.000 veiculos
e$indice.ob.10k.frota<-(e$ob/e$frota)*10^4

e[,1]=e[,4]
i<-c(-3,-4,-6,-9,-11)
e<-e[,i]
e<- e %>% rename("municipio"=municipio...1) %>% rename("ano"=ano...13)

##Dummy por Região
##Região Norte
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^1")){
    e$Norte[i]=c(1)
  } else {e$Norte[i]=c(0)}
}
##Região Nordeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^2")){
    e$Nordeste[i]=c(1)
  } else {e$Nordeste[i]=c(0)}
}
##Região Sudeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^3")){
    e$Sudeste[i]=c(1)
  } else {e$Sudeste[i]=c(0)}
}
##Região Sul
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^4")){
    e$Sul[i]=c(1)
  } else {e$Sul[i]=c(0)}
}
##Região Centro-Oeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^5")){
    e$CentroOeste[i]=c(1)
  } else {e$CentroOeste[i]=c(0)}
}

write_xlsx(e,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V4/ProntoV4-2005-2016.xlsx")
print("Pronto-V4-2005-2016")

###################################################################################################################################################################
###################################################################################################################################################################

### Juntando as Bases || Para V5 - Caminhonete

###################################################################################################################################################################
###################################################################################################################################################################

### Juntando as Bases || Para V6 - Veículo de transporte Pesado

###################################################################################################################################################################
###################################################################################################################################################################

### Juntando as Bases || Para V7 - Ônibus

#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx

a<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx")
b<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx")
c<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V7/OK/OK2/Capitais2005-2016.xlsx")
f<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx")
g<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2005-2016.Preço de 2016.real.xlsx")
i<-c(-1,-2,-3)
g<-g[,i]

d<-data.frame(a,b,c,f,g)

write_xlsx(d,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V7/ProntoV7-2005-2016.xlsx")

## Esse indices foram vistos no trabalho de Kilsztajn (2001) [meu pdf ta com o nome: 2001 - Brasil e mundo - MQO Ln]
## Outro artigo importante é o: Mello Jorge, M. H. P. & Latorre, M. R. D. O. (1994). [meu pdf ta com o nome: 1994 - Capitais Analise Descritiva]
## Nesse último ele fala dessa base de dados do SIM/DATASUS, bem detalhado, ler!

## Calculando indice de mortalidade em acidente para 100mil habitantes
e<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V7/ProntoV7-2005-2016.xlsx")
e$indice.ob.100k.hab<-(e$ob/e$pop)*10^5

## Calculando indice de Veiculos p/ 10 hab
e$indice.frota.10.hab<-(e$frota/e$pop)*10

## Calculando indice de obitos para 10.000 veiculos
e$indice.ob.10k.frota<-(e$ob/e$frota)*10^4

e[,1]=e[,4]
i<-c(-3,-4,-6,-9,-11)
e<-e[,i]
e<- e %>% rename("ano"=ano.3)

##Dummy por Região
##Região Norte
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^1")){
    e$Norte[i]=c(1)
  } else {e$Norte[i]=c(0)}
}
##Região Nordeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^2")){
    e$Nordeste[i]=c(1)
  } else {e$Nordeste[i]=c(0)}
}
##Região Sudeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^3")){
    e$Sudeste[i]=c(1)
  } else {e$Sudeste[i]=c(0)}
}
##Região Sul
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^4")){
    e$Sul[i]=c(1)
  } else {e$Sul[i]=c(0)}
}
##Região Centro-Oeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^5")){
    e$CentroOeste[i]=c(1)
  } else {e$CentroOeste[i]=c(0)}
}

write_xlsx(e,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V4/ProntoV7-2005-2016.xlsx")
print("Pronto-V7-2005-2016")


## V0 - Pedestre

#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx
#Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx

a<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Dados - Frota de Veiculos/municipio/OK/Frota2005-2016.xlsx")
b<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais//População/OK/Pop2005-2016.xlsx")
c<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/Idade e Anos de Estudo/V0/OK/OK2/Capitais2005-2016.xlsx")
f<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/IDH Educação/OK/IDH Educação2005-2016.xlsx")
g<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/Capitais/PIB per capita/OK/2005-2016.Preço de 2016.real.xlsx")
i<-c(-1,-2,-3)
g<-g[,i]

d<-data.frame(a,b,c,f,g)

write_xlsx(d,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V0/ProntoV0-2005-2016.xlsx")

## Esse indices foram vistos no trabalho de Kilsztajn (2001) [meu pdf ta com o nome: 2001 - Brasil e mundo - MQO Ln]
## Outro artigo importante é o: Mello Jorge, M. H. P. & Latorre, M. R. D. O. (1994). [meu pdf ta com o nome: 1994 - Capitais Analise Descritiva]
## Nesse último ele fala dessa base de dados do SIM/DATASUS, bem detalhado, ler!

## Calculando indice de mortalidade em acidente para 100mil habitantes
e<-read_xlsx("Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V0/ProntoV0-2005-2016.xlsx")
e$indice.ob.100k.hab<-(e$ob/e$pop)*10^5

## Calculando indice de Veiculos p/ 10 hab
e$indice.frota.10.hab<-(e$frota/e$pop)*10

## Calculando indice de obitos para 10.000 veiculos
e$indice.ob.10k.frota<-(e$ob/e$frota)*10^4

e[,1]=e[,4]
i<-c(-3,-4,-6,-9,-11)
e<-e[,i]
e<- e %>% rename("ano"=ano.3)

##Dummy por Região
##Região Norte
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^1")){
    e$Norte[i]=c(1)
  } else {e$Norte[i]=c(0)}
}
##Região Nordeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^2")){
    e$Nordeste[i]=c(1)
  } else {e$Nordeste[i]=c(0)}
}
##Região Sudeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^3")){
    e$Sudeste[i]=c(1)
  } else {e$Sudeste[i]=c(0)}
}
##Região Sul
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^4")){
    e$Sul[i]=c(1)
  } else {e$Sul[i]=c(0)}
}
##Região Centro-Oeste
for (i in 1:nrow(e)) {
  if(str_detect(e$estado[i],"^5")){
    e$CentroOeste[i]=c(1)
  } else {e$CentroOeste[i]=c(0)}
}

write_xlsx(e,"Z:/Estudos/Mestrado/Mestrado - UFV 2020.1/Dissertação/Dados/OK/V0/ProntoV0-2005-2016.xlsx")
print("Pronto-V0-2005-2016")
########################################################################################################################################################################
########################################################################################################################################################################
########################################################################################################################################################################