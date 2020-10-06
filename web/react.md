# Anotações de ReactJS

## Criar projeto

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

