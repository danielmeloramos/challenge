## Tecnologias

* JavaScript - É uma linguagem de programação interpretada estruturada, de script em alto nível com tipagem dinâmica fraca e multiparadigma. [Site oficial](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript)
* Jest - É um framework de teste em JavaScript projetado para garantir a correção de qualquer código JavaScript. [Site oficial](https://jestjs.io/pt-BR/)

## Organização

Todos os arquivos do projeto se encontram nesse mesmo diretório.

No diretório possui arquivo **customer-success-balancing.js**, onde está centralizado os testes.

## Dependências

As dependências do front-end são gerenciadas utilizando o NPM ou Yarn.
Além disso, o **Git** é utilizado como o sistema de controle de versão de arquivos.

As instruções a seguir assumem que você utiliza o **Windows** como o sistema operacional.

1. Instalar o NPM

    O NPM é principalmente um gerenciador de pacotes. O projeto possui um arquivo **package.json** no qual é listado todas as dependências do projeto.

    O NPM é construído com base no Node.JS e é necessário instalar o Node.JS para utilizá-lo. Como o NPM é o principal
    gerenciador de pacotes do ecossistema Node, ele vem junto com a instalação do Node no Windows.

    [Obtenha o instalador do Node.JS aqui](https://nodejs.org/en/).

    **Instale a versão 14.17.3**.

### Instalar dependências

Agora é necessário instalar as dependências do projeto, podendo ser via NPM ou Yarn.

```bash
> npm install
```

```bash
> yarn
```

Com esse comando todas as dependências listadas no package.json do projeto serão instaladas na pasta node_modules.

### Testes

```bash
> npm test
```

Esse comando utilizará o JEST para rodar os testes. Ele busca todos os arquivos terminados em **.js**
e executa os testes definidos.

Importante lembrar que esse comando não encerra ao terminar os testes, sendo que a cada alteração de arquivos os testes serão
executados novamente e o resultado exibido no console.

Para parar os testes é necessário apertar o comando **Ctrl + C**.
