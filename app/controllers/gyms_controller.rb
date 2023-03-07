class GymsController < ApplicationController
  def index
    gyms = Gym.all

    render json: gyms
  end

  def show
    id = params[:id]
    gym = Gym.find(id)
    render json: gym
  end

  def create
    gym = Gym.create({
                 title: params[:title],
                 address: params[:address]
               })

    render json: gym
  end

  def update
    id = params[:id]
    gym = Gym.find(id)
    gym.update({
      title: params[:title],
      address: params[:address]
    })

    render json: gym
  end

  def destroy
    id = params[:id]
    gym = Gym.find(id)
    gym.destroy
    render json: gym
  end

end
