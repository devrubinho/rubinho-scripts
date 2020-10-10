# Anotações de Node.js (Express.js) - Arquitetura Simples

## Passo 1:

Criar pasta do projeto e colocar gitignore dentro do node e crie o container do postgre no docker. 

## Passo 2:

rodar no terminal na raiz:
`yarn init -y`

## Passo 3:

rodar no terminal na raiz:
`yarn add express`

## Passo 4:

rodar no terminal na raiz:
`yarn add typescript -D`

## Passo 5:

rodar no terminal na raiz:
`yarn tsc --init`

## Passo 6:

criar arquivo
src > server.ts

## Passo 7:

dentro de 
tsconfig.json 
alterar as flags rootDir e outDir para:

`"outDir": "./dist",`
`"rootDir": "./src",`

## Passo 8:

dentro de 
src > server.ts 
colocar:

`import express from 'express'`

## Passo 9:

rodar no terminal na raiz:
`yarn add @types/express -D`

## Passo 10:
dentro de 
src > server.ts 
adicionar:

```
const app = express();

app.get("/", (request, response) => {
  return response.json({ message: "Hello World" });
});

app.listen(3333, () => {
  console.log("Server stated on port 3333");
});
```

## Passo 11:

rodar no terminal na raiz:
`yarn add ts-node-dev -D`

## Passo 12:

No arquivo 
package.json 
acima da tag dependecies adicionar:

```
"scripts": {
  "build": "tsc",
  "dev:server": "ts-node-dev --inspect --transpile-only --ignore-watch module_modules src/server.ts"
},
```

o script build serve para fazer build da aplicação e dev:server para rodar em ambiente de desenvolvimento.
Para rodar a aplicação use yarn dev:server

## Passo 13:

rodar no terminal na raiz:
`yarn add eslint -D`

## Passo 14:

rodar no terminal na raiz:
`yarn eslint --init`

## Passo 15:

Quando perguntar se deseja instalar com npm seleciona yes

## Passo 16:

Vai ser criado um arquivo package-lock.json, exclua esse arquivo e rode 

`yarn`

## Passo 17:

Criar arquivo
src > routes > index.ts

## Passo 18:

`yarn add -D eslint-import-resolver-typescript`

## Passo 19:

em .eslintrc.json adicionar após rules a tag:

```
"settings": {
  "import/resolver": {
    "typescript": {}
  }
}
```

## Passo 20:

em .eslintrc.json dentro de rules colocar:

```
"import/extensions": [
  "error",
  "ignorePackages",
  {
    "ts": "never"
  }
]
```

## Passo 21:

substituir todo o conteúdo de 
src > server.ts 
por:

```
import express from "express";
import routes from "./routes";

const app = express();

app.use(express.json());
app.use(routes);

app.listen(3333, () => {
  console.log("Server stated on port 3333");
});
```

## passo 22:

substituir todo o conteúdo de 
src > routes > index.ts 
por:

```
import { Router } from "express";

const routes = Router();

routes.get("/", (request, response) =>
  response.json({ message: "Hello World" })
);

export default routes;
```

## passo 23:

rodar no terminal na raiz:
`yarn add prettier eslint-config-prettier eslint-plugin-prettier -D`

## passo 24:

dentro de 
eslintrc.js on
trocar todo o extends tag por:

```
"extends": [
  "airbnb-base",
  "plugin:@typescript-eslint/recommended",
  "prettier/@typescript-eslint",
  "plugin:prettier/recommended"
],
```

## Passo 25:

dentro de plugins dentro de eslintrc adicionar:

`"prettier"`

## Passo 26:

ainda dentro de .eslintrc.json na tag rules adicionar:

```
"semi": "off",
"prettier/prettier": "error",
"class-methods-use-this": "off",
```

## Passo 27:

na raiz criar arquivo prettier.config.js

## Passo 28:

dentro do arquivo anterior criado colocar:

```
module.exports = {
  semi: false,
  singleQuote: true,
  trailingComma: "all",
  arrowParens: "avoid",
};
```

## Passo 29:

na raiz criar arquivo .eslintignore e dentro colocar:

```
/.js
node_modules
dist
```

## Passo 30:

Na raiz do projeto, criar arquivo 
ormcofig.json

## Passo 31:

`yarn add typeorm pg`

obs: o pg acima é caso utilizar postgres, para outros banco de dados procurar na documentação.

## Passo 32:

Dentro de ormconfig.json adicionar:

{
  "type": "postgres",
  "host": "localhost",
  "port": 5432,
  "username": "postgres",
  "password": "docker",
  "database": "projetodb"
}

## Passo 33:

criar arquivo
src > database > index.ts

## Passo 34:

Dentro do arquivo 
src > database > index.ts 
colocar:

```
import { createConnection } from 'typeorm'
createConnection()
```

## Passo 35:

dentro de 
src > server.ts 
trocar todo conteúdo por:

```
import express from 'express'
import routes from './routes'
import './database'

const app = express()

app.use(express.json())
app.use(routes)
app.listen(3333, () => {
  console.log('Server stated on port 3333')
})
```

## Passo 41:

rode yarn dev:server para ver se está tudo funcionando agora com o banco

`yarn dev:server`

## Passo 42:

Dentro de src > database criar pasta migrations
src > database > migrations

## Passo 43:

dentro de ormconfig.json adicionar depois da última tag:

```
"entities": ["./src/models/.ts"],
"migrations": ["./src/database/migrations/.ts"],
"cli": {
  "migrationsDir": "./src/database/migrations"
}
```

## Passo 44:

dentro de 
package.json 
na tag scripts adicionar:

