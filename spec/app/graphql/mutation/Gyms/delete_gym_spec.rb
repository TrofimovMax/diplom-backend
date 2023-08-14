# frozen_string_literal: true
require 'rails_helper'

module Mutations
  module Gyms
    RSpec.describe Mutations::DeleteGym, type: :request do
      let!(:gym) do
        Gym.create(id: 1, title: 'AlexFitness', address: 'Rostov on Don, Krasnoarmeyskaya 80', capacity: 10, owner_id: nil)
      end

      describe 'resolve' do
        it 'removes a gym' do
          :gym

          expect do
            post '/graphql', params: { query: query(id: gym.id) }
          end.to change { Gym.count }.by(-1)
        end

        it 'returns a gym id' do
          :gym

          post '/graphql', params: { query: query(id: gym.id) }
          puts "Response body: #{response.body}"
          json = JSON.parse(response.body)
          data = json['data']['deleteGym']
          expect(data).to include(
                            'id' => gym.id.to_s,
                          )
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            deleteGym(input: {
              id: #{id}
            }){
              id
            }
          }
        GQL
      end
    end
  end
end
