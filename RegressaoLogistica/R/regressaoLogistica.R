#carregando os dados
eleicao = read.csv("/home/audrey/Área de Trabalho/ds-udemy/RegressaoLogistica/dados/Eleicao.csv", sep = ';', header = T)
eleicao

#gráfico e visualização
plot(eleicao$DESPESAS, eleicao$SITUACAO)
summary(eleicao)

#correlação
cor(eleicao$DESPESAS, eleicao$SITUACAO)

#modelo de regressão logística
modelo = glm(SITUACAO~DESPESAS, data = eleicao, family = "binomial")
summary(modelo)

#modelo comparado aos dados
plot(eleicao$DESPESAS, eleicao$SITUACAO, col='red', pch=20)
points(eleicao$DESPESAS, modelo$fitted, pch=4) 

#testando o modelo com os próprios candidatos
prever = predict(modelo, newdata = eleicao, type = "response")
prever = prever >= 0.5
prever

#avaliando performance
confusao = table(prever, eleicao$SITUACAO)
confusao
taxa_acerto = (confusao[1] + confusao [4]) / sum(confusao)
taxa_acerto

#novos candidatos
prevereleicao = read.csv("/home/audrey/Área de Trabalho/ds-udemy/RegressaoLogistica/dados/NovosCandidatos.csv", sep = ';', header = T)
prevereleicao

#previsão
prevereleicao$RESULT = predict(modelo, newdata = prevereleicao, type = "response")
prevereleicao$RESULT
prevereleicao$RESULT >= 0.5