`"typeorm": "ts-node-dev ./node_modules/typeorm/cli.js"`

## Passo 45:

dentro de src crie a pasta models e o arquivo User.ts
src > models > User.ts 
e adicione o conteúdo abaixo apagando o que for desnecessário

```
import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm'

@Entity('users')
class User {
  @PrimaryGeneratedColumn('uuid')
  id: string

  @Column()
  name: string

  @Column()
  email: string

  @Column()
  type: string

  @Column('boolean')
  isActive: boolean

  @Column()
  password: string

  @CreateDateColumn()
  created_at: Date

  @UpdateDateColumn()
  updated_at: Date
}

export default User
```

## Passo 46:

Agora para criar uma migration rode:

`yarn typeorm migration:create -n CreateUsers`

Obs: a parte CreateUsers depende do tipo de tabela que vc quer criar, no caso criei a tabela users

## Passo 47:

dentro da migration criada crie um script de criação de tabela, exemplo abaixo:

```
import { MigrationInterface, QueryRunner, Table } from 'typeorm'

export default class CreateUsers1587690846118 implements MigrationInterface {

public async up(queryRunner: QueryRunner): Promise<void> {

await queryRunner.createTable(

new Table({
  name: 'users',
  columns: [
    {
    name: 'id',
    type: 'uuid',
    isPrimary: true,
    generationStrategy: 'uuid',
    default: 'uuid_generate_v4()',
    },
    {
    name: 'name',
    type: 'varchar',
    isNullable: false,
    },
    {
    name: 'email',
    type: 'varchar',
    isNullable: false,
    isUnique: true,
    },
    {
    name: 'password',
    type: 'varchar',
    isNullable: false,
    },
    {
    name: 'created_at',
    type: 'timestamp',
    default: 'now()',
    },
    {
    name: 'updated_at',
    type: 'timestamp',
    default: 'now()',
    },
  ],
}),

)

}

public async down(queryRunner: QueryRunner): Promise<void> {
await queryRunner.dropTable('users')
}
}
```

## Passo 48:

`yarn typeorm migration:run`

## Passo 49:

Dentro de tsconfig.json desmarcar as opções para que fiquem habilitadas 

```
"experimentalDecorators": true,
"emitDecoratorMetadata": true
```

e desmarcar a propriedade

`"strictPropertyInitialization": false`

mas colocando false no valor pois vem como padrão true

## Passo 50:

`yarn add reflect-metadata`

## Passo 51:

substituir todo o conteúdo de server.ts por:

```
import 'reflect-metadata'
import express from 'express'
import routes from './routes'
import './database'

const app = express()

app.use(express.json())
app.use(routes)
app.listen(3333, () => {
  console.log('Server stated on port 3333')
})
```

## Passo 52:

trocar todo o conteúdo de 
src > routes > index.ts 
por:

```
import { Router } from 'express'
import usersRouter from './users.routes'

const routes = Router()

routes.use('/users', usersRouter)

export default routes
```

## Passo 53:

criar o arquivo de rotas 
src > routes > users.routes.ts 
e colocar dentro:

obs: essa rota contém apenas a criação de usuário

```
import { Router } from 'express'

import CreateUserService from '../services/CreateUserService'

const usersRouter = Router()

usersRouter.post('/', async (request, response) => {

try {

const { name, email, password } = request.body

const createUser = new CreateUserService()

const user = await createUser.execute({
name,
email,
password,
})

return response.json(user)

} catch (err) {

return response.status(400).json({ error: err.message })

}

})

export default usersRouter
```

## Passo 54:

criar pasta services dentro de src e o arquivo CreateUserService.ts

src > services > CreateUserService.ts 

e colocar dentro:

```
import { getRepository } from 'typeorm'
import User from '../models/User'

interface Request {
  name: string
  email: string
  password: string
}

class CreateUserService {

public async execute({ name, email, password }: Request): Promise<User> {

const usersRepository = getRepository(User)

const checkUserExists = await usersRepository.findOne({

where: { email },

})

if (checkUserExists) {

throw new Error(

'E-mail já existente na base de dados, tente outro e-mail.',

)

}

const user = usersRepository.create({

name,

email,

type: 'common',

isActive: true,

password,

})

await usersRepository.save(user)

return user

}

}

export default CreateUserService
```

## Passo 55:

`yarn add bcryptjs`

`yarn add @types/bcryptjs -D`

## Passo 56:

substituir conteúdo de src > routes > users.routes.ts por:

```
import { Router } from 'express'

import CreateUserService from '../services/CreateUserService'

const usersRouter = Router()

usersRouter.post('/', async (request, response) => {

try {

const { name, email, password } = request.body

const createUser = new CreateUserService()

const user = await createUser.execute({

name,

email,

password,

})

delete user.password

return response.json(user)

} catch (err) {

return response.status(400).json({ error: err.message })

}

})

export default usersRouter
```

## Passo 57: 

Substituir o conteúdo de src > services > CreateUserService.ts por:

```
import { getRepository } from 'typeorm'

import { hash } from 'bcryptjs'

import User from '../models/User'

interface Request {

name: string

email: string

password: string

}

class CreateUserService {

public async execute({ name, email, password }: Request): Promise<User> {

const usersRepository = getRepository(User)

const checkUserExists = await usersRepository.findOne({

where: { email },

})

if (checkUserExists) {

throw new Error(

'E-mail já existente na base de dados, tente outro e-mail.',

)

}

const hashedPassword = await hash(password, 8)

const user = usersRepository.create({

name,

email,

type: 'common',

isActive: true,

password: hashedPassword,

})

await usersRepository.save(user)

return user

}

}

export default CreateUserService
```