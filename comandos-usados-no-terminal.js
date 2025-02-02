// ruby -v

// rails - v

// rails new notebook-api -T --database=postgresql --api (para criar uma API rails com postgresql)

// rails g scaffold Contact name:string email:string birthdate:date

// rails db:migrate (antes, importante configurar o database.yml para conectar ao banco de dados)

// http://localhost:3000/rails/info/routes (no navegador, para acessar as rotas)

// rails g task dev setup (para criar tasks - que são parecidos com scripts do package json node.js)

// rails dev:<nome-da-task(que no caso é setup)> (para rodar o script que está no arquivo dev.rake)

// acessar http://localhost:3000/contacts (para ver os contatos gerados nessa task citada acima)

// rails g scaffold Kind description:string

// rails g migration add_kind_to_contact kind:references (para adicionar o campo kind_id na tabela Contact, referenciando-o com a tabela Kind)

// rails db:migrate para enviar as alterações acima ao banco de dados
// (
//    CASO DÊ ERRO:
//      rails db:migrate:down VERSION=20250202220907 (para derrubar a última migration)
// 
//      rails db:drop db:create db:migrate dev:setup (para RESETAR o banco de dados)
// )


