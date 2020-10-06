# Anotações de Styled Components (web)

## Criar projeto React

`npx create-react-app web --template typescript`

## Passo 1
na raiz
excluir arquivo readme

## Passo 2
Excluir arquivos desnecessários de
src
deixando somente os arquivos que aparecem no anexo 1

## Passo 3
Trocar conteúdo de
src > index.tsx
por: 

```
import React from "react";
import ReactDOM from "react-dom";
import App from "./App";

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
document.getElementById("root")
);
```

## Passo 4
Trocar conteúdo de
src > App.tsx
por:

```
import React from 'react';

const App: React.FC = () => <h1>Projeto vazio</h1>

export default App;
```

## Passo 5
Excluir arquivos desnecessários de
public
deixando somente os arquivos que aparecem no anexo 2

## Passo 6
Dentro de 
public > index.html
excluir linhas desnecessárias deixando apenas as linhas que aparecem no anexo 3 e a tag description.

## Passo 7

`yarn add styled-components`

`yarn add @types/styled-components -D`

## Passo 8

Dentro de src criar pasta styles e dentro um arquivo global.ts para estilizar globalmente a aplicação
src > styles > global.ts

## Passo 9

dentro do arquivo criado no passo anterior colocar:

```
import { createGlobalStyle } from 'styled-components'

export default createGlobalStyle`
* {
  margin: 0;
  padding: 0;
  outline: 0;
  box-sizing: border-box;
}

body {
  background: #F0F0F5;
  -webkit-font-smoothing: antialiased;
}

body, input, button {
  font: 16px Roboto, sans-serif;
}

#root {
  max-width: 960px;
  margin: 0 auto;
  padding: 40px 20px;
}

button {
  cursor: pointer;
}
`
```

## Passo 10
Alterar
App.tsx
para:

```
import React from 'react'

import GlobalStyle from './styles/global'

const App: React.FC = () => (
  <>
    <GlobalStyle />
  </>
)

export default App
```
