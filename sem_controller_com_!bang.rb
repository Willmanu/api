# INDEX
# ROTA = get "/users", to: "users#index"

def index
  users = User.where(active: true)# filtra todos os users active true

  if users.any?# Se houver algum user active true
    render json: users, status: :ok # -> status 200
  else
    render json: [], status: :ok
  end
  # mesmo que não tenha nenhum user active true, o retorno é ok status 200
  # o proposito é devolver uma resposta válida que a busca foi feita com sucesso
end

# usando o !bang, ou seja o model faz todo trabalho
def index
  users = User.active!
  render json: users # não precisa escrever status ok, por padrão o Rails ja faz isso
end
=begin
 Convenção sobre Configuração
 O Rails segue a filosofia de que você só precisa escrever o que for diferente do padrão.
 Se você quer retornar um sucesso, apenas render json: users basta.
 Se você quiser retornar um erro, aí você precisa avisar: status: :unprocessable_entity ou status: :not_found.
=end

# MODEL resposta para o bang com o !bang
class User < ApplicationRecord
  scope :active!, -> {
    users = where(active: true)

    raise ActiveRecord::RecordNotFound if user.empty?

    users
  }
end
=begin
 scope -> significa escopo um atalho para uma consulta que se usa muito.
  Ao invés de ficar escrevendo User.where(active: true) em vários lugares do projeto, defina um escopo e chama apenas User.active.
  A vantagem é a reutilização da leitura.

 Isso dentro do parentese (->) se chama Lambda: ela é um pedaço de código que não tem nome próprio. Só a definimos o que ela faz dentro de chaves{} 
   E quando for preciso ela é apontada para uso, como um simbolo que tem muita informação dentro de si, porém o simbolo ja diz tudo sobre essas informações.

 RESUMINDO: scope + :active + lambda {}
  scope + :active = quando no controller tiver um uma requisição onde precisa saber se tem user ativos use essa -> lambda {}
  Na lambida a informação é: para busca de usuários onde precisam ser ativos,
   if user.empty? -> se a tabela User estiver vazia(empty) de usuários ativos
     levante(raise) essa exceção (RecordNotFound) que eta empacotada em AtiveRecord
=end




# create
# Javascript requisição
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

# ROTA = post "/users", to: "users#create"
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


# com o !bang
def create
  user = User.create!(user_params)
  render json: user, status: :created

 private

  def user_params
    params.require(:user).permit(:name, :active)
  end
end

# Código interno no model
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def handle_invalid_record(error)
    render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
  end
end



# SHOW
# Sistema de fora pedindo dados para minha API
fetch("http://localhost:3000/users/5")
  .then(response => response.json())
  .then(data => { console.log(data.name)})

# ROTA = get "/users/:id", to: "users#show"

def show
  user = User.find_by(id: params[:id])# find_by busca qualquer campo

  if user
    render json: user
  else
    render json: { error: "User not found" }, status: :not_found
  end
end

# SHOW com !BANG
def show
  user = User.find(params[:id])# busca exclusivamente o id
  render json: user
end

# Model do show
class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  private

  def handle_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

end

# PUT/ PATCH
# Requisição feita pelo HTML 
<form action="/user/5" method="post">
 <input type="hidden" name="_method" value="put">

   <input type="text" name="user[name]" value="William">
  <input type="checkbox" name="user[active]" checked>

  <button type="submit">Atualizar</button>
</form>

# ROTA = patch "/users/:id", to: "users#update"
# ROTA = PUT   "/users/:id", to: "users#update"
def update
  user = User.find_by(id: params[:id])

  if user&.update(user_params)
    render json: user
  else
    render json: { error: "Update failed" },
           status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:name, :active)
  end
end

# PUT/ PATCH com !BANG
def update
  user = User.find(params[:id])
  user.update!(user_params)
  render json: user

  private

  def user_params
    params.require(:user).permit(:name, :active)
  end
end

# Validação de PUT/PATCH
class User < ApplicationRecord
  validates :name, presence: true
end

# Model status HTTP 422
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def handle_invalid_record(error)
    render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
  end
end





# destroy ou destroy!

# Exemplo: requisição através do Javascript
fetch("http://localhost:3000/users/5", {
  method: "DELETE"
})
.then(response => {
  if (response.status === 204) {
    console.log("Usuário removido com sucesso")
  }
  })

# Rota = delete "/users/:id" to: users#destroy

# destroy sem o !bang
  def destroy
    user = User.find_by(id: params[:id])
  
    if user
      user&.destroy
      head :no_content
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

# com !bang def destroy
  user = User.find(params[:id])
  user.destroy!
  head :no_content
end

# código interno no model
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render json: { error: "Resource not found" }, status: :not_found
  end
end

# EDIT
# Rota = get "/users/:id/edit", to: "users#edit"

def edit
  user = User.find_by(id: params[:id])

  if user
    render json: user
  else
    render json: {error: "User not found"}, status: :not_found
  end
end

# EDIT não tem o !bang, usa find
def edit
  user = User.find(params[:id])
  render json: user
end

# MODEL para resposta do find em EDIT
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_invalid_record

  private

  def handle_invalid_record(error)
    render json: {error: error.message }, status: :not_found
  end
end

