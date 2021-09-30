#install.packages("forecast")
library(forecast)

#conhecendo os dados
AirPassengers
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)

#gráficos
plot(AirPassengers)
plot(aggregate(AirPassengers))

#gera uma janela
subst = window(AirPassengers, start=c(1960,1), end=c(1960,12))
subst
plot(subst)

#decomposição
dec = decompose(AirPassengers)
dec

attributes(dec)
dec$seasonal

#analisando os elementos da decomposição
plot(dec)
plot(dec$x)
plot(dec$seasonal)
plot(dec$trend)
plot(dec$random)

#suavização exponencial
ets = ets(AirPassengers)
ets

#previsão
previsao = forecast(ets, h = 12)
plot(previsao)

#arima
arima = auto.arima(AirPassengers)
arima

#previsão arima
previsao = forecast(arima, h=12)
plot(previsao)