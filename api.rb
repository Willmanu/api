# A proposta aqui é estudar lógica ruby para API
=begin
API é a porta de entrada do sistema.

Uma API funciona como um garçom ou um mensageiro entre dois programas
Imagine que sua aplicação é uma mesa de restaurante e o outro sistema é a cozinha: você não entra na cozinha para pegar a comida; você faz o pedido ao garçom(API), que leva a informação e traz o prato pronto de volta

Você deve usar uma API sempre que o seu sistema precisar pedir um favor (como uma informação ou uma tarefa) para outro sistema, garantindo que os dois se entendam sem precisar conhecer os segredos internos um do outro

API->Essa sigla é Application Programming Interface ( Interface de Programação de Aplicações)

Uma API deve ser usada sempre que algo, externo, ao contexto interno, da sua aplicação, precisa solicitar uma ação ou um dado de forma padronizada.
  
Se existe fronteira, usa API.
Se não existe fronteira, é regra de negócio.

Uma API tem um body(corpo) para enviar o pedido e para responder.
Este corpo é formado por uma estrutura onde os dados se acomodam:

Estruturas de dados usa → [] e {}
[] para array
{} para hash
Blocos de código → {} ou do...end
	abaixo não é uma regra para seguir a risca
 {} usa-se em blocos curtos de uma linha
  do ...end use-se em bloco mais de uma linha
	porém tanto faz, fazem a mesma coisa
=end

# Entrada de dados para manipulação no terminal usando o IRB
users = [
  { id: 1, name: 'William', active: true },
  { id: 2, name: 'Ana', active: false }
]

=begin
 o código acima foi feito para inserir dados ao sistema e fazer os testes de manipulação.
 isso é um array -> user[]
 dentro é hash{} com os dados: id, name e active o que em hash, são chamados de chaves.

 A variável users, esta recebendo um array, com dois blocos de dados hash, com suas chaves e valores.
 
 Após os dados serem inseridos, quando escrevo isso -> users[0]

 o retorno é o bloco de dados hash de chave id 1 com todos os valores
   {id: 1, name: "William", active: true}

 porque estou acessando a posição 0 do bloco de dados do array
  zero em array é a posição de numero 1

 user[0][:name]
 o retorno é
  "William"
 porque estou acessando o item 0 do array, e pedindo para trazer a chave name: do hash, que tem o valor mostrado

                           Array
 O array foi criado para lhe-dar com ordem e desempenho bruto em sequência.
 
 Ordem Garantida:
 Se você precisa que o "Item A" venha antes do "Item B" (como em uma fila ou
 lista de reprodução), o array é a escolha natural.
 
 Eficiência de Memória:
 Arrays armazenam dados de forma contígua (um ao lado do outro na memória),
 o que é muito mais "barato" para o computador processar em massa.
 
 Acesso Matemático:
 Se você quer o 10º item, o computador calcula o endereço exato instantaneamente.
 Em um Hash, ele precisaria processar uma 'chave' antes.
 
 
                               Hash
 HASH -> significa picar
 A ideia vem de uma função interna do Ruby, que pica um senha por exemplo e a espalha. Isso protege sua senha; o sistema guarda o Hash, ou seja, cada pedaço em tamanhos iguais, espalhados, e não a senha real.
 E quando acionada, o sistema sabe exatamente onde cada pedaço está, para junta-las.
 
 A ideia fora disso explicado acima, é:
 User -> é um objeto, possui nome, endereço, cpf, rg, id etc. Tudo isso junto forma esse objeto User.
 Essas informações do User são quebradas e guardadas em chaves. A chave é como se fosse uma etiqueta.
  Exemplo: cpf -> fica cpf: e dentro fica o cpf do User.
 Então quando preciso de uma informação chamo a chave especifica, o hash vai direto nesta etiqueta -> chave.
 
 Então este Hash é isso, quebra o objeto em pedaço, e quando precisa de um informação dele, chama especificamente por essa chave

 O Hash foi criado para lidar com significados e buscas rápidas por nome.
 É impossível decorar que o CPF de um usuário está no "índice 452" de um array.

 No Hash, você simplesmente pede pela chave "cpf".
 
                      HASH-> Velocidade em Grandes Dados:
 Para achar um nome em um Array de 1 milhão de itens, você teria
 que percorrer item por item (lento).
 No Hash, a busca é praticamente instantânea, não importa o tamanho da lista.
 
                      Dados Esparsos:
 No contexto geral, esparsos significa algo que está espalhado, distribuído com grandes intervalos ou que existe em pouca quantidade em um determinado espaço
 Se você quer guardar apenas a informação dos anos "1900" e "2026",
 um array precisaria de 2026 espaços (muitos vazios).
 Um Hash guarda apenas as duas chaves necessárias.
=end

# Usando os dados que inseri anteriormente no IRB.
# selecionando um item do hash com uma variável seguindo uma condição

users.select { |u| u[:active] == true } # bloco curto usando {}

=begin
no caso acima temos o método select.
o bloco começa a partir da chaves {} porque vai executar um bloco de código
dentro do bloco de código temos uma variável |u|
  |u|-> isso se chama block parameter, parâmetro do bloco
 o bloco percorre o array para encontrar usuários
 encontrando mostrando ao select todos os hash
 o select vendo que o :active desses usuários é igual a true, joga dentro de |u|

no código o que ele retorna é o array e entro dele o hash
[{id: 1, name: 'William', active: true}]
como Ana é falso, o select não a seleciona.
=end

# loop .each do || end

users.each do |u|   # bloco com mais de uma linha usando do ..end
  puts u[:name]
end
=begin
  Este loop é como se fosse um for em outras linguagens
  each é o método e-> do |u|....end é o bloco

  o |u| parâmetro recebe em si os hash

  each do significa: para cada item do parâmetro |u| faça
  o |u| carrega agora todos os hash
  esta composição de método e bloco each do .... end
    percorre os hash do array e imprime os nomes

    Para cada user, faça…”, ou seja, para cada hash do array, com a chave :name faça a impressão
   o resultado é a impressão de: William e Ana

   tanto o select quando o each, percorrem o array e trazem dados.
   o select cria um novo array como uma condição e se preocupa com o retorno
   o each só executa ação, não precisa de condição,
   não se preocupa com retorno, nao cria outro array e trabalha com o original.

=end

# usando o metodo .map
# Primeiro caso
names = users.map do |u| u[:name] end

