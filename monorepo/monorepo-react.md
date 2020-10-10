# Anotações - Monorepo com React

## Passo 24
Dentro de
packages
rodar no terminal:

```npx create-react-app web --template typescript```

## Passo 70
Dentro de
packages > web > tsconfig.json
alterar todo o conteúdo para:

```
{
  "extends": "../../tsconfig.json",
  "compilerOptions": {
    "lib": ["esnext", "dom"],   
    "allowJs": false,          
    "checkJs": false,         
    "jsx": "react"
  },
  "include": [
    "./src/**/*"
  ]
}
```

## Passo 59
Dentro de
packages > web > package.json
excluir a tag:

```
"eslintConfig": {
  "extends": "react-app"
},
```

## Passo 25
Dentro de
packages > web
excluir arquivo readme

## Passo 26
Excluir arquivos desnecessários de
packages > web > src
deixando somente os arquivos que aparecem no anexo 1

## Passo 27
Trocar conteúdo de
packages > web > src > index.tsx
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

## Passo 28
Trocar conteúdo de
packages > web > src > App.tsx
por:

```
import React from 'react';

const App: React.FC = () => <h1>Projeto vazio</h1>

export default App;
```

## Passo 29
Excluir arquivos desnecessários de
packages > web > public
deixando somente os arquivos que aparecem no anexo 2

## Passo 30
Dentro de 
packages > web > public > index.html
excluir linhas desnecessárias deixando apenas as linhas que aparecem no anexo 3 e a tag description.

## Passo 31
Dentro de 
packages > web > package.json
alterar nome do projeto para
@NOME_DO_PROJETO/web

## Passo 32
Dentro de
packages > web
rodar no terminal:

```yarn start```

para testar a aplicação web

