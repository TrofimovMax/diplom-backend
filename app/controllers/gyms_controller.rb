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
    hours = params[:hours].to_unsafe_hash
    schedule = Biz::Schedule.new do |config|
      config.hours = {
        mon: hours[:mon],
        tue: hours[:tue],
        wed: hours[:wed],
        thu: hours[:thu],
        fri: hours[:fri],
        sat: hours[:sat]
      }
    end
    gym.update({
      title: params[:title],
      address: params[:address],
      schedule: schedule
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
