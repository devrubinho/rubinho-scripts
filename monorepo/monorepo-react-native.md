# Anotações - Monorepo com React Native

## Passo 33
Dentro de
packages
rodar no terminal:
```npx react-native init mobile --template react-native-template-typescript```

## Passo 34
Usar o buscador do vs code para procurar por

../node_modules

e adicionar 

../../ 

antes das importações para as importações refletirem para o node_modules da raiz do projeto.

Obs: só alterar arquivos que tá dentro da pasta mobile e verificar e somente onde tiver ../node_modules, ficando assim após a alteração:

../../../node_modules

## Passo 35
Dentro de
packages > mobile > metro.config.js
adicionar

```const path = require('path');```

fora do modules.exports

e adicionar

```
projectRoot: path.resolve(__dirname, '.'),
watchFolders: [path.resolve(__dirname, '../../node_modules')],
```

dentro de modules.exports, antes de transformer.

Dica: ver anexo 4 se ficar com dúvidas

## Passo 36
Dentro de 
packages > mobile > ios > Podfile
alterar linha que tem use_react_native para:

```use_react_native!(:path => '../../../node_modules/react-native')```

Obs: basta mudar após path => 

## Passo 37
Alterar o nome do projeto mobile para
@NOME_DO_PROJETO/mobile em
packages > mobile > package.json

## Passo 38
Criar pasta
packages > mobile > src

## Passo 39
Dentro de
packages > mobile > src
criar arquivo
packages > mobile > src > App.tsx

## Passo 40
Dentro de
packages > mobile > src > App.tsx
Colocar:

```
import React from 'react';

import {View} from 'react-native';

const App: React.FC = () => <View style={{flex: 1, backgroundColor: '#000'}} />;

export default App;

```

## Passo 41
Excluir
packages > mobile > App.tsx

## Passo 42
dentro de index trocar a importação de App para:

```import App from './src/App';```

## Passo 43
Dentro de
packages > mobile
rode no terminal:

```yarn android```
```yarn start```

para testar se o mobile está funcionando

## Passo 60
Dentro de
packages > mobile
excluir arquivos .eslintrc.js e prettier.config.js

## Passo 61
Dentro de
packages > mobile > package.json

excluir as seguintes linhas:

```"lint": "eslint . --ext .js,.jsx,.ts,.tsx"```
```"eslint": "^6.5.1",```
```"typescript": "^3.8.3"```
```"prettier": "^2.0.4",```
```"@typescript-eslint/parser": "^2.27.0",```
```"@typescript-eslint/eslint-plugin": "^2.27.0",```
```"@react-native-community/eslint-config": "^1.1.0",```

## Passo 62
Dentro de
packages > mobile
rodar no terminal:

`yarn`

## Passo 67
Dentro de
packages > mobile
remover pasta __tests__
pois por enquanto não configuramos os testes ainda no mobile

## Passo 72
Dentro de
packages > mobile > tsconfig.json
alterar todo o conteúdo para:

```
{
  "extends": "../../tsconfig.json",
  "compilerOptions": {
    "lib": ["esnext", "dom"],   
    "allowJs": false,          
    "checkJs": false,         
    "jsx": "react-native"
  },
  "include": [
    "./src/**/*"
  ]
}
```