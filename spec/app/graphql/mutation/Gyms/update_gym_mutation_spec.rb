# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Gyms
    RSpec.describe Mutations::UpdateGymMutation, type: :request do
      let!(:gym) do
        Gym.create(id: 1, title: 'AlexFitness', address: 'Rostov on Don, Krasnoarmeyskaya 80', capacity: 10, owner_id: nil)
      end

      describe 'resolve' do
        it 'updates a gym' do
          gym_id   = gym.id
          post '/graphql', params: { query: query(id: gym_id) }

          expect(gym.reload).to have_attributes(
                                   'title'            => 'AlexFitness_plus',
                                   'capacity' => 11,
                                   'address'            => 'Rostov on Don, Krasnoarmeyskaya 80 korp 2',
                                   )
        end

        it 'returns a gym' do
          gym_id   = gym.id

          post '/graphql', params: { query: query(id: gym_id) }

          json = JSON.parse(response.body)
          data = json['data']['updateGymMutation']
          puts data
          expect(data).to include(
                            'gym' => {
                              'id' => be_present,
                              'title' => 'AlexFitness_plus',
                              'capacity' => 11,
                              'address' => 'Rostov on Don, Krasnoarmeyskaya 80 korp 2'
                            }
                          )
        end
      end

      def query(id:)
        <<~GQL
          mutation update {
    updateGymMutation(input: {
      id: #{id}
      attributes:{
        title: "AlexFitness_plus"
        capacity: 11
        address: "Rostov on Don, Krasnoarmeyskaya 80 korp 2"
      }
    }){
    gym {
      id
      capacity
      address
      title
    }
  }
}
        GQL
      end
    end
  end
end
