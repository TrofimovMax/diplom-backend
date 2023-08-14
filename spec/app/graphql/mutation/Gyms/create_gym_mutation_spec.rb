# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Gyms
    RSpec.describe Mutations::CreateGymMutation, type: :request do
      let(:gym) do
        Gym.create(id: 1, title: 'AlexFitness', address: 'Rostov on Don, Krasnoarmeyskaya 80', capacity: 10, owner_id: nil)
      end

      describe '.resolve' do
        it 'creates a gym' do
          :gym

          expect do
            post '/graphql', params: { query: query }
          end.to change { Gym.count }.by(1)
        end

        it 'returns a gym' do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body)
          data = json['data']['createGymMutation']['gym']

          expect(data).to include(
                            'id' => be_present,
                            'title' => 'AlexFitness',
                            'address' => "Rostov on Don, Krasnoarmeyskaya 80",
                            'capacity' => 10
                          )
        end

      end

      def query
        <<~GQL
          mutation create {
              createGymMutation(input: {
                attributes: {
                  title: "AlexFitness"
                	address: "Rostov on Don, Krasnoarmeyskaya 80"
                  capacity: 10
                }
              }){
              gym {
                id
                title
                address
                capacity
              }
            }
          }
        GQL
      end
    end
  end
end


