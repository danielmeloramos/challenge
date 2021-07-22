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

## Dependências

As dependências do front-end são gerenciadas utilizando o NPM ou Yarn.
Além disso, o **Git** é utilizado como o sistema de controle de versão de arquivos.

As instruções a seguir assumem que você utiliza o **Windows** como o sistema operacional.

1. Instalar o Git

    Para instalar o Git é necessário fazer o download do instalador [disponível aqui](https://git-for-windows.github.io/).
    Utilizar as configurações padrão do instalador é a melhor opção.

## Obter o projeto

O projeto possui um repositório Git central no Github [disponível aqui](https://github.com/danielmeloramos/challenge.git).
Através da linha de comando clone o repositório executando o seguinte comando:

```bash
> git clone https://github.com/danielmeloramos/challenge.git
```

Desta forma você baixará o repositório git para sua máquina local na pasta **challenge**.

## Caminho dos projetos:

* Os códigos em GO se encontram em **/go**
* Os códigos em JavaScript se encontram em **/js**
* Os códigos em Ruby se encontram em **/ruby**