=begin
 O map SEMPRE retorna um ARRAY
 Mas o CONTEÚDO do array é exatamente o que o bloco devolve

  embora o |u| sendo um hash inteiro, o bloco traz o valor da chave
   :name que é "William"
  o que foi devolvido ao map é string e não hash

  quando peço o resultado da variável o retorno é
  ["William "Ana"] -> string dentro de array
=end

# segundo caso hash dentro de array
users.map do |u| { id: u[:id], name: u[:name] } end

=begin
 O map SEMPRE retorna um ARRAY
 Mas o CONTEÚDO do array é exatamente o que o bloco devolve

 diferente do caso anterior
 esta variável |u| tem a sua frente um hash
 Neste caso temos a variável |u| recebendo hash
 temos as chave id: e name: recebendo dentro de si as strings id e name
 do hash u
 Como id: e name: são chaves, isso quer dizer que é um hash
 então o que |u| vai passar como retorno para o map é
 { id: 1, name: "William" } -> hash
  diferente do caso anterior em que |u| recebe a string u[:name]

 O map olha que |u|, é um hash e o que ele faz é colocar este
 has dentro de um array

 [{:id=>1, :name=>"William"}, {:id=>2, :name=>"Ana"}]

  Comparação direta (lado a lado)
 # EACH → ação
 users.each { |u| puts u[:name] }
 
 # SELECT → filtro
 users.select { |u| u[:active] }
 
 # MAP → transformação
 users.map { |u| u[:name] }
 
 Método	             Bloco retorna         	     Resultado
 each	             qualquer coisa	                ignora
 select	          true / false	             filtrado só true e faz um novo array
 map	              qualquer valor	               transforma em array
 
 Regra de ouro (guarde isso)
 
 O método manda.
 O bloco obedece.
 
 O bloco não decide o formato do retorno, quem decide é o método.
=end

# método start_with
users.select do |u|
  u[:name].start_with?("W")
end

=begin
  start é começar ou iniciar
  with? fica assim: com o que?
 este método start_with é usado principalmente em strings para
 verificar se um texto começa com um determinado valor.
 neste caso temos o select verificando se o hash :name começa com a string W
 Se sim, ele seleciona, se não, não seleciona
=end

#E quando o select não tem condição

users.select { |u| u[:active]}

=begin
Embora o u tenha 2 hash o que retorna é
[{:id=>1, :name=>"William", :active=>true}]

porque: Ana é false declarado internamente
true → Ruby entende como verdadeiro
false → Ruby entende como falso
E o select funciona assim:
“Se o bloco retornar algo truthy(verdadeiro), eu seleciono”

Então aqui naõ precisa dizer == true, porque :active
sozinho sem ==true, o Ruby entende como verdadeiro

Regra de ouro do Ruby (ESSENCIAL)

Em Ruby para ser considerado falso precisa ser indicado internamente
false e nil → falsy

se não é indicado internamente todo o resto → truthy -> verdade
=end

# Encadeamento
# select e map juntos
users.select { |u| u[:active] }.map { |u| u[:name] }

=begin
Olha que interessante um select e map junto

Isso -> users.select { |u| u[:active]}.map { |u| u[:name]}
se chama encadeamento -> cada método recebe o retorno do anterior
1º o select vai receber do bloco de código baseado na chave :active
lembrando que :active sem indicação é true, ou seja, filtra só os true
depois este retorno hash, entra no bloco do map, e o map transforma o valor
da chave :name, com condição true em um array

o retorno é ["William"] string em array e,somente "William"
porque Ana a condição é false.
=end

# map e depois select
users.map { |u| u[:name]}.select { |name| name.start_with?("A") }

=begin
 Nesta caso o map vai transformar o :name William e Ane do hash em array
 Depois este array com os 2 nomes, entra no bloco de código do select
 O select não vê mais hash e sim array, por isso |name| não é chave :name
 select filtra somente Ana por conta da condição que inicia com 'A'
 a variável |name| agora, é cada string do array
 "William" → false porque não começa com "A"
 "Ana".start_with?("A") → true
 
 com isso é apresentado ['Ana']
 
 forma menos elegante de escrever a mesma coisa é
  names = users.map { |u| u[:name] }
  filtered = names.select { |name| name.start_with?("A") }
  preferível o encadeamento
=end

#                                   JSON
=begin
 JSON (JavaScript Object Notation (Notação de Objetos JavaScript)
 É um formato leve de intercâmbio(troca entre) de dados,
 fácil de ler e escrever para seres humanos e simples de
 processar para máquinas
 Embora baseado no JavaScript, o JSON é independente de linguagem,
 o que permite que sistemas escritos em diferentes linguagens
 (como Python, Java, PHP, Ruy e C#) troquem dados entre si de maneira
 padronizada

 Resumindo JSON é um intérprete, permite que linguagem diferente
 se comuniquem.

 JSON recebe os seguintes Tipos de dados:
 Strings, Números, Booleano(true e false), Null(nulo ou vazio)

 Tipos de Dados Estruturados:
 {} Um hash ou coleção não ordenada de pares chave/valor delimitada
  por chaves e, deve ser sempre uma string entre aspas

 [] Array ou Matriz que é: uma lista ordenada de valores delimitada
  por colchetes ([]), onde cada elemento pode ser de qualquer um dos
  tipos de dados acima, incluindo outros objetos.

  Eles são considerados "estruturados" porque funcionam como recipientes
  que podem conter outros valores, inclusive outros objetos e arrays aninhados.

 Por que não existem outros Tipos de Dados Estruturados ?
 O JSON foi desenhado para ser uma notação mínima e independente de linguagem.
 Tipos mais específicos (como Datas) não existem nativamente; para
 representá-los, você deve usar os tipos básicos disponíveis,
 como uma String formatada.
=end

# Simulando transformação de dados para resposta JSON

# Passo 1 criando dados(como se estivessem no BD)

users = [
  { id: 1, name: 'William', active: true },
  { id: 2, name: 'Ana', active: false },
  { id: 3, name: 'Alice', active: true }
]

# Passo 2 Filtrar usuários ativos
active_users = users.select { |u| u[:active] }

=begin
  Nesta caso a variável active_users recebe os dados do select
  que o bloco trouxe a ele, porém somente os de chave :active == true
  Retorno active_users = u-> [{ id: 1, name: 'William', active: true },
             { id: 3, name: 'Alice', active: true }]
=end

# Preparar resposta para API (array de nomes, pronto para JSON):

response = active_users.map { |u| { name: u[:name] } }
=begin
 Nesta a variável response(resposta) vai receber o array pronto para JSON
 
 a variável active_users contém um array, com hashs, somente com com
 chaves :active == true que foram filtradas acima
 Dentro do bloco a chave name: atua como uma variável, porque
 vai receber uma string de u[:name]
 Perceba que name:, chave para hash, recebe a string da chave :name

 agora o bloco entrega para o map um hash
 o map pega este hash e transforma em um array
 que por sua vez a variável response recebe

 Veja o retorno abaixo, hash dentro de array
 [{:id=>1, :name=>"William"}, {:id=>3, :name=>"Alice"}]

=end

# Performa-se em API, primeiro filtra depois trata os dados
users.select { |u| u[:active] }.map { |u| u[:name]}

users.map { |u| u[:name] }.select { |name| name.start_with("A") }

=begin
 Pergunta:
 Eles fazem a mesma coisa?
 Qual faz menos trabalho?
 Qual se parece mais com código de API?

 Quando se trabalho com API: primeiro filtra e depois trabalha os dados.
 è o que p primeiro esta fazendo

 Primeiro filtra (remove os inativos)
 Depois transforma (extrai só os nomes)
 Trabalha com menos dados
 Menos iteração
 Menos memória
 Mais eficiente

 O segundo começa transformando todos os dados e depois filtra
 Trabalha com mais dados do que precisa
 Faz transformação antes de saber o que será descartado
 Pode ser aceitável, mas não é o ideal

=end

# Pensar como uma API
=begin
 Até agora o que foi feito, é exatamente o que uma API faz
 O que precisa ser feito agora é:

 1º Um endpoint
 2º Um formato de resposta (JSON)
 3º Um lugar certo (controller)

 O que é API (ajustando sua definição)
 Definição correta em português simples:

 API é um contrato de comunicação entre sistemas.
 Ela define:
 o que pode ser pedido
 como pedir
 o que será devolvido
 em qual formato
 
 Não importa se o outro lado é:
 Ruby
 JavaScript
 Java
 Python 
 um celular
 
 Todos falam HTTP + JSON, repito, HTTP + JSON.

                             REQUISIÇÂO e RECURSO

 Mentalidade de API (grave isso)
 Uma API sempre responde uma necessidade de negocio
 Cadastrar clientes
 Processar pagamentos
 Listar pedidos ativos
 Integrar com um app mobile
 Permitir que parceiros consumam dados
  
 Uma API nasce porque sistemas não devem viver isolados.
 Ela existe para expor RECURSOS de um sistema de forma
 controlada, permitindo que outros sistemas os acessem por
 meio de requisições.

 RECURSO, especialmente em API REST, são dados persistidos
 Usuário, pedidos,produtos etc..
 
 REQUISIÇÂO é a implementação técnica dessa necessidade
 para atender uma requisição, alguém precisou escrever código
 com lógica de negócio
 
 Por exemplo o que ja vimos acima
 Listar usuários ativos = necessidade de negocio

 Para essa requisição funcionar
 Você precisa de código com lógica:
 validar parâmetros
 decidir o que pode ou não pode
 buscar dados
 aplicar regras de negócio
 montar a resposta

 Uma API REST responde sempre a 3 perguntas:
 O que o cliente pediu?
 Onde estão os dados?
 Como vou devolver esses dados?
 
 Nos exercícios acima feitos, mentalmente seria:
 “Me dê os usuários ativos, mas só com id e nome”

 O que o cliente pediu? -> usuários ativos, mas só com id e nome
 Onde estão os dados? -> no BD
 Como vou devolver esses dados? -> aplicando programação a logica de negocio
=end
# Dados (simulando banco)
users = [
  { id: 1, name: "William", active: true },
  { id: 2, name: "Ana", active: false },
  { id: 3, name: "Alice", active: true }
]

# Lógica de negócio (o coração da API)

users_active = users.select { |u| u[:active] } # filtrando
response = users.map { |u|	{ id: u[:id], name: u[:name] } } # transformando

=begin
 Isso é:
 Filtro
 Transformação
 Formato de resposta
 
 Resposta da API” (simulada)
 Se isso fosse uma API de verdade, o cliente receberia algo assim (em JSON):
 [ {"id": 1, "name": "William"},
   {"id": 2, "name": "Alice" }
 ]
=end

# Conexão de comando direta com Rails (importante)
=begin
 Todos os comando feitos até aqui foram em Ruby puro
 Agora vou comparar com comandos para rails
=end

# filtro em ruby
users.select { |u| u[:active] } # acessa o array

# filtro em Rails
User.where(active: true) # acessa o Banco

# map em Ruby
users.map { |u| { id: u[:id], name: u[:name] } }

# map em rails
User.pluck(:id, :name)
# ou
User.slect(:id, :name).as_json

=begin
 pluck significa -> arrancar, depenar, puxar rapidamente etc.
 Exemplo do uso real da palavra
 pluck a chicken → depenar uma galinha
 pluck a string → puxar a corda de um instrumento
 pluck a flower → arrancar uma flor
 
 O pluck aqui fazendo:
 arrancando só esses campos do BD
 pega śo isso aqui e me devolve
 
 Enquanto o .map trabalha transformando os dados na memória,
 o pluck vai direto no BD, pega ou arranca apenas id e name,
 devolve só os valores crus
 
 Resultado:
 [[1, "Ana"], [2, "João"]]
 
 Vantagens:
 Não instancia objetos User
 Vai direto no banco
 Muito mais performático
 
 Desvantagem:
 Não retorna hashes
                                 as_json
                              
 Para retornar hash acessando diretamente o BD(melhor que trabalhar na memória)
 podemos usar a combinação de dos métodos select e as_json
=end
User.select(:id, :name).as_json
=begin
 O retorno é:
 [
   { "id" => 1, "name" => "William" },
   { "id" => 2, "name" => "Alice" }
 ]
 as_json é um método do Rails que transforma um objeto (ou coleção)
 em uma estrutura Ruby pronta para virar JSON.
 
 Importante:
 não retorna JSON em texto
 retorna Hash / Array de Hashes

 Resumo mental(IMPORTANTÍSSIMO)
 .map trabalho em memória
 where, select e pluck trabalha direto no BD
=end

                                     # API RESTful
=begin
 A partir de agora, vamos ver todo conceito visto anterior
 conversando com banco de dados.

 E isso se chama APIRESTful
 API -> Application Programming Interface
 (Interface de Programação de Aplicações)

 RESTful -> termo derivado de REST -> Representational State Transfer
 (Transferência de Estado Representacional)
 No contexto de TI, RESTful não se traduz, mas o termo inglês
 significa "tranquilo", "repousante" ou "relaxante"

 Uma API RESTful: Ponte que permite a comunicação entre sistemas, 
 expondo RECURSOS por meio do protocolo HTTP, seguindo os princípios
 do estilo arquitetural REST e utilizando métodos como GET, POST, PUT e DELETE.

 GET é Buscar
 POST é criar
 PUT é atualizar
 DELETE é excluir

 A API é uma espécie de tradutor entre linguagem, faz a ponte entre...
 A aplicação Ruby conversando com outras linguagem
 (C#, Java, C++, C, Python etc)
 Faz essa ponte seguindo o protocolo HTTP


 Vamos sair do “Ruby que roda na RAM” (porque foi isso que foi feito até agora)
 e entrar no Ruby que conversa com banco, que é o que se chamam de API RESTful.

 Tudo que dá para filtrar no banco, deve ser filtrado no banco.
 Ruby entra depois, só para ajustar formato

 Como estamos falando em buscar dados no banco uma coisa muito importante é:
 Não fazer isso de forma errada
 Por exemplo
=end

users.User.all
users.select { |u| u.active }
=begin
Este código na primeira a variável users, passa a ser um objeto
que representa uma consulta SQL para buscar todos os usuários

Isso é Rails entrando em ação com ActiveRecord::Relation
users recebe um ActiveRecord::Relation que representa todos
os registros da tabela users.

O Rails com users = User.all, não busca os dados imediatamente
Está linha de código se copara a query do SQL SELECT * FROM users;
SELECT é selecionar
* é tudo
FROM é a partir
ou seja, selecionar tudo a partir da tabela users(agora representante de User)
Atenção: Mas essa query só é executada quando os dados forem usados
=end

users = User.all # ainda não acessou o banco
users.select { |u| u.active } # AGORA executa SQL
# Isso se chama lazy loading (carregamento preguiçoso)

=begin
Essas linhas de código acima é o que se chama de errado fazer

Problema:
Busca TODOS os usuários no banco
Joga tudo na memória
Filtra depois → lento, perigoso
=end

# A forma correta de se fazer o filtro
users = User.where(active: true)

=begin
Neste exemplo o filtro não é feito em memória como o anterior
o filtro é feito no banco e ele manda para memória ja active true
Vantagens:
Banco faz o trabalho pesado
Menos memória
Muito mais rápido
=end

# Exemplo de uma API pura real em Rails

class UsersController < ApplicationController
  def index
   users = User.where(active: true) # BD me devolve só users ativos

    response = users.map do |u| # aqui escolho quais campos vão para resposta
		{
			id: u.id,         
			name: u.name
		}
    end

	render json: response # devolve isso ao cliente json
  end
end

# Melhor que esse acima é esse baixo

class UsersController < ApplicationController
  def
    users = User.where(active: true)
	
	render json: users.select(:id, :name)
  end
end
=begin
 No anterior com o método .map, o Ruby está montando na memória
 No debaixo com o método .select, a interação é direto no BD
  O BD devolve só essas colunas e Ruby não perde tempo montando

 render -> é um método que vem de ActionController e serve
 para construir e enviar a resposta HTTP da requisição
 pronto para frontend, mobile, Postman, etc.

 render define o corpo da resposta e o formato.

 json: chave de um hash ruby passada como argumento para o método
 render. É como se fosse uma varável que recebe o formato hash.
 
 Isso é API REST real, não exercício acadêmico.
 Este código é escrito na camada C do MVC, controller
 class UsersController significa: 
 “Estou criando um controller chamado UsersController,
 que herda comportamentos do ApplicationController o pai dos controllers.”
 		
 MVC no Rails
 Camada	                Pasta	              Responsabilidade
 Model	                app/models	        Regras + banco
 View	                app/views	        HTML (não usamos em API)
 Controller	         app/controllers	  Recebe requisição, chama Model, responde
 
 Em API Rails, quase não se usa View
 o controller fala JSON direto
 
 O controller orquestra o fluxo da requisição no padrão MVC.
 recebe a requisição, coordena a lógica da aplicação usando o Model
 e escolhe qual View será renderizada.
 Serve para:
 Autenticação
 Autorização
 Filtros (before_action)
 Configuração comum

                      Regras de Comunicação de REST
  
 HTTP (protocolo)
 REST (convenção/estilo arquitetural)
 Rails (framework que implementa REST)

 HTTP não tem métodos como uma linguagem de programação tem (métodos/funções).
 O que o HTTP tem são VERBOS: GET, POST, PUT/PATCH e DELETE
 
 Rails pegou os verbos do HTTP e criou um padrão de métodos para tratá-los
   REST: a ponte entre HTTP e Rails
   REST define como usar HTTP para acessar recursos.
    Regra central do REST:
     O verbo diz a intenção
     A URL diz o recurso
  Exemplo:
  GET /users
  Verbo: GET → quero LER
  Recurso: users → coleção de usuários(Tabela no BD)

  Os métodos Rails são uma “tradução” do HTTP
   Rails traduz requisições HTTP em métodos Ruby
 Regras para users:
 Verbo HTTP	             URL	          Método do Controller Rails
 GET	        +         /users	     ->          index 
 GET	        +         /users/:id	 ->          show
 POST         +         /users	     ->          create
 PUT	        +        /users/:id	   ->         update
 DELETE    	  +        /users/:id	   ->         destroy

 O verbo sozinho não define o método
 Verbo + URL juntos definem o método do controller
   
  Perceba que o GET aparece para 2 URL: users e users id
  Quando é users isso diz respeito a tabela inteira com todos os usuários do BD
  
  Exemplo:
=end
class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end
end
=begin
Quando acontece isso acima
O Rails interpreta assim:
 Verbo: Get -> pegar para ler
 Recurso: é o User -> Tabela com usuários
 Action(ação) -> Rest padrão: index

 A pergunta para: Por que GET pode ser index OU show?
 é essa acima
 GET + coleção(Tabela users, sem ID) → index ➡ lista todos os usuários
 
 GET + ID → show ➡ mostra um usuário específico


                                  Método do Controller Rails
 Index: é a ação responsável por listar os registros.
   Imagine uma biblioteca:
   O show seria você pegando um livro específico na estante para ler.
   O index seria você olhando para o catálogo ou para a lista de todos os livros disponíveis.
   O objetivo do index é sempre retornar uma coleção (uma lista/array) de dados, e não apenas um indivíduo.
     Por convenção, a URL do index é o nome do recurso no plural, sem ID
     O Verbo HTTP: Ele sempre usa o método GET, pois você está apenas "buscando" ou "lendo" dados, sem alterar nada no servidor.
       Exemplo: GET /users
  
   Quando o index é usado?
   Para mostrar uma tabela de usuários em um painel administrativo.
   Para carregar o "feed" de postagens em uma rede social.
   Para listar os produtos em um carrinho de compras.

 show:
   é responsável por exibir os detalhes de um único registro específico, identificado pelo seu ID.
   Se o index é a lista de todo mundo, o show é a lupa sobre uma única pessoa

   O que ele representa exatamente:
     A Intenção: Buscar informações detalhadas de um indivíduo (ex: perfil do usuário, detalhes de um produto).
     O Verbo HTTP: Sempre utiliza o GET.
     A URL: Diferente do index, o show exige o ID na URL.
       Exemplo: GET /users/5
   
   Como ele funciona no Rails:
     Quando você acessa /users/5, o Rails entende que o 5 é o :id e o entrega para a sua action no controller:
   
   Onde você usa o Show?
     Quando o usuário clica em um item da lista para ver mais detalhes.
     Para carregar a página de "Meu Perfil".
     Para visualizar uma única nota fiscal ou pedido.
  

 create:
   é a ação responsável por dar a luz a um novo registro. É o comando que pega os dados enviados pelo usuário e os grava permanentemente no banco de dados
   
   Seguindo a lógica das outras ações:
     Index: Lista todos.
     Show: Mostra um.
     Create: Fabrica um novo.
    
   O que ele representa exatamente:
     A Intenção: Criar um novo recurso (um novo usuário, uma nova foto, um novo comentário).
     O Verbo HTTP: Usa o POST.
     A URL: Geralmente a mesma do index, mas com o verbo diferente.
       Exemplo: POST /users

   O fluxo do create no Rails:
     Diferente do show, o create recebe um "pacote" de dados (o corpo da requisição/body) que o usuário preencheu. 

 update:
   é a ação responsável por modificar as informações de um registro que já existe no seu banco de dados. Se o create é o nascimento, o update é a evolução.
   
   O que ele representa exatamente:
     A Intenção: Atualizar campos específicos (ex: mudar a senha, trocar o endereço, atualizar o nome).
     O Verbo HTTP: Usa o PATCH (para mudanças parciais) ou PUT (para substituir o registro inteiro). Na prática do Rails, o PATCH é o mais comum.
     A URL: Precisa do ID para saber quem está sendo editado.
       Exemplo: PATCH /users/5 
  
   O fluxo do update no Rails:
     Ele é uma mistura do show (para achar o registro) com o create (para validar os novos dados).


 destroy: 
   é a ação responsável por remover um registro do banco de dados permanentemente. Se o create é o nascimento e o update é a evolução, o destroy é a "morte" do registro.

   O que ele representa exatamente:
     A Intenção: Excluir um recurso que não deve mais existir (ex: deletar uma conta, apagar um comentário).
     O Verbo HTTP: Usa exclusivamente o DELETE.
     A URL: Precisa do ID para saber exatamente quem deve ser removido.
       Exemplo: DELETE /users/5
    
   O fluxo do destroy no Rails:
     Ele é muito parecido com o show, mas em vez de apenas ler, ele deleta:

 Resumo Visual das Ações:
   Ação	        Verbo       	 URL	                   Objetivo
   Index	       GET         /users	                 Listar todos
   Show	         GET       /users/:id   	         Ver detalhes de um
   Create       POST        /users	                 Criar um novo
   Update      PATCH      /users/:id       	       Editar um existente
   Destroy	   DELETE      /users/:id   	         Apagar um existente


   
                        Construção de endpoints reais

 1 exemplo
 Get/users/5
 Digamos que meu sistema esta rodando em:http://localhost:3000
 Posso digitar no navegador http://localhost:3000/users/5
 E o navegador faz a requisição GET automaticamente.
 ou seja
 quando acrescento digitando users/5 ao endereço http://localhost:300
 estou pedido para acessar o usuário de id 5
 o navegador daria o Get(pegar) me mostrando este user
 Isso é uma rota HTTP
 
 Antes de seguirmos, vamos entender uns conceitos aqui
=end

                            # RESOURCE, URI e URL

=begin
 RESOURCE -> recurso -> são elementos de informação,
 que através de um identificador global podem se manipulados

 IMPORTANTÍSSIMO -> elementos de informação + identificador global
 
 Resumo: RECURSO são "COISAS", que podem ser manipuladas através de um ID
 
 RECURSO é aquilo que eu quero manipular

 aqui http://localhost:3000/users/5 o users/5 é que, eu quero manipular
 logo é meu recurso, aqui neste exemplo, identificado como users

 A nomeação de um recurso sempre é formada por um substantivo, nunca um verbo.


 URI -> Uniform Resource Identifier(Identificador Uniforme de Recursos),
 ou seja, é uma cadeia de caracteres compacta usada para identificar
 ou denominar um recurso na internet

 IMPORTANTÍSSIMO -> cadeia de caractere, identificar o RECURSO
 então é isso aqui -> //localhost:3000/users/5

 identificador é algo único, não vai existir igual
 por isso é um identificador único de RECURSO
 Quando acessam a internet colocando essa cadeia de caracteres,
 é o meu recurso que procuram

 URL -> Uniform RESOURCE Locator -> Localizador Padrão de RECURSO,
 é o endereço de um RECURSO disponível em uma rede

 IMPORTANTÍSSIMO -> localizador Padrão + Recurso
  O meu RECURSO é o users, esse é o que eu quero manipular
  identificado no final de todos os caracteres //localhost:3000/users/5

  URI é -> //localhost:3000/
  
  Então URL é o HTPP -> protoclo + URI + RECURSO
  endereço completo disponível em uma rede
 Como tudo isso http://localhost:3000/users/5 na internet se acha meu RECURSO
=end

#                        ENDPOINT SHOW
# Sistema de fora pedindo dados para minha API
fetch("http://localhost:3000/users/5")
  .then(response => response.json())
  .then(data => { console.log(data.name)})

=begin
Acima é um exemplo real em frontend (JavaScript)
pedindo dados para minha API, no caso ele quer um id

Abaixo esta o código de resposta da minha API para o Javascript
=end

  def show
    users = User.find_by(id: params[:id]) # params esta trazendo o que veio do cliente

	if users
		render json: users
	else
		render json: { error: "User not found" }, status: 404
    end
  end

=begin
 params -> parâmetro
 TUDOOO!! que chega para o servidor vindo de fora
 params Ééé!! a caixa onde o Rails guarda tudo que veio do pedido do cliente
 Ele pode conter:
 dados da URL
 dados do formulário
 dados do JSON enviado
 query params (?page=2)
 
 find( encontrar) by(por), ou seja, encontre por.
 O mais usado em API porque é o mais seguro
 Resumo o método show
 
                           INTERPRETAÇÂO DO CÓDIGO
 
 Aqui abaixo é a requisição do Javascript:
 fetch("http://localhost:3000/users/5") 
 .then(response => response.json()) 
 .then(data => { console.log(data.name)})
 
 nesta requisição tem o protocolo HTTP + URI + o Recurso desejado que é o users/5
 
 Como o Get é users/id, ou seja, um id especifico
 método show de-acordo com padrão REST
   GET	 + /users/:id	 ->  método show em controller
 
  Show significa mostrar, então essa função vai mostrar para a requisição
  que veio através do Javascript, pelo método Get o Recurso desejado que users/5
 
  params contém em sí as informações do recurso desejado
 
  find_by -> encontrar por, é um método do ActiveRecord , que pega o retorno do bloco

  
  find_by em português:
 “Encontre um registro no banco que bata com essa condição(params)

 o bloco é composto por uma chave id: que vai receber em si o
 objeto com chave id: que User pediu para encontrar(find) no banco,
 baseado nas informações que params está trazendo e, users a variável
 que vai receber esse objeto ActiveRecord
 render é um método que vai devolver a resposta que esta na chave json:
 que recebeu o objeto ActiveRecord de users, se tiver informação,
 se não, o que vai devolver é a mensagem que o método error produziu

  RESUMO:
  O método show é um endpoint REST que responde a uma requisição GET
  feita por outro sistema, retornando um recurso especifico.
  saiu do meu sistema, vai para outro em formato JSON
=end

#                           ENDPOINT POST
# Sistema de fora enviando dados para que seja criado recurso dentro meu sistema
=begin
 Outro sistema envia dados
 meu sistema recebe
 meu sistema decide o que fazer com esses dados
 Normalmente: os cria no banco
 ATENÇÂO: O recurso ainda não existe quando chega

 O método utilizado para isso é create
=end

def create
end

=begin
 quando os dados chegarem ao meu sistema, pelo post/users
 meu sistema ja sabe o que fazer, uma vez que o método foi criado 

 Sem esse endpoint 
  o post chega
  Rails não sabe responder
  erro 404/routing error

 Vamos ver uma situação real
 Imagine um sistema frontend (site, app, painel admin) que precisa
 cadastrar um usuário
  Então temos:
  Tela "Cadastrar Cliente"
  Formulário de signup (ou formulário de cadastro/inscrição) 
  App mobile criando conta
  Outro sistema integrando com o seu

 Esse sistema NÃO acessa o banco direto
 Ele faz uma requisição HTTP para sua API
=end

                     # REQUISIÇÂO FEITA PELO FRONT o POST
# Javascript
fetch("http://localhost:3000/users", {
  method: "POST",
  headers: {
    "Content-Type": "application/json"
  },
  body: JSON.stringify({
    name: "Carlos",
    active: true
  })
})
.then(response => response.json())
.then(data => console.log(data))

=begin
 Então temos o Javascript fazendo um post, ou seja,
 enviando dados para meu sistema
 body é o corpo da requisição
 Perceba que no javascript temos o body, em JSON, com os dados enviados:
  name: "Carlos", active:true

 Claro que em um cadastro mandão muito mais que só o nome, porém aqui ja da
 para entender como chega as informações até meu sistema.
 
 Quando chegam o Rails recebe isso no params = { "name" => "Carlos", "active" => true }


  Agora preciso construir um endpoint para receber esses dados
  e assim construir esse recurso no meu BD
=end

class UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      active: params[:active]
    )
    if user.save
      render json: user, status: 201
    else
      render json: {errors: user.erros.full_messages}, status: 422
    end
  end
end
=begin
 Acima temos o endpoint rails para receber os dados

 user é a variável que está recebendo o novo usuário.
 User.New é o comando para criar um novo usuário.
 chave name: recebendo o nome deste novo usuário, que esta sendo carregado pelo params 
 [:name] isso é a chave que esta dentro do params, que vai depositar em name:
 o mesmo acontece com active

 A condicional if else.
   user.save é o comando para salvar no BD
    quando adiciona a condicional -> if user.save -> fica assim:
     se existir e for salvo no BD esse novo user, o render devolve status 201
   se não, devolve error e status 422

 Na maioria das vezes o model valida a entrada do dados e confirma ao controller
   com false ou true


 Modelo mental FINAL (guarda isso)
  GET /users/:id
  Recurso já existe
  Cliente pede
  Seu sistema entrega

 POST /users
  Recurso não existe
  Cliente envia dados
  Seu sistema cria o objeto e assim o recurso

 show é um endpoint que entrega dados do meu sistema para outro.
 create é um endpoint que recebe dados de outro sistema para 
 criar algo no meu banco.

=end

#                           ENDPOINT PUT

=begin
 PUT = atualizar/substituir
 Como o próprio nome revela ente endpoint vai servir para modificar,
 ou seja, atualizar o recurso
 Neste caso ja temos o recurso, ele já existe.

 Digamos que seja necessário atualizar um user
 VC entra no perfil do user que quer modificar, ali tem um
 botão atualizar ou editar e, quando clica abre o formulário.

 Agora é só preencher com as novas informação.
 Ao confirmar essa mudança, e ai que acontece a requisição, ou seja,
 o processo de atualização do recurso.
  
  Vamos ver o processo em HTML
  Esse exemplo junta HTML + HTTP + Rails + MVC
=end

<form action="/user/5" method="post">
 <input type="hidden" name="_method" value="put">

   <input type="text" name="user[name]" value="William">
  <input type="checkbox" name="user[active]" checked>

  <button type="submit">Atualizar</button>
</form>

=begin
 A primeira informação que precisamos aprender aqui é:
 HTML puro só suporta dois métodos em form
 GET
 POST

 Não existe PUT, PATCH, DELETE em <form> HTML
 Isso não é limitação do Rails, é do HTML + browser.
 
  A solução do Rails e de outros frameworks foi:
    Criar um truque padrão de mercado chamado method
    OVERRIDE(substituir, subscrever)

  Como html só entende post, o input vai subscrever o post para put
   Ele faz assim:
   O browser envia POST
   Dentro do corpo do POST vai: _method=put

    O browser esta levando post
    Quando o browser entrega ao meu sistema, o Rails intercepta
    antes de chegar no controller e covert internamente, já que agora
    passou do browser, o rails sabe o que é put. Ele subscreve(override)
    para put.
     POST + _method=put  →  PUT
  
   O navegador não sabe que isso virou PUT.
   Quem faz a “mágica” é o Rails no servidor.

  Tudo isso acontece nas duas primeiras linhas do form,
  essas duas abaixo:
  <form action="/user/5" method="post">
 <input type="hidden" name="_method" value="put">
    
 Perceba que ao criar o form ele tem um atributo action
  form action=
  , ou seja,
  é um form que vai executar uma ação ao clicar em atualizar
  E a ação é o override

 o input logo abaixo de form action, tem o atributo "hidden" que
 significa -> oculto, ou seja, é um tipo de input que o usuário não ve
 ele serve para ajudar no override, somente o servido o vê.

 No mesmo input tem o atributo com a string -> name="_method"
  Esse nome é especial para o Rails.
  Rails olha para o corpo da requisição e pensa:
  “Tem _method aqui? Então vou sobrescrever o HTTP method.”

  E o atributo value com "put"
   Isso diz ao Rails:
  “Trate essa requisição como PUT”

 Nas outras linhas
   <input type="text" name="user[name]" value="William">
   <input type="checkbox" name="user[active]" checked>

   <button type="submit">Atualizar</button>

  São os inputs que vão tratar da nava informação
   aqui:
   <input type="text" name="user[name]" value="William">

   Temos type="text"
    É o campo visível
    O famoso retângulo onde o usuário digita

     name="user[name]" — aqui está a chave
     Isso não é variável HTML.
     É uma convenção de envio de dados.
     Quando o form é enviado, o navegador monta isso:
       user[name]=NovoNome
    
   Rails interpreta automaticamente como:
     params = {user: { name: "NovoNome" } }
    
     ou seja isso user[name]=NovoNome vira params
    Esse formato com colchetes (user[...]) existe exatamente
    para criar hashes no backend.

  E por fim value="William"
   esse é representa o valor atual, quando abre o formulário mudar
    ao inserir um novo esse sera apagado


 Aqui
  <input type="checkbox" name="user[active]" checked>
  Esse input é para tratar se está ativo ou não, true ou false
  O usuário ao abrir o formulário de atualização, vai ver uma caixinha
  de marcação, ela começa com marcada.
  Se tirar a marcação este campo não é enviado. Poe isso checked
  
   Dai a necessidade de o Rails usa helpers que lidam com isso melhor
   (form_with, check_box etc).

 Aqui name="user[active]" é a mesma ideia do user[name]=NovoNome


 O BOTÂO
  <button type="submit">Atualizar</button>
 Quando clica:
 O browser coleta todos os inputs
 Monta o corpo da requisição
 Envia para /users/5 via POST

  O que o browser realmente envia
   POST /users/5

   O body da requisição fica assim:
    _method=put
     user[name]=William
     user[active]=1 -> este 1, é o ticado do checkbox
       

 O Rails pega tudo isso e transforma nisso:
  request.method # => put
  params = { user: {name: "novoname", active: "1"}, id: "5"}

  E envia para o controller, e este procura o endpoint: update
=end
class UsersController < ApplicationController
  def update
    user = User.find_by(id: params[:id])

    if user&.update(user_params)
      render json: user
    else
      render json: {error: "User not found or invalid data"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :active)
  end
end

=begin
 No código temos elementos novos:

 & -> que parece um operador logico, chama-se safe(seguro)navigate operator
 Em português: operador de navegação segura
 Ele chama o método(user_params) só se existir user no BD
 ANTENÇÂO o & age no BD

 user_params -> o nome do método ou (função) privado


 Antes do código retornar com a resposta para o controller, ele precisa fazer a atualização.
   Antes da fazer a atualização temos um método privado que verifica se as informações do params são de fato verdadeiras e seguras.

 Olhando para o método privado, no fim dessa estrutura de código, temos o params que carrega em si os dados vindo de fora para atualização.
 Na frente do params temos 2 métodos: require e permit que atuam nos dados que vem de fora.
 
 Neste caso, são 3 os dados de que vem de fora: :user, :name e :active.
 Eles vem com a intenção de persistir no nosso BD. E Quando falamos em dados entrando no BD, temos que tomar muito cuidado. Por isso precisamos pensar na modelagem de dados que traga SEGURANÇAA!! e é o que esses dois métodos vão fazer analisando os dados que vem de fora. 

            AQUI VAMOS FALAR DE SEGURANÇAAA! STRONG PARAMETERS(parâmetros fortes)
 
 .require(exigir) neste caso é um método que exige que a chave :user exista
 se não existir-> ActionController::ParameterMissing -> isso é: uma exceção(objeto que representa um erro) que o Ruby on Rails lança quando você exige um parâmetro obrigatório no seu controller, mas ele não é enviado na requisição
  
 A importância de obrigar o esta chave :user, tem relação com a convenção Ruby. Assim o Rails sabe que esses dados vão persistir em User(tabela user). Com isso evita dos dados irem para outra tabela.

  Requisição vem através do navegador em params, então neste caso tem que vir 3 elementos: :user, :name e :active.
  O require verifica se a :user existe(para que rails saiba onde vai persistir os dados).
  Se não encontrar em params, interrompe tudo, não continua executando recurso na memória lança a exceção ActionController::ParameterMissing.
  O foco de require é na estrutura de dados da requisição.


 .permit(permitir/autorizar) é um método que só permite ou autoriza passar o que foi descrito dentro do parentese.
  Nesse caso só passa [:name e :active]

  Como no sistema estou recebendo dados enviado de outro sistema, e justamente esses dados vieram para persistirem no meu BD, o que poderia acontecer aqui é: um hacker mau intencionado, poderia interceptar a requisição e adicionar a este user o valor
  user[admin]=true.
  O Rails iria salvar esse valor, tornando este usuário um administrador. E este teria poderes para fazer muita coisa. Imagina o risco que o sistema tem com isso.
    
 Esse conjunto de ações de require e permit se chama: STRONG PARAMETERS(parâmetros fortes)

                                 SEQUENCIA DO CÓDIGO

 O def update começa com o filtro procurando pelo id que esta no params
  user = User.find_by(id: params[:id]) achando entra na variável user

 O próximo passo seria rodar o update, mas para o Ruby fazer isso ele precisa saber o que passaram para ele. Por isso ele salta para o método user_params

 Nesse momento entra em ação o strong parameter.

 Depois disso o código segue para o if pra a atualização
   E antes da atualização acontecer, o &(safe navigation), atua no BD verificando se o :user é nill.
   Caso o :user seja nill, sem não tiver o & safe no código, é natural do BD, enviar mensagem de erro: NoMethodError e isso é do BD e não do Rails como antes.
     
    Então perceba que Rails pode mandar mensagem de erro e para tudo, assim também é o BD.
    E quando falo de parar tudo é um erro explosivo, como se fosse um grito: "PARE!" e não continua o código, indo para o else.

   O foco do & safe navigator é evitar esse erro gerado do BD, não permitindo a continuidade do código.
     Ele verifica se dos dados que estão, retornados de user_params, o :user não é nill.
  
   Se for, o & safe interrompe o erro natural do BD, evitando o grito, não permite a atualização, e o fluxo vai para o else retornando resposta para a API.
     
     Exemplo: user&.update — Se o usuário existir no banco, atualize.
      Controller chama o model, Model valida e salva e Controller responde
  
     Agora se for nulo, apenas ignore e não quebre o sistema.
   &. é o "Desvie" (Silencioso): Ele é diplomático. Se o usuário for nil, ele transforma a chamada do método em nil também. Isso faz o if falhar e "escorregar" para o else. O processo continua rodando e você consegue entregar uma resposta personalizada ao JSON de erro.
    Perceba que o &(safe navigation) atua no BD, enquanto o strong parameter atua nos dados que vem do navegador.
 
 Controller cuida da "burocracia" da entrada e o Model cuida da "verdade" dos dados.  
=end

#                                      PATCH
=begin
 PATCH -> significa remendo
  A ideia do PATCH é justamente essa: remendar, como em uma calça rasgada que recebe um pano para tampar o furo, brecha etc.
  O PATCH em tecnologia é conhecido por corrigir falhas, fechar brechas de seguranças ou consertar "bugs" em programas ou jogos.

 O patch é usado para atualização assim como o put
 Enquanto o put substitui o recurso inteiro o patch o faz parcialmente.

 
 PUT
  Substitui o recurso inteiro
  
  Você envia toda a representação do objeto
  
  Se faltar campo, ele pode ser apagado
 OU seja: PUT: Substitui o recurso inteiro. Se você enviar apenas o nome, o sistema pode tentar "limpar" os outros campos.


 PATCH
  Atualização parcial
  
  Envia apenas os campos que mudaram
 Ou  seja:PATCH: Faz uma alteração parcial. Ele altera apenas o que você enviar, mantendo o restante como está.
  
  É o padrão moderno (e o que Rails usa)
   O Rails usa o patch por padrão para update
   O put ainda existe por compatibilidade e semântica HTTP, mas ambos apontam para a mesma action.
    patch "/users/:id", to: "users#update"
    put   "/users/:id", to: "users#update"

 Tanto o put quanto patch usam as mesma lógica de código apresentada aqui.
 O método .update(user_params) do ActiveRecord é inteligente o suficiente para atualizar apenas as chaves presentes no hash user_params.

  Se você quiser ser mais rigoroso e garantir que está tratando uma atualização parcial (estilo PATCH), o código seria exatamente o mesmo, mas com atenção aos Strong Parameters:
=end
def user_params
  # Aqui está o segredo: o permit só deixa passar o que foi enviado.
  # Se o JSON enviado for { "name": "Novo Nome" }, 
  # o Rails não mexerá no campo :active.
    params.require(:user).permit(:name, :active)
end
=begin
 Exemplo de Requisição (JSON)
  Se você fizer uma chamada via Postman ou Frontend usando o verbo PATCH:
  URL: /users/1
 Body Json:
=end
{
  "user": {
    "name": "João Silva"
  }
}
=begin
 Perceba que na requisição não veio o active
 O código foi escrito uma única vez para servir a varias situações diferente.
 O permit é como porteiro e este tem uma lista de convidados na mão.
 Não importa o que vem, só pode passar name e active.
 Mesmo que não venha o active o código continuará funcionado normalmente.
 O Rails vai transformar essa requisição em um objeto params
 Ele ignora o que não foi enviado. Se o campo active não veio no JSON, ele simplesmente não existe dentro do hash naquele momento.
 O resultado do user_params será exatamente isto: { name: "João Silva" }
 
  Quando é chamado o .update, o Rails faz o seguinte:
   Ele olha para o hash que você passou: {"name" => "João Silva"}.
   Ele compara esses dados com o que já está no banco de dados.
   Ele ignora as colunas que não estão no hash.
 
 Se o campo active não foi passado no hash, o Rails entende que você não quer mexer nele.
 Ele não assume que é null nem false; ele apenas o ignora na construção do comando SQL.
 exemplo:
=end
UPDATE users SET name = 'João Silva', updated_at = '...' WHERE id = 1;

=begin
 Ele só esta setando o nome onde o id é 1, o demais elementos deste objeto permanecem intactos.

 Com o puts o caso fica assim
  Exemplo:
=end
UPDATE users SET name = 'João Silva', active = NULL, updated_at = '...' WHERE id = 1;

=begin
 Percebe que ele torna o active em null

 Por padrão, o Rails aceita PUT e PATCH para a mesma ação.
 Agora para que o Rails aceite somente o PATCH, precisamos definir isso em routes.br, no arquivo de rotas que veremos mais a frente em rotas.
 
 PATCH é o verbo correto para update em APIs REST hoje.
=end


#                                ENDPOINT DELETE

=begin
  
 DELETE significa apagar ou remover.
 Em tecnologia DELETE = tirar da existência visível
 Apagar não significava destruir o material, e sim retirar o conteúdo visível.
  Quando você “deleta” um arquivo:
   O arquivo some da lista
   Mas os dados podem continuar no disco
   Até serem sobrescritos

 Este endpoint serve não deixar um recurso visível.
 O DELETE chama o método da action destroy.
 
 Digamos que na requisição venha DELETE/Users/5
  isso significa: “por favor, apague o usuário de id 5”
=end

# Exemplo: requisição através do Javascript
fetch("http://localhost:3000/users/5", {
  method: "DELETE"
})
.then(response => {
  if (response.status === 204) {
    console.log("Usuário removido com sucesso")
  }
})

=begin
 A Api do javascript através da URL esta trazendo uma requisição sobre o recurso user/5.
   
 Isso-> method: "DELETE", define a intenção do que fazer com o recurso na URL
   
 Ou seja, esta pedindo para que o recurso, user/5 seja tirado de vista(delete -> apagado ou removido)
 
 Esse trecho abaixo
 .then(response => {
   if (response.status === 204) {
     console.log("Usuário removido com sucesso")

 é um método devolve a resposta 
  Temos uma condicional (if) que responde o desfecho sobre o recurso.

 Quando recebida está requisição pelo Rails, o mesmo procura o Controller que tem o método ou action destroy
=end

class UsersController < ApplicationController
  def destroy
    user = User.find_by( id: params[:id])

    if user&.destroy
      head :no_content
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end
end

=begin
 params está com a requisição

 A variável user esta recebendo o filtro feito pelo find_by

 Agora temos o if:se user&.destroy
  & safe navigate operator -> operador de navegação segura, examina o resultado do filtro porque?:
    se o filtro não encontrar o id, será lançado uma mensagem de erro, e interrompe todo o fluxo do código. 
    
    Para que o fluxo continue o safe não deixa isso acontecer, joga o fluxo para o else que exibe o error.

  Se achar o id, então o método .destroy entra em ação:
    Remove o registro do banco
    Executa callbacks (retornos de chamadas) -> (before_destroy, after_destroy)
    Diferente de delete, destroy entra no (mais baixo nível) faz o recurso deixar de existir de verdade no banco.
  Isso acontecendo, o método head entra em ação:

                                  head no_content
                  
   head é um método do controller Rails que:
   envia apenas o header(cabeçalho) da resposta HTTP sem corpo (body)
     ou seja:
      não envia json, texto e objeto.
      envia somente o status HTPP.
    
  Os status HTPP são composto por números.
  os mais comuns são os números:
  200, 201, 204 e 404

  O Verbo DELETE destrói  o recurso. Isso significa que ele não existe mais.
  Se ele não existe, não faz sentido devolver JSON, já que uma das ideias através dele é devolver recurso, construindo um body(corpo) para o JSON.

  O método head do Controller Rails tem junto a ele símbolos:
  :ok, :created, :no_content, :not_found que representa esses números do HTPP.
    São hash internos do Rails
      HTTP_STATUS = {
       ok: 200,
       created: 201,
       no_content: 204,
       not_found: 404
      }
  Então para cada resposta do verbo DELETE temos no método head com os status HTPP. É só chamar um conforme a situação
    Neste caso o escolhido foi no_content carregando o status 204   
     head :no_content descreve:
     “Requisição executada com sucesso, mas não tenho nada para te devolver”

  Isso é convenção HTTP / REST aplicada no Rails, construindo este endpoint para API.

  O que o cliente (JavaScript) recebe?
=end
fetch("/users/5", { method: "DELETE" })
  .then(response => {
    console.log(response.status) // 204
  })

=begin
 response.status → 204
 response.body → vazio
 response.json() → ❌ erro (não tem corpo)

 Por isso o frontend não tenta ler JSON após DELETE.
 
 Comparação com render
 Com render: -> render json: user
 ✔ status
 ✔ body
 ✔ json
 
 Com head: -> head :no_content
 ✔ status
 ❌ body

 Aqui encerramos os endpoints
 quando for get    ->  show ou index ete ultimo para quando for todo registro User
            post   ->  create
            put    ->  update
            delete ->  destroy

 GET esta vindo buscar recurso, então vou enviar mostrando show
 POST está me enviando recurso , então vou cria-lo com CREATE
 PUT está pedindo atualização do recurso, então vou usar UPDATE
 DELETE está pedido para apagar ou remover recurso, vou usar DESTROY


                                 ROTAS                            

 Rotas são a porta de entrada da API
 São regras que direcionam URL + Verbos HTTP ->'GET,POST,PUT, PATCH e DELETE'.
 Elas dizem para qual Controller devem ir e qual action deve agir.

 Rota = caminho da requisição -> ação que executa a regra de negócio -> retorno -> resposta
 
 Antes de isso acontecer a requisição passa por uns processos:
  Aqui temos o modelo de arquitetura web chamado cliente e servidor, que define o papel de quem inicia a conversa e solicita o recurso.
   cliente é o que envia a requisição
   servidor é o que recebe
 
 Usando como exemplo verbo DELETE, vamos pensar no fluxo até o user ser apagado.
  1- Cliente -> Navegador envia  a requisição DELETE com usuário id: 5.
  2- Servidor web(Nginx) recebe e diz "Isso é para a aplicação Ruby, vou repassar".
  3- Servidor de Aplicação(Puma) recebe do Nginx.
  4- Camada Rack: Traduz o sinal para o Ruby
  5- Ruby on Rails recebe o objeto pronto, olha as rotas, chama o UsersController#destroy e apaga do banco.
    
  Perceba que a primeira coisa que o Rails faz é olhar a rota.
				
                                   IMPORTANTE!!!
 Sem rotas:
  o controller não é chamado
  por mais que tenha criado o método, sem rota, este método não existe.
  a API não responde
 Onde ficam as rotas?
  No arquivo-> config em routes.rb
 
 Rotas é isso, define para qual controller vai a requisição, qual ação tomar, baseado em cada verbo.
 
                          O padrão REST (o que o mercado usa)
 Em vez de escrever todas as rotas a mão, o Rails oferece um método para isso:
  resources :users
 Acima esta dizendo: rotas para o recurso users

  Esse comando cria 7 rotas REST.
  Exemplo:

 Verbo	              Rotas        Controller#action	           Uso
  GET	             users	         users#index	             listar

  GET             user|new              new          Exibir formulário HTML de criação

  POST	           |users	       users#create	         criar usuário no banco

  GET	         users|:id         users#show	         busca usuário específico

  GET         |users|:id|edit         edit           Exibir formulário HTML de edição

  PATCH|PUT	    |users|:id         users#update	       atualizar usuário existente

  DELETE	    |users|:id	       users#destroy	      remove usuário

 Elas ficam escritas em config|routes exatamente assim:

 get    "|users",          to: "users#index"
 post   "|users",          to: "users#create"
 get    "|users|:id",      to: "users#show"
 patch  "|users|:id",      to: "users#update"
 put    "|users|:id",      to: "users#update"
 delete "|users|:id",      to: "users#destroy"
 get    "|users|new",      to: "users#new"
 get    "|users|:id|edit", to: "users#edit"
 
  O comando crias os 7 rotas porém new e edit  só fazem sentido quando o Rails gera HTML 
  Api não renderiza formulário, quem cuida disso é o front.
  Por conta disso API usa somente 5 rotas

                             Por que Rails cria 7 se API usa 5?
 Porque Rails nasceu como: Framework full-stack(HTML + Backend)
  API veio depois.
   Por isso:
    new → formulário HTML
	  edite → formulário HTML

 Uma API não entrega o formulário (o visual), ela entrega apenas os dados (JSON). Quem desenha o formulário é o Front-end (React, Vue, Mobile).
 No Rails tradicional (MVC): Você acessa |usuarios|new (GET) para ver o formulário. Quando você clica em "Enviar", os dados são enviados para a rota de criação (POST |usuarios)
  
  Para ficar bem claro, veja como o resource mapeia isso no Rails:
  Verbo 	     Rota (URL)   Ação no Controller	          Objetivo
  GET	      |usuarios|new      	new	            Apenas mostrar o formulário em branco.
  POST    	|usuarios	         create	          Aqui sim: Salvar os dados no banco de dados.

                          OPÇÃO DE RESTRIÇÂO :only ou :except
   O método resource tem duas chaves hash de opções, ou seja, chaves que passadas indica qual rotas quer que não crie e quais devem ser criadas:
    :only e :except chamadas tecnicamente de opção de restrição.
    Elas funcionam como filtro, quando usadas quebram o padrão Rails
    Ele diz ao roteador do Rails: "Não use o comportamento padrão de criar tudo; crie apenas o que eu listar aqui"
   exemplo:
   resources :users, only: [:index, :show, :create, :update, :destroy]

   ou

   resources :users, except: [:new, :edit]
  Ao usar o except: [:new, :edit], você está dizendo ao Rails: "Crie o pacote padrão de rotas, MAS deixe de fora essas duas"

  O comando resources é importante porque ele cria as rotas na ordem correta.
  E isso é muito importante para o Rails, cada rota tem sua posição correta.

  Porém escrevendo as rotas na ordem certa, não é obrigatório resources estar em routes.rb
  As rotas por si ja conseguem fazer o rails levar as requisições para a action corretamente.

 Para ver as rotas, no terminal escreve-se -> rails routes
  o que se vê é algo do tipo:
    
  GET            |users                users#index
  GET            |users|:id            users#show
  POST           |users                users#create
  PATCH          |users|:id            users#update
  DELETE         |users|:id            users#destroy



                             PROCESSO MANUAL DO DELETE
 
 Usando o Exemplo do DELETE
  Um sistema externo quer apagar um usuário ID = 5
  Abaixo temos a Requisição no JS
=end

fetch("http://localhost:3000/users/5", {
  method: "DELETE"
})
=begin
 Aqui temos:
 Protocolo: HTTP
 Verbo: DELETE
 Recurso: /users/5
 Esse sistema NÃO conhece Rails
 Ele só conhece HTTP


                                A ROTA (entrada do sistema)

  Como vimos a primeira coisa que acontece é o Rails procurar a rota. Então precisamos criar essa rota baseado no verbo.
  Em config/routes.rb escrevemos rota para DELETE:
=end
 delete "/users/:id", to: "users#destroy"

=begin
  delete quando o Rails ve isso ele sabe que a rota é para deletar

  "|user|:id" este é o recurso que quero manipular

  to: é o direcionador da rota. Ele define o destino final da requisição dentro do código Ruby on Rails
    
  "users#destroy" aqui users é o user_controller, ou seja, o controlador chamado users. E destroy é o método que está dentro do controller, que vai resolver a requisição e retornar a resposta. 
  
  Após isso o Rails monta o params e o código segue para o destroy em Controller:
=end
class UsersController < ApplicationController
  def destroy
	users = User.find_by(id: params[:id])

    if users&.destroy
	   head :no_content
	else
		render json: {error: "User not found" }, status:404
    end		
  end
end

=begin
 Aqui acontece:
 
 params[:id] → veio da URL /users/5
 
 find_by → busca no banco
 
 destroy → apaga no BD
 
 head :no_content → resposta REST correta para DELETE

 Como aqui estamos falando de mudar algo no BD, precisamos criar esta conversa
 O controller não faz nada no BD, ele somente passa o comando para ele -> destroy
 Ele recebe a requisição analisa para onde vai
 Agora o proximo passo é fazer com que o MODEL fale com o BD
 em models precisamos definir o arquivo user.rb com:
=end
 class User < ApplicationRecord
 end

=begin
  Aqui applicationRecord é uma classe que herda de ActiveRecord::Base
  ActiveRecord::Base é o chefão, que vem dentro da Gem do Rails. Ele tem o superpoderes(Salva, Deleta, Busca etc.)
    
  No Rails se cria uma classe intermediária(ApplicationRecord) para que, se um dia,quiser criar uma funcionalidade que todos os models tenham, escreve-se nela, em vez de mexer direto no código interno do Rails.
    
  Mesmo sem escrever nada, o Rails já sabe o que fazer
  Quando se chama User.find_by no controller, o Ruby olha aqui e ve se tem essa herança.
  Tendo o controller, da uma ordem ao model:
   "Ei, classe User (Model), procure no banco de dados alguém com esse ID que recebi da rota."
    
   Model (User < ApplicationRecord): Ele entende que deve olhar na tabela users e gera automaticamente um comando SQL: SELECT * FROM users WHERE id = ? LIMIT 1.
   
   Se encontrar, o Model "empacota" os dados do banco em um objeto Ruby e entrega para a sua variável users.
     
    Se não encontrar, o Model devolve nil (nada).
    
    Caso não exista, seria enviado uma mensagem de erro, e interromperia todo o programa. O & safe esta ali para não deixar isso acontecer, e fazer com que o código siga para o else.

     Existindo, executara o destroy

     O controller: "Usuário encontrado, agora apague-se!"
      Model: O Model executa o comando SQL DELETE FROM users WHERE id = ?. Ele também verifica se existem regras (validations ou callbacks) antes de apagar.
      
      Se o Model apagou com sucesso: Ele retorna true. O Controller então executa o head :no_content, que envia para o Nginx (e depois para o usuário) o código HTTP 204, dizendo: "Feito! Não tenho mais nada para te mostrar porque o recurso sumiu".

	                                    RESUMO
 A requisição é feita pelo front, que envia para o servidor web
 O servidor web percebe que a requisição é para Ruby, e envia para o Puma(Servidor)
 O puma por sua vez a entrega para o Rails
 Rails leva ao controller e este verifica para qual endpoint vai
 No endpoint tem a logica para tratar os dados da requisição, neste caso do delete, o controller atua novamente enviando a ordem para o model
 O model recebe a ordem e retorna para o controller com a resposta
 E o processo acontece ao inverso de como veio até chegar ao front que envio a requisição.


                  Rota do PATCH que atualiza parcialmente
 Sabemos que o put se não tomarmos cuidado ao escrever ele, vai atualizar o objeto inteiro.
 Por isso o patch é a melhor recomendação.
 Para definir o patch para atualização e não o put, precisamos definir isso no routes.rb
=end

Rails.application.routes.draw do
  # Restringe para aceitar apenas o verbo PATCH na rota de update
  resources :users, only: [] do
    patch :update, on: :member
  end
end
=begin
  o only ja sabemos que é uma chave hash de opções do método resource.
   Aqui:
    resources :users, only: [] do
     patch :update 

  Esta dizendo: Para o recurso users, use o patch para atualizações(:update)
  
  Além disso quando definimos uma rota, precisamos dizer a quem aquela ação se refere:
   a um único registro ou à coleção inteira.
  O on: :member significa que a rota será criada focada em um membro específico daquela tabela (ou seja, um único usuário).
  
  Ao usar on: :member, o Rails automaticamente adiciona o :id na URL para você.
  Veja a comparação:
   Com on: :member:
   Rota gerada: PATCH /users/:id/update 
    Através dessa rota o Rails sabe que ira levar para a action-> user#update
  
  Como é uma atualização, sera feita em um formulário e, automaticamente o id será colhido pelo front e transportado até a action pelo params
   No Controller: Você terá acesso ao params[:id] para fazer o User.find(params[:id]).

 Normalmente, o Rails já faz isso automaticamente quando usamos o padrão APIs Rest:
=end
Rails.application.routes.draw do
  # Restringe para aceitar apenas o verbo PATCH na rota de update
 resources :users, only: [:update]
end
=begin
 Agora para que escrever tudo aquilo se temos esse mais curto
  É importe ver os dois meios, porque podemos pegar uma aplicação que usa o primeiro
  Assim saberemos do que se trata.
 A diferença é que o padrão gera a URL /users/:id, enquanto o código com on: :member dentro do bloco gera /users/:id/update. No mundo das APIs REST, o padrão (/users/:id) é o mais utilizado.

 Dica de ouro para APIs Rails:
 Se você estiver construindo uma API para um PDV (Ponto de Venda), o uso do PATCH é obrigatório para performance. Imagine atualizar um estoque de 10.000 itens; você não quer enviar o objeto inteiro do produto, apenas a nova quantidade (quantity).
=end


#                   Validações no Model + Retorno de erro de API

=begin
 IMPORTANTE!!!!!
  As validações acontecem sempre que tentamos persistir(salvar) dados no BD
  Isso acontece nos dois principais momentos do ciclo de vida de um registro:

   Criação (POST): Quando você usa o comando .save ou .create para um objeto novo.
   Atualização (PUT/PATCH): Quando você altera um usuário que já existe e tenta salvar as mudanças com .update ou .save
    Métodos que "disparam" as validações:
     .save
     .create
     .update


 As validações de Model e os retornos de erro são as duas metades de uma mesma conversa: o Model decide o que é certo, e o Controller comunica o que deu errado.

 Validação é a camada de segurança, que impede que dados "sujos" ou incompletos entrem no banco de dados. No Rails, usamos o Active Record Validations.

 Erro em API é: a tradução técnica da falha do Model para uma linguagem que o Front-end (React, Vue, Mobile) entenda, geralmente em JSON e acompanhado de um Status Code HTTP
			
 Ideia Central(Antes do Código)
 CONTROLLER = Cuida da burocracia da requisição
 MODEL = Cuida da Verdade dos Dados
  
 Ou seja
  Controller recebe
  Model decide se pode ou não salvar

              MODEL: O Guardião da Verdade (Onde moram as validações)
 O Model é quem diz: "Eu não aceito um usuário sem e-mail" ou "A senha precisa ter 6 dígitos".
 Ele não sabe o que é um navegador, um celular ou um JSON.
 Ele só se preocupa se o dado é puro e correto antes de entrar no banco de dados.
 Isso é Active Record Validations.
 
                   CONTROLLER: O Diplomata (Cuida da Burocracia)
 O Controller recebe a "fofoca"(os parâmetros) da internet e pergunta ao Model se aquilo é verdade.
 A burocracia dele é: "Se o Model disse que é verdade, eu respondo 201 Created.
 Se o Model disse que é mentira, eu pego a lista de erros que ele gerou e transformo em um JSON para o usuário ler".
 Isso é Action Controller Overview(Visão Geral).
  
                          Onde ficam as validações?
 Sempre ficam no Model.
=end
# app/models/user.rb
class User < applicationRecord
end

=begin
 Estamos falando de dados que vão persistir ou serem filtrados do BD
 Então é aqui que o Rails espera:
  regras
  limites
  consistência dos dados
 
 O model é quem conversa com o BD, por isso o controller espera.

 Primeira validação básica
  Exemplo: nome obrigatório
=end
class User <applicationRecord
  validates :name, presence: true
end
=begin
 validade -> é um método do ActiveRecord
 Serve para declarar regra de negócio, não salva nada, só verifica.
 
 :name é um simbolo(hash) representando a coluna name da tabela user

 presence: true Regra, não pode ser vazio

 Em português:
  Um User só é válido se tiver name.
   É isso que significa este validate

   Se vazio o Rails vê assim:
    nil ou 	" "


  Quando o Controller chama:
   user.save
 
 O Rails faz automaticamente:
  roda todas as validações
  se alguma falhar → não salva
  guarda os erros em user.errors

  O banco nem é tocado se falhar.

 Imagine o Código:
=end
user = User.new(active: true)
user.save
=begin
 Aqui no código foi inicializado o User, porém sem passar name:
 E definimos validates :name, presence: true
  Quando tenta salvar: user.save
  O resultado é
   false
 Isso significa que é obrigatório passar o name para o BD, automaticamente o model gera o erro e o guarda em user.erros
 
 “O model empacota os erros e guarda em user.errors.
  Ele não devolve o erro ao controller.
  Eu, como programador, uso esses erros no controller
  para montar a resposta da API.”
 
                         user.errors vs user.errors.full_messages
 user.errors -> É um objeto interno do Rails, estruturado: <ActiveModel::Errors ...>
 user.errors.full_messages -> É o formato humano:
  ["Name can't be blank", "Name is too short"]

  Em API o que é devolvido é o formato humano
  Tanto um como o outro são criados pelo model -> ActiveModel
  O controller apenas os lê, não cria, não formata e não interpreta.
   

                      Onde cada coisa vive de verdade
  user.errors vive dentro da instância do model
  user.errors.full_messages apenas transforma os erros internos em frases humanas e também vive dentro da classe ActiveModel, o controller só consome
   
                              Fluxo interno do erro

 Quando o controller chama o model: user.save
  O model roda as validações: validates :name, presence: true 
   Rails executa: O valor de name e verifica se está vazio
   
   Se falhar…
    O Rails não levanta erro
    Ele faz isso silenciosamente:
    user.errors.add(:name, "can't be blank")
    Esse erro fica guardado dentro do model


	save retorna false: user.save # => false

    Mas não dispara exceção, ou seja, não para o fluxo do código por isso a execução continua normalmente.

    Controller verifica o resultado
    if user.save
      ...
    else
      false
    end

    Aqui o controller não sabe o motivo ainda, ele só sabe: “não salvou”.
    
    Controller consulta o Model: user.errors
    
    O model responde: “Aqui estão os erros que encontrei”
    
	Controller pede os erros formatados: user.errors.full_messages

    O model responde: ["Name can't be blank", "Name is too short"]
    
    
    Isso já vem pronto sem escrever uma linha de código, está Guardado no model
    O que precisamos fazer e no else passar o erro
	Exemplo com o verbo put onde o endpoint é update
=end

def update
  user = User.find_by(id: params[:id])

  if user&.seve(user_params)
	render json: user
  else
	render json: {errors: user&.full_messages || ["User not found"]}
	            status: :unprocessable_entity
  end
end
=begin
 O endpoint recebe o params e baseado no id que chegou do front na requisição, ele vai filtrar esse user pelo seu id
			
 Na segunda parte entra na condicional
  nela temos uma função que o controller vai verificar se os dados são verdadeiros, estando tudo certo volta
   o controller manda o model salvar, o model verifica as validações, encontra faltando, cria e guarda o erro e retorna falso 
   o controller vẽ o false, entra no else, pede o erro e o retorna o erro na forma humana para view.

  Dentro do else temos duas mensagens de erro:
  A que vem do model -> errors: user&.full_messages e -> || ["User not found"]
 
 No caso aqui se o model guarda o erro, o controller não sabe o que tem, só executa.
 O & safe, não deixa o código parar, então se por acaso o user for nill, e resposta enviada seria null ao front. E isso seria apresentado para o usuário.
 Para evitar isso temos o || -> ou
 que significa que se for null o -> full_messages, sera apresentado para o front esta segunda mensagem.
=end

                              #Validações avançadas no MODEL

class User < ApplicationRecord
  validates :name, presence: true, length:{minimum: 3}

  validates :email, presence: true, uniqueness: true
end
=begin
  Lembrando que os erros são guardados em user.errors

 Além do nome ser obrigatório(presence: true), foi acrescentado:
  length {minimum: 3} -> defini uma regra que este campo deve ser de tamanho mínimo sendo 3 caracteres
  Se o usuário tentar enviar um nome com apenas 1 ou 2 letras (como "Al" ou "Jo"), o Model vai barrar e dizer que o campo é curto demais.
   Exemplo: "Name is too short (minimum is 3 characters)"

   Temos também de novo validação no email
    campo também é obrigatório(presence: true)
	uniqueness: true -> é o "fiscal de exclusividade" do Rails. Ele garante que não existam dois registros com o mesmo valor naquela coluna no banco de dados.
     O erro gera -> Email has already been taken" -> Email já foi atendido,
	  ou seja, ja existe um no banco.


 Então quando aplicado: user.errors.full_messages
  retorna
  [
    "Name can't be blank",
    "Name is too short (minimum is 3 characters)",
    "Email has already been taken"
  ]
 
  Resumindo:
	usando errors: user.full_messages no else assim
=end
render json: { errors: user.full_messages }, status: :unprocessable_entity
=begin
 Automaticamente o json leva isso:
=end
{
  "errors": [
    "Name can't be blank",
    "Name is too short (minimum is 3 characters)",
    "Email has already been taken"
  ]
}
#                 Controller devolvendo erro estruturado
# Erros por campo (muito usado em API) -> user.errors.messages
=begin
 Este user.errors.messages é tratamento de erro estruturado por campo.
  Ideal quando:
   Frontend quer tratar erro por campo
   Ex: destacar input vermelho, tooltip, etc.
=end
render json: {errors: user.errors.messages}, status: :unprocessable_entity
=begin
 Automaticamente o json leva isso:
=end
{
  "errors": {
    "name": ["can't be blank", "is too short"],
    "email": ["has already been taken"]
  }
}
=begin
 errors.full_messages é para exibição direta,
 errors.messages é para tratamento estruturado no frontend.
=end
#                   Validação customizada
=begin
 Além das validações que temos disponíveis no model, podemos criar validações próprias.
  No model é onde fica as regras de negocio
  O controller não valida regra somente orquestra.
   Exemplo de código customizado:
=end
class
  User < applicationRecord
  validates :name_cannot_be_admin

  private

  def name_cannot_be_admin
    if name == "admin"
      errors.add(:name, "cannot be admin")
    end
  end
end
=begin
 Aqui nesta validação temos :name_cannot_be_admin
 Essa é uma função que recebe :name e antes de salvar executa o método.
 Ela verifica se o que foi escrito no campo name, é admin
 se for executa um erro
  O proposito é marcar o objeto como inválido
 Este exemplo é só para fim didático, para mostrar como se cria uma validação customizada.
 
 O método é privado porque, se torna uma regra interna do model, só funciona aqui, e mostra que as vezes se faz necessário criar, além do método existentes do model.
 Toda vez que acontecer validações aqui este método sera executado.
=end





#                                 Exceções no Rails 
=begin
 Exceções são o jeito que o sistema diz: "Deu ruim, e eu não sei como continuar!".
 Imagine que seu código é uma receita. Se faltar sal, você (o Controller) percebe e resolve. Mas se o fogão explodir, a receita para na hora. Isso é uma exceção(parar na hora)

 Exemplo em API:
  Os dados não existem: ao tentar deletar o id 99, porém ele não está no BD. O Rails levanta ActiveRecord::RecordNotFound -> registro não encontrado -> status HTTP 404
  Erro de conexão: O BD cai
  Erro de código: Tentar chamar um método em algo que é nil -> NoMethodError

 Qual a diferença entre Validação e Exceção?

  Validação:
 O que é? -> Erro"esperado"(ex: senha curta)
 O código para? -> O código não para, o Rails apenas marca como inválido.
 Status HTTP -> Geralmente 422 Unprocessable Entity.
  
 Exceção:
  O que é? -> Erro "crítico" ou interrupção do fluxo.
  O código para? -> Sim. O código para na linha do erro.
  Status HTTP -> Geralmente 404 Not Found ou 500 Internal Error

 Exceção gera interrompimento do fluxo

 Ate aqui o que vimos dos métodos .save e .update, é que eles não levantam exceções.
  Esses métodos só retornam:
   true -> deu certo ou false -> falhou por validação.

  É por isso que usamos If else
   if user.save 
    .
   else
   render json: { errors: user.errors.full_messages }
   end

  Se deu certo execute isso....
  Se deu falhou faça isso ...
 
  Para evitar essas escrita longa temos essa opção--> !
  ! isso se chama -> bang
   em português: Se der errado GRITE!
  
  Usando o bang não temos retorno de true ou false para o controller
   com bang temos levantamento de exceção
 
 Isso user.save -> retorna true ou false
 Isso user.save! -> salva ou levanta exceção

 O !bang não é a exceção, ajuda a fazer o levantamento de exceção

  O bang é excelente quando:
   Script de migração de dados: não quero que o processo continue se um registro falhar
   Transactions: Se estiver salvando um Pedido e temos vários itens neste mesmo pedido, se usa o ! para que, se um item falhar, tudo seja cancelado(Rollback).

 Perceba que tem casos para usar o ! bang
 Assim como tem casos para usar & safe, falado anteriormente para evitar a exceção.
  
 Imagine este caso:
  Imagine que você quer o nome do usuário: user.name
  Se o user for nil (não encontrado no banco), o Rails vai travar sua API com um erro 500.
  Para evitar o erro técnico -> exceção, usa o &safe para não permitir o travamento da API.

  Temos ai duas diferenças para o uso correto de !bang ou &safe

  Além disso, usar o ! bang, melhora o código deixando-o mais limpo.
   O código abaixo representa isso dito:
=end
# aqui temos o create sem o !
class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :active)
  end
end

# olha a diferença com !
def create
  user = User.create!(user_params)
  render json: user, status: :created

  private

  def user_params
    params.require(:user).permit(:name, :active)
  end
end
=begin
 No primeiro código, primeiro filtra depois entra no if else para resolver
 No segundo veja que o filtro ja é feito resolvendo e, na outra linha ja devolve a reposta
  Isso ->  render json: user, status: :created
   Em português:
    “Pegue o objeto user, transforme em JSON e envie como resposta HTTP com status 201”
     Aqui não existe lógica de erro
     Esse render só roda se tudo deu certo


 Perceba que o erro no primeiro é tradado com full_messages
  Erro que o model empacotou e guardou em user.errors
  Neste exemplo é o controller que esta resolvendo
  porque ele vai olhar o errors, e o retorna para json
  ou seja controller recebendo resposta true ou false e
  agindo dentro do if e else

 No segundo o controller confia no model, se der ruim o sistema resolve.
  Aqui no segundo ele chama o model direto e deixa com ele.
  O model vê !, sabe que não precisa retornar false, sabe que tem que fazer a exceção
  caso seja false

  O ! altera completamente o fluxo.
  Sem o ! é:
  valida
  falha?
  retorna false
  guarda erros em user.errors
  código continua
  você precisa de if/else
  para controller atuar


  Fluxo do model:
    roda validações
	se passar salva
	se falhar -> lança a exceção
     ele chama -> raise ActiveRecord::RecordInvalid para registro invalido
    raise -> significa subida
	então isso -> raise ActiveRecord::RecordInvalid
	significa: suba a exceção quem esta no ActiveRecord em RecordInvalid(Registro Invalido)

	RecordInvalid -> registro invalido
	antes era o -> errors que empacotava o erro, para o controller
	aqui é RecordInvalid quem detém o erro
 
 O Rails captura o erro através de rescue_from
 Este abaixo:
=end
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def handle_invalid_record(error)
    render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
  end
end
=begin
 O ActionController::API é uma versão "fitness" (leve) do controlador padrão do Rails.
  ApplicationController esta herdando ActionController::API
  Dito isso temos uma classe voltada para API.

  Isso aqui: class ApplicationController < ActionController::API
  quer dizer:
   “Estou criando o controller base da aplicação, voltado para API”
   Isso significa que tudo que estiver aqui, serve para toda API, sem precisar repetir no controller.

 ActionController::API (importante)
 Rails tem dois modos:
 ActionController::Base → apps com HTML, views, cookies
 ActionController::API → somente API (JSON)
  Aqui você está dizendo:
 “Essa aplicação não renderiza páginas, só responde dados”
  
 rescue_from -> Resgatar a partir
 ActiveRecord::RecordInvalid isso aqui é: o erro esta em RecordInvalid e RecordInvalid  este está em ActiveRecord

 Então isso -> rescue_from ActiveRecord::RecordInvalid, significa:
 Resgate o erro a partir de RecordInvalid que esta no AtiveRecord

  with -> significa -> com e, handle_invalid_record -> lidar_registro_inválido
   ou seja: regate o erro, e entre na função chamada handle_invalid_record
   para lidar com o registro inválido e enviar resposta.
 Este trecho abaixo faz isso, envia resposta igual do if e else do controller
  def handle_invalid_record(error)
    render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
  end

 rescue_from faz:
  Ele diz ao Rails:
  “Quando esse erro explodir, não derrube a aplicação.
  Chame o método handle_invalid_record.”
   O erro vira um objeto Ruby, não uma mensagem solta.
    este objeto é a exceção, empacotada em RecordInvalid e preparada para o json

 Então, usar o !bang, gera mudança de fluxo.
 Tudo esta sendo tratado em outro ambiente fora do controller sem if e else.


	                  Então… como o erro sai do model?
=end
User.create!(name: "")# digamos que esta vazio, ou seja nill
# No model a validação diz que nome é obrigatório
validates :name, presence: true
=begin
 Rails faz:
 1 roda validações
 2 encontra erro
 3 cria objeto RecordInvalid
 4 lança exceção
=end
raise ActiveRecord::RecordInvalid
# A exceção RecordInvalid carrega o objeto que deu erro dentro dela

# O código do controller para aqui
def create
  user = User.create!(user_params)   # 💥 explode aqui
  render json: user, status: :created # ❌ nunca executa
end
=begin
 Esse render não roda
 Ele não recebe erro nenhum
 Ele não sabe que houve erro
 Tudo esta acontecendo na primeira linha, lá no model, sem retorno aqui.

 Quando a exceção explode:
 Rails interrompe o método
  2Procura um rescue_from compatível
  3Encontra no ApplicationController
  4Chama:
=end
rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
=begin
 Neste momento ApplicationController assume o controle
 o método handle_invalid_record vira o endpoint real
=end
def handle_invalid_record(error)
  render json: {
    errors: error.record.errors.full_messages
  }, status: :unprocessable_entity
end
=begin
 Esse render:
 fecha a requisição
 gera HTTP response
 é a resposta final

 E o Rails envia a resposta direto para o HTTP, não o controller.
 Nem passa lá no método def create
			
 Rails mostra
  HTTP/1.1 422 Unprocessable Entity(Entidade não processável)
  Content-Type: application/json
 e o corpo do json fica:
=end
{
  "errors": [
    "Name can't be blank"
  ]
}
# E o JS recebe
.then(response => response.json())
.then(data => console.log(data.errors))
=begin
 O JS não sabe:
  que foi rescue
  que foi model
  que foi exceção

  Ele só sabe:
  “Recebi status 422 + JSON”

  Resumindo:
  O Rails responde no lugar do controller original
   Ele encerra a requisição
   O JS recebe normalmente

 O rescue_from é um controller invisível, global.

 Perceba que a exceção aqui foi:
  rescue_from ActiveRecord::RecordInvalid
   Porque o registro foi invalido(RecordInvalid)

 Com isso podemos dizer que a exceção dependo do erro, do que acontece.

  Além da exceção -> ActiveRecord::RecordInvalid com status HTTP 422
  Temos:
   ActiveRecord::RecordNotFound → 404 
   ActiveRecord::RecordNotDestroyed → 422 
   ActionController::ParameterMissing → 400

 Atençaõ!!!!
  Todas as exceções rescue_from são escritas em app/controllers/users_controller.rb

 Vamos ver um próximo exemplo.
=end
POST /users
Content-Type: application/json

{
  "user": {
    "name": "William",
    "email": "william@email.com"
  }
}
=begin
 Aqui acima temos um requisição user com os campos name e email

 Essa requisição esta marcada como post, ou seja, são dados para persistirem no banco.
 Criação de um novo usuário, onde a action crete vai atuar.
=end
def create
  user = User.create!(user_params)
  render json: user, status: :created

  private

  def user_params
    params.require(:user).permit(:name, :active)
  end
end
=begin
 Antes de criar este usuário no BD, os dados vão passar pelo método privado onde temos:
 require e permit falado anteriormente

 Abaixo temos a mesma requisição porém com um erro:
=end
POST /users
Content-Type: application/json

{
  "name": "William",
  "email": "william@email.com"
}
=begin
 Não existe a chave "user": como na anterior.


 Quando chega aqui:
=end
params.require(:user)

# O Rails procura
params[:user]
# não encontra a chave user e faz
raise ActionController::ParameterMissing.new(:user)
=begin
 Neste caso o Rails não chama rescue_from ele já tem um mecanismo interno que faz isso:
 Quando uma exceção desse tipo acontece, ele:
 
 Intercepta a exceção
 Converte para HTTP 400
 Retorna resposta padrão
 Isso acontece dentro do middleware do Rails (ActionDispatch).
 Ou seja:
 Você não precisa declarar:
 rescue_from ActionController::ParameterMissing
  Porque o Rails já sabe que isso é um erro 400.

 Vimos acima as seguintes exceções:
  ActiveRecord::RecordInvalid → Registro Invalido status HTTP 422 
  ActiveRecord::RecordNotFound → Registro não Encontrado HTTP 404 
  ActionController::ParameterMissing → Parâmetro Ausente HTTP 400 

 Para concluir vamos ver:
 ActiveRecord::RecordNotDestroyed → 422 

 O sistema recebe uma requisição para apagar um usuário
=end
# Requisição em JS
fetch("http://localhost:3000/users/5", {
  method: "DELETE"
})
.then(response => {
  if (response.status === 204) {
    console.log("Usuário deletado com sucesso");
  } else {
    return response.json().then(data => {
      console.log("Erro:", data);
    });
  }
})
.catch(error => {
  console.error("Erro na requisição:", error);
});

=begin
 O usuário esta com o id 5
 O Rails recebe a requisição e olha o verbo delete e procura a rota
  delete "users/:id", to: users/destroy
 
  O Rails leva para action destroy que tem o seguinte código
=end
def destroy
  user = User.find(params[:id])
  user.destroy!
  head :no_content
end
=begin
 Aqui não esta sendo usado o !bang e sim o find
  find é como o !bang levanta exceção
   como precisa filtrar o usuário aqui é melhor usar o find

 Ja vimos o find_by e sabemos o que ele é flexível, vc passa o id porém ele busca o objeto por qualquer coluna -> name, email etc.
 Se ele não achar nada ele retorna nil, repito retorna nil.

 Find é o RIGOROSO, não retorna nada, explode a exceção
  Se quando for deletar não achar o usuário a exceção é:
  ActiveRecord::RecordNotFound(registro não encontrado) e interrompe o fluxo do código.
 
  Neste caso o find acha e não da exceção, porque seu proposito é só achar o id.

  O fluxo vai para user.destroy! antes de apagar ele verifica o model.
   Lá ele acha isso:
=end
class User < ApplicationRecord
  before_destroy :prevent_admin_deletion

  private

  def prevent_admin_deletion
    if admin?
      errors.add(:base, "Admin cannot be deleted")
      throw(:abort)
    end
  end
end
=begin
 Isso acima é um código que fica em app/models/user.rb
  Ele é uma regra de negocio
  Antes de apagar o usuário, o Rails verifica este código.
    
  Dentro deste código temos:
   before_destroy -> significa antes de destruir
    Ele é um callback(revogador) do ActiveRecord, ou seja, ele volta para trás, volta atrás na decisão se encontrar uma regra.

 :prevent_admin_deletion -> significa impedir_exclusão_de_administrador
   Esse é o método que é chamado por before_destroy

   Dentro dele temos:
    if admin? verifica se o usuário é administrador pelo campo boolean no banco: admin:boolean
      Se este for admin vai executar o trecho abaixo 
      errors.add(:base, "Admin cannot be deleted")

      errors.add -> adiciona um erro ao objeto
      
      throw(:abort) -> throw é jogar e abort é abortar

 Com isso o Rails olha para o seu Model e vê: "Opa, tenho um before_destroy aqui!".
  Ele executa o seu método prevent_admin_deletion.
  O Model "trava": O throw(:abort) faz o método .destroy! perceber que a operação falhou.
  A Captura: O Rails interrompe a execução do seu UsersController e olha para o topo da classe (ou para o pai, o ApplicationController).
    O Escudo: Ele encontra o rescue_from ActiveRecord::RecordNotDestroyed.
=end
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotDestroyed, with: :handle_not_destroyed

  private

  def handle_not_destroyed(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end


#                       destroy + find + head :no_content(não tenho conteúdo)
=begin
 O que significa DELETE em REST?
  “Apague o recurso.
  Se deu certo, não preciso de dados de volta.”
  Por isso o status certo é 204 No Content(sem conteúdo).

 Código sem o ! abaixo
=end
def destroy
  user = User.find_by(id: params[:id])

  if user
    user&.destroy
    head :no_content
  else
    render json: { error: e.record.errors.full_messages }, status: :unprocessable_entity
  end
end
=begin
 Aqui o controller resolve tudo assim como foi no create.
 O usuário da requisição procurado é filtrado pelo id
 Entra na condicional
 if achar o usuário, o retorno é true e o .destroy apaga
 como foi apagado não corpo para o json, o head então envia a resposta código HTTP
 se não achar o & safe impede a exceção e deixa o fluxo seguir para o else
 render json leva a resposta de User não encontrado
 ponto final 
 
 O código é defensivo porém verboso
  O controller precisa:
   verificar existência
   verificar sucesso
   montar resposta

 Com o ! bang isso mudo
=end
def destroy
  user = User.find(params[:id])
  user.destroy!
  head :no_content
end
=begin
 Da mesma forma que o create! percebe-se que aqui ja não temos o if else
 ou seja, o controller esta saindo do jogo
 Rails vai controlar exceções

 Perceba que antes usamos find_by e agora só o find
  Isso porque find_by é flexível, vc passa o id porém ele busca o objeto por qualquer
  coluna -> name, email etc.
  Se ele não achar nada ele retorna nil, repito retorna nil.

  Find é o RIGOROSO, não retorna nada, explode a exceção:
   ActiveRecord::RecordNotFound e, interrompe o fluxo do código.
  Se não for tratado gera o erro 404(Not Found) no ambiente de desenvolvimento.
  RecordNotFound significa: registro não encontrado.

 Perceba que para esse caso é :RecordNotFound 
 O anterior foi RecordInvalid
 Ou seja, duas exceções diferente em casos diferentes.

  Então o find não perdoa, se não acha o id, não procura por outro campo.
  Chama logo:
=end
rescue_from ActiveRecord::RecordNotFound, with: :not_found

# O CÓDIGO POR DEBAIXO DOS PANOS

class ApplicationRecord < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found


  private

  def not_found
    render json:{erro: "User not found"  }, status: :not_found
  end
end

=begin
  Aqui: rescue_from ActiveRecord::RecordNotFound, with: :not_found

  Está mandando Resgatar a partir do ActiveRecord o erro que esta RecordNotFound,
  e tratar com(with) o método privado not_found 

  Aqui ja sabemos que isso será empacotado o Rails vai enviar para JS sem corpo, sem json.

                                  ATENÇÂO:
  
 Detalhes importantes:
   Status 204 No Content: 
     No destroy, é padrão retornar head :no_content em vez de um JSON, porque o objeto não existe mais para ser exibido. Confira a lista de status HTTP no MDN.

   Callbacks:
     Antes de apagar, o Rails roda os before_destroy. É aqui que entra aquela sua lógica de prevent_admin_deletion. Se o throw(:abort) acontecer, o registro permanece intacto no banco. Veja mais sobre callbacks de destruição no Rails Guides.
                   
 Erro 404 REAL (ActiveRecord::RecordNotFound)
   Isso que vimos acima RecordNotFound, ou seja, Registro não encontrado gera o STATUS 404.
   O status 404 Not Found é o status que diz: "A rota existe, mas o recurso específico que você pediu não foi encontrado"
   Ele acontece principalmente quando o método find não encontra o recurso.

 O erro 404 nunca deve ser tratado na action
   O melhor é trata-lo uma vez só no ApplicationController, pelo Rails como no exemplo acima
 
 O Rails NÃO tem um rescue_from diferente para cada action

 O Rails não associa exceção a action.
   Ele associa exceção ao que aconteceu dentro da action.

 Ou seja:
   A action não define o erro.
   O que define o erro é o método que você chamou lá dentro.

   Exemplo:
    Em index 
=end
def index
  users = User.all
  render json: users
end
=begin
 Normalmente não levanta erro, ela é responsável por listar registros
  User.all informa se tem ou não registro
  Se houver usuários: O Rails retorna um JSON com a lista e o status HTTP 200 OK.
  Se a tabela estiver vazia: O Rails retorna um array vazio [] e o status também é 200 OK.


 Em SHOW
=end
 def show
  user = User.find(params[:id])
  render json: user
end
=begin
 Aqui no Show podemos sim ter exceção
   Sabemos que ele usa find e este procura exclusivamente o id.
   Se não achar temos: 
     RecordNotFound(Registro não encontrado) status HTTP → 404
  Rescue correto:
   rescue_from ActiveRecord::RecordNotFound, with: :not_found
    
 Em CREATE:
=end
def create
  user = User.create!(user_params)
  render json: user, status: :created

  private

  def user_params
    params.require(:user).permit(:name, :active)
  end
end
=begin
 Aqui gera:
   RecordInvalid(registro invalido) status HTTP → 422
   ParameterMissing(Parâmetro ausente) status HTTP → 400
  Por quê?
     create! levanta RecordInvalid
     params.require(:user) levanta ParameterMissing
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :bad_request

  Em UPDATE
=end
def update
  user = User.find(params[:id])
  user.update!(user_params)
  render json: user

  private

  def user_params
    params.require(:user).permit(:name, :active)
  end
end
=begin
 Aqui temos o find + !bang + user_params
 Aqui gera:
   RecordNotFound → 404
   RecordInvalid → 422
   ParameterMissing → 400
 rescue_from ActiveRecord::RecordNotFound, with: :not_found
 rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
 rescue_from ActionController::ParameterMissing, with: :bad_request


 Em DESTROY
=end
def destroy
  user = User.find(params[:id])
  user.destroy!
  head :no_content
end
=begin
 Aqui temos find + !bang
   Por quê?
     find pode falhar
     destroy! levanta erro se callback impedir destruição
 Aqui gera:
   RecordNotFound → 404
   RecordNotDestroyed → 422
 rescue_from ActiveRecord::RecordNotFound, with: :not_found
 rescue_from ActiveRecord::RecordNotDestroyed

 NEW e EDIT
  Essas são actions de view (HTML).
  Normalmente:
  Não usam !
  Não levantam exceções comuns
  Só renderizam formulário
  Em API pura geralmente nem existem.

 RESUMO
  Então a regra profissional é:

   Não é:
   "cada action tem seu rescue_from"
   
   É:
   
   "cada tipo de erro tem seu rescue_from"
   
  E isso normalmente fica no ApplicationController.

  Action	       Pode gerar	                            HTTP
  index	       quase nunca	                             200
  show	       RecordNotFound	                           404
  create       	RecordInvalid / ParameterMissing	       422 / 400
  update       	RecordNotFound / RecordInvalid	         404 / 422
  destroy      RecordNotFound / RecordNotDestroyed       404 / 422

 Conclusão definitiva
  Você não pensa:
   qual rescue_from para cada action?
   
   Você pensa:
   
   quais exceções meus métodos podem levantar?
   
   E registra o rescue globalmente.

 O fluxo real é assim
  A requisição bate na rota
  A rota chama a action
  A action executa código
  Se uma exceção for levantada
  O Rails procura um rescue_from compatível em user_controller.rb
  Se encontrar rescue_from → trata
  Se não encontrar gera erro→ 500
=end

#                               ERROR 500

=begin 
 O HTTP 500 é o Internal Server Error (Erro interno do servidor) é o famoso "deu ruim no servidor". Ele é um erro genérico que indica que o servidor encontrou uma condição inesperada que o impediu de atender à solicitação. 
 
 Diferente do 404 (não encontrei) ou do 422 (regra de negócio), o 500 diz que o seu código quebrou ou o servidor travou
 
 Ele acontece aqui no Rails porque: 
  Erro de Sintaxe ou Lógica: Você escreveu algo errado que o Ruby não consegue processar (ex: tentar somar um número com um texto: 1 + "dois").
  Exceção não capturada: O código deu um erro e você não usou um rescue_from ou begin/rescue para tratar.
  Banco de Dados fora do ar: O Rails tenta conectar ao banco e falha.
  Variável Nula (nil): O erro mais comum no Rails, o NoMethodError: undefined method '...' for nil:NilClass. 

  Por que você deve evitar que sua API retorne 500?
   Falta de Informação: Para quem usa sua API, o 500 não explica nada. Ele apenas diz "tente mais tarde".
   Má Impressão: Passa a imagem de que o sistema está instável ou mal programado.
   Segurança: Às vezes, um erro 500 mal configurado pode exibir detalhes do seu código (stack trace) para um hacker.

  Como o rescue_from ajuda a evitar o 500?
   Lembra que configuramos o rescue_from ActiveRecord::RecordNotFound no seu ApplicationController?
   Sem o rescue: O Rails "morre" com um erro feio e retorna 500.
   Com o rescue: Você intercepta o erro e retorna um 404 educado em JSON. Saiba mais sobre códigos de status HTTP na MDN.
   Dica de Debug: Se você vir um erro 500 no seu navegador ou Postman, abra o terminal onde o comando rails server está rodando. Lá aparecerá o texto em vermelho explicando exatamente em qual linha o seu código "capotou".
    
   FINAL
   O que fica onde
     Controller
       recebe requisição
       chama model
       responde HTTP
     
      Model
       valida
       persist
       explode com exceções
     
     ApplicationController
       captura exceções
       padroniza erros





       PRÓXIMO PASSO AGORA É -> Request Specs (teste de API ponta a ponta)

 Entendendo o que é Request Spec(Solicitação de especificação)
   No contexto do Ruby on Rails, Spec é uma abreviação de Specification (Especificação).

 Por que "Especificação" e não apenas "Teste"?
   A filosofia por trás de RSpec é o BDD, ou seja, Behavior-Driver Development ou
   Desenvolvimento Guiado por Comportamento.
    A ideia é que você não está apenas "testando o código", mas sim escrevendo uma especificação de como o seu sistema deve se comportar.
  
  Request Spec: É a especificação de como uma requisição HTTP deve se comportar.


  Exemplo: Você descreve: 
   "Quando eu enviar um GET /users/1, a especificação diz que o sistema deve retornar o usuário em JSON com status 200".

 O que um "Request Spec" faz exatamente?
   Ele simula um "cliente" (como o Postman ou um navegador) enviando uma requisição para a sua API e verifica se:
     O Status HTTP está correto (200, 404, 422...).
     O JSON de resposta contém os dados esperados.
     O registro foi realmente criado/alterado no Banco de Dados.

 O ecossistema Ruby possui uma biblioteca com esse nome: RSpec

 Existem vários tipos de teste no Rails:
  Model spec -> testa validações e regras internas
  Controller spec -> quase não se usa mais
  Request spec -> testa a API como o mundo real usa

 Request spec simula:
   requisição HTTP real
   passando params
   recebendo status
   recebendo JSON

 É como se fosse o JS chamando sua API
=end



