class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end

  def admin
    current_user_role = current_user.role
    if current_user_role == "admin"
      render json: {
        status: :ok,
      }
    else
      render json: {
        status: :unauthorized,
      }
    end
  end
end
#serializeable_hash[:data][:attributes], status: :ok