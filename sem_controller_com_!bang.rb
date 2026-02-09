#                            create ou create!
# create sem o !bang
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
# com o !bang
def create
  user = User.create!(user_params)# aqui tem o strong
  render json: user, status: :created
end

# Código interno no model
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def handle_invalid_record(error)
    render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
  end
end


#                               destroy ou destroy!
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