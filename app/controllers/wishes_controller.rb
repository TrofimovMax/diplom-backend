class WishesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    current_user_id = current_user.id
    wishes = Wishing.create({
                               gym_id: params[:gym_id],
                               user_id: current_user_id,
                               start_at: params[:start_at],
                               end_at: params[:end_at]
                             })
    render json: wishes
  end
  def index
    wishes = Wishing.where(gym_id: params[:gym_id]).all
    # wishes = Wishing.where(gym_id: params[:gym_id], start_at: params[:start]..params[:end]).all
    render json: wishes
  end

  def current_wishes
    count = Wishing.where(gym_id: params[:gym_id], start_at: params[:start_at]).count
    render json: {
      current_wishes: count,
    }
  end

  def update
    id = params[:id]
    wishes = Wishing.find(id)
    Wishing.update(
      {
        start_at: params[:start_at],
        end_at: params[:end_at]
      }
    )
    render json: wishes
  end
  def destroy
    id = params[:id]
    wishes = Wishing.find(id)
    wishes.destroy
    render json: wishes
  end
end
