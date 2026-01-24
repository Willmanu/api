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
