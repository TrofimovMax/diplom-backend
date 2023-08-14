# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Gyms
    RSpec.describe Mutations::CreateGymMutation, type: :request do
      let(:gym) do
        Gym.create(id: 1,
                   title: 'AlexFitness',
                   address: 'Rostov on Don, Krasnoarmeyskaya 80',
                   capacity: 10,
                   owner_id: nil)
      end

      describe '.resolve' do
        it 'creates a gym' do
          gym_title = gym.title
          gym_address = gym.address
          gym_capacity = gym.capacity
          expect do
            post '/graphql', params: { query: query(title: gym_title,
                                                    address: gym_address,
                                                    capacity: gym_capacity) }
          end.to change { Gym.count }.by(1)
        end

        it 'returns a gym' do
          post '/graphql', params: { query: query(title: gym.title,
                                                  address: gym.address,
                                                  capacity: gym.capacity) }
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

      describe "returns an error when required parameters are missing" do
        it 'returns an error when required parameters are missing all parameters' do
          post '/graphql', params: { query: query(title: nil, address: nil) }
          json = JSON.parse(response.body)
          error_message = json['errors'][0]["message"]

          expect(error_message).to eq("Parse error on \"}\" (RCURLY) at [7, 5]")
        end
        it 'returns an error when required parameters are missing title parameter' do
          post '/graphql', params: { query: query(title: nil, address: "Rostov on Don, Krasnoarmeyskaya 80") }
          json = JSON.parse(response.body)
          error_message = json['errors'][0]["message"]

          expect(error_message).to eq("Parse error on \"}\" (RCURLY) at [7, 5]")
        end
        it 'returns an error when required parameters are missing address parameters' do
          post '/graphql', params: { query: query(title: "AlexFitness", address: nil) }
          json = JSON.parse(response.body)
          error_message = json['errors'][0]["message"]

          expect(error_message).to eq("Parse error on \"}\" (RCURLY) at [7, 5]")
        end
      end

      def query(title:, address:, capacity: nil)
        <<~GQL
          mutation {
            createGymMutation(input: {
              attributes: {
                title: "#{title}",
                address: "#{address}",
                capacity: #{capacity}
              }
            }) {
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


