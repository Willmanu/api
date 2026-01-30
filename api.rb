# A proposta aqui é estudar lógica ruby para APIs
# APIs Application Programming Interface ( Interface de Programação de Aplicações)

=begin
Mas antes -> definir as estruturas de código para ferramentas
de manipulação para API

Estruturas de dados usa → [] e {}
[] para array
{} para hash
Blocos de código → {} ou do...end
	não é uma regra para seguir a risca
 {} usa-se em blocos curtos de uma linha
  do ...end use-se bloco mais de uma linha
	porém tanto faz, fazem a mesma coisa
=end

# Entrada de dados para manipulação
users = [
  { id: 1, name: 'William', active: true },
  { id: 2, name: 'Ana', active: false }
]

=begin

 isso é um array user[]
 dentro é hash{} id, name, active são chaves
 a variável users esta recebendo um array com dois blocos de dados hash com suas chaves e valores
 quando escrevo isso
 users[0]

 o retorno é o bloco de dados hash de chave id 1 com todos os valores
   {id: 1, name: "William", active: true}

 porque estou acessando a posição 0 do bloco de dados do array
  zero em array é a posição de numero 1

 user[0][:name]
 o retorno é
  "William"
 porque estou acessando o item 0 do array, e pedindo para trazer a chave name: do hash, que tem o valor mostrado

                           Array
O array foi criado para lhe dar com ordem e desempenho bruto em sequência.

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
O Hash (Dicionário/Objeto) foi criado para lidar com significado
e buscas rápidas por nome

Busca por Etiqueta (Mnemônica):
É impossível decorar que o CPF de um usuário está no "índice 452"
de um array.
No Hash, você simplesmente pede pela chave "cpf".

Velocidade em Grandes Dados
Para achar um nome em um Array de 1 milhão de itens, você teria
que percorrer item por item (lento).
No Hash, a busca é praticamente instantânea, não importa o tamanho da lista.

Dados Esparsos:
Se você quer guardar apenas a informação dos anos "1900" e "2026",
um array precisaria de 2026 espaços (muitos vazios).
Um Hash guarda apenas as duas chaves necessárias.
=end

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
 
 Método	        Bloco retorna   	     Resultado
 each	        qualquer coisa	          ignora
 select	     true / false	       filtrado só true e faz um novo array
 map	         qualquer valor	         transforma em array
 
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

# JSON (JavaScript Object Notation (Notação de Objetos JavaScript)

=begin
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
  que o bloco trouxa a ele, porém somente os de chave :active == true
  Retorno active_users = u-> [{ id: 1, name: 'William', active: true },
             { id: 3, name: 'Alice', active: true }]
=end

# Preparar resposta para API (array de nomes, pronto para JSON):

response = active_users.map { |u| { name: u[:name] } }
=begin
 Nesta a variável response(resposta) vai receber o array pronto para JSON
 
 a variável active_users contém um array, com hashs, somente com com
 haves :active == true que foram filtradas acima
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
 Verbo: Get
 Recurso: coleção(Tabela users, sem ID)
 Action(ação) Rest padrão: index

 A pergunta para: Por que GET pode ser index OU show?
 é essa acima
 GET + coleção(Tabela users, sem ID) → index ➡ lista todos os usuários
 
 GET + ID → show ➡ mostra um usuário específico


                        Construção de endpoints reais

 Serão construindo 3 endpoints aqui
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

#                         1º endpoint show
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
 método show di-acordo com padrão REST
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
  O método show é um endpoit REST que responde a uma requisição GET
  feita por outro sistema, retornando um recurso especifico.
  saiu do meu sistema, vai para outro em formato JSON
=end

#                           2º endpoint post
# Sistema de fora enviando dados para se criar recurso para meu
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

#                            ENDPOINT POST

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

 user é a variável que está recebendo os o User.New, ou seja,
 novo objeto usuário
 chave name: recebendo o nome deste novo usuário pelo
 params através de sua chave :name
 o mesmo acontece com active

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

#                      Proximo endpoint é o PUT

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

