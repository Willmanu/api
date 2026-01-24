# A proposta aqui é estudar lógica ruby para API

=begin
Mas antes definir as estruturas de código
Estruturas de dados usa → [] e {}
[] para array
{} para hash
Blocos de código → {} ou do...end

=end
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
=end

#selecionando um item do hash com uma varial seguindo uma condição

users.select { |u| u[:active] == true}

=begin
no caso acima temos o método select. 
o bloco começa a partir da chaves {} porque vai executar um bloco de código
dentro do bloco de código temos uma variável |u|
  |u|-> isso se chama block parameter, parâmetro do bloco
 o bloco pega percorre o array mostrando ao select todos os hash
 o select vendo que o :active é igual a true ele entra em |u|

o que ele retorna é o hash {id: 1, name: 'William', active: true}
=end

#loop .each do || end

users.each do |u|
  puts u[:name]
end
=begin
  Este loop como se fosse um for em outras linguagens
  each é o método e-> do |u|....end é o bloco

  o |u| parâmetro recebe em si os hash

  each do significa: para cada item do parãmetro |u| faça
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

#usando o metodo .map

names = users.map do |u| u[:name] end

=begin
  Aqui o método map(mapeamento) transforma em array
  o bloco traz o valor da chave :name
  e o map transforma em array

  quando peço o resultado da variável o retorno é
  ["William "Ana"]
  isso significa que o map transformou os dados do hash
    que a ação do bloco fez, em um novo array
    hash é entre {} e array é entre [], o resultado foi entre []
    O map cria um novo array com o que você manda ele retornar
=end

users.map do |u|
  {
    id: u[:id],
    name: u[:name]
  }
end

=begin
.map é o método, transforma em array
Do ->do até o -> end é um bloco de código
dentro do bloco temos um hash
  neste hash temos as chaves id: e name:

  esta chaves vão receber as mesma chaves do hash |u|

 O resultado é:
[{:id=>1, :name=>"William"}, {:id=>2, :name=>"Ana"}]

este novo hash recebendo os valores :id e :name do hash |u|

  Comparação direta (lado a lado)
# EACH → ação
users.each { |u| puts u[:name] }

# SELECT → filtro
users.select { |u| u[:active] }

# MAP → transformação
users.map { |u| u[:name] }

Método	        Bloco retorna   	            Resultado
each	        qualquer coisa	                 ignora
select	     true / false	                   array filtrado
map	         qualquer valor	                 array transformado


Regra de ouro (guarde isso)

O método manda.
O bloco obedece.

O bloco não decide o formato do retorno, quem decide é o método.
=end

#método start_with
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
Neste caso o que retorna é 
[{:id=>1, :name=>"William", :active=>true}]
 
Isso já é uma condição, porque:
true → Ruby entende como verdadeiro
false → Ruby entende como falso
E o select funciona assim:
“Se o bloco retornar algo truthy(verdadeiro), eu seleciono”

Regra de ouro do Ruby (ESSENCIAL)
Em Ruby:
false e nil → falsy
todo o resto → truthy -> verdade
=end

#Encadeamento
# select e map juntos
users.select { |u| u[:active]}.map { |u| u[:name]}

=begin
Olha que interessante um select e map junto

Isso -> users.select { |u| u[:active]}.map { |u| u[:name]}
se chama encadeamento -> cada método recebe o retorno do anterior
1º o select vai receber do bloco de código baseado na chave :active
o hash de condição true
depois este retorno hash, entra no bloco do map, e o map transforma o valor
da chave :name, com condição true em um array

no caso o que é transformado é ["William"], porque Ana a condição é false.
=end

#map e depois select
users.map { |u| u[:name]}.select { |name| name.start_with?("A") }

=begin
Nesta caso o map vai transformar o :name William e Ane do hash em array
Depois este array com os 2 nomes, entra no bloco de código do select
O select não vê mais hash e sim array, por isso |name| não é chave :name
select filtra somente Ana por conta da condição: Que inicia com 'A'
|name| agora é cada string do array
"William".start_with?("A") → false
"Ana".start_with?("A") → true

com isso é apresentado ['Ana']

No anterior o map recebe hash do select
Neste caso o select recebe array do map

forma menos elegante de escrever a mesma coisa é
  names = users.map { |u| u[:name] }
  filtered = names.select { |name| name.start_with?("A") }
  preferível o encadeamento
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
Nesta passo a variável active_users recebe os dados do select
que o bloco trouxa a ele, porém somente os de chave :active == true
Retorno active_users = u-> [{ id: 1, name: 'William', active: true },
             { id: 3, name: 'Alice', active: true }]
=end

# Preparar resposta para API (array de nomes, pronto para JSON):

response = active_users.map { |u| {name: u[:name]}}
=begin
Nesta a variável response vai receber o array pronto para JSON

a variável active_users contém um array, com hashs, somente com com chaves :active == true
que foram filtradas acima
dentro do bloco a chave name: atua como uma variável, porque
vai receber de u, os hashs :name, de active_users. Por isso name:, atua como uma variável
com o mesmo tipo hash
 agora o map varre o |u| que esta com o hash :name e transforma em array
 que por sua vez a variável response recebe

 agora temos dados como array para JSON

 observação: em Rails usamos para filtrar o where(onde)
 e, para transformar em array no lugar do map, usa o pluck(arrancar, extrair)
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