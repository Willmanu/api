# A proposta aqui é estudar lógica ruby para APIs
# APIs Application Programming Interface ( Interface de Programação de Aplicações)

=begin
Mas antes definir as estruturas de código
Estruturas de dados usa → [] e {}
[] para array
{} para hash
Blocos de código → {} ou do...end

=end
# Entrada de dados para manipulação
users = [
  {id: 1, name: 'William', active: true},
  {id: 2, name: 'Ana', active: false}
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

users.select { |u| u[:active] == true}

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

users.each do |u|
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
=end

# Simulando transformação de dados para resposta JSON

# Passo 1 criando dados

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
Nesta a variável response vai receber o array pronto para JSON

a variável active_users contém um array, com hashs, somente com com chaves :active == true
que foram filtradas acima
dentro do bloco a chave name: atua como uma variável, porque
vai receber uma string de u[:name]
Perceba que name: chave para hash recebe a string da chave :name

 agora o bloco entrega para o map um hash
 o map pega este hash e transforma em um array
 que por sua vez a variável response recebe

 Veja o retorno abaixo, hash dentro de array
 [{:id=>1, :name=>"William"}, {:id=>3, :name=>"Alice"}]

=end

# Performa-se em API
users.select { |u| u[:active]}.map {|u| u[:name]}

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

1 Um endpoint
2 Um formato de resposta (JSON)
3 Um lugar certo (controller)

Mentalidade de API (grave isso)
Uma API REST responde sempre a 3 perguntas:

O que o cliente pediu?
Onde estão os dados? (banco)
Como vou devolver esses dados?

No exemplo feito, mentalmente seria:
“Me dê os usuários ativos, mas só com id e nome”
=end
# Dados (simulando banco)
users = [
  { id: 1, name: "William", active: true },
  { id: 2, name: "Ana", active: false },
  { id: 3, name: "Alice", active: true }
]

# Lógica de negócio (o coração da API)

users_active = users.select { |u| u[:active] } # filtrando
response = users.map do |u|	{ id: u[:id], name: u[:name] } end # transformando

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
 Todos os comando feitos até foram em Ruby puro
 Agora vou comprar com comando para rails
=end

# filtro em ruby
users.select { |u| u[:active] } # acessa o array

# filtro em Rails
User.where(active: true) # acessa o Banco

# map em Ruby
users.map { |u| { id: u[:id], name: u[:name] } }

# map em rails
User.map { |u| { id: u.id, nome: u.name } }

=begin
Comparação clara
Ruby puro	                      Rails / API
Array em memória	           Banco de dados
select	                           where
map	                           select / as_json
puts	                        render json

=end
