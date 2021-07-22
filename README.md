# Challenge - CustomerSuccess Balancing

Desafio consiste em um sistema de balanceamento entre clientes e Customer Success (CSs). Os CSs são os Gerentes de Sucesso, são responsáveis pelo acompanhamento estratégico dos clientes.

Dependendo do tamanho do cliente - aqui nos referimos ao tamanho da empresa - nós temos que colocar CSs mais experientes para atendê-los.

Um CS pode atender mais de um cliente e além disso os CSs também podem sair de férias, tirar folga, ou mesmo ficarem doentes. É preciso levar esses critérios em conta na hora de rodar a distribuição.

Dado este cenário, o sistema distribui os clientes com os CSs de capacidade de atendimento mais próxima (maior) ao tamanho do cliente.

## Exemplo
Se temos 6 clientes com os seguintes níveis: 20, 30, 35, 40, 60, 80 e dois CSs de níveis 50 e 100, o sistema deveria distribui-los da seguinte forma:

20, 30, 35, 40 para o CS de nível 50
60 e 80 para o CS de nível 100
Sendo n o número de CSs, m o número de clientes e t o número de abstenções de CSs, calcular quais clientes serão atendidos por quais CSs de acordo com as regras apresentadas.

## Tecnologias

Utilizado as seguintes linguagens abaixo:

- Go
- JavaScript
- Ruby

## Caminho dos projetos:

* Os códigos em GO se encontram em **/go**
* Os códigos em JavaScript se encontram em **/js**
* Os códigos em Ruby se encontram em **/ruby**
