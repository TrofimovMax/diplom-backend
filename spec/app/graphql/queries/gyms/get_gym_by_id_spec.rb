# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  let!(:gym1) do
    Gym.create(id: 1, title: 'Йога', address: 'Петровская 51 корп 1', capacity: 25, owner_id: nil)
  end

  let!(:gym2) do
    Gym.create(id: 2, title: 'Бодибилдинг', address: 'Петровская 51 корп 2', capacity: 20, owner_id: nil)
  end

  let!(:gym3) do
    Gym.create(id: 3, title: 'Фитнес', address: 'Петровская 51 корп 3', capacity: 15, owner_id: nil)
  end

  describe 'getGymById' do
    it 'returns gym by id' do
      query = <<~GRAPHQL
        query get{
          getGymById (id: 1){
              id
              title
              address
              capacity
              ownerId
            }
          }
      GRAPHQL

      post '/graphql', params: { query: query }
      response_body = JSON.parse(response.body)
      gym_id = response_body['data']['getGymById']

      expected_gyms =
        {
          'id' => gym1.id.to_s,
          'title' => gym1.title,
          'address' => gym1.address,
          'capacity' => gym1.capacity,
          'ownerId' => nil
        }

      expect(gym_id).to contain_exactly(*expected_gyms)
    end
    it 'returns gym by id' do
      query = <<~GRAPHQL
        query get{
          getGymById (id: 100){
              id
              title
              address
              capacity
              ownerId
            }
          }
      GRAPHQL

      post '/graphql', params: { query: query }
      response_body = JSON.parse(response.body)
      gym_id = response_body['data']['getGymById']

      expect(gym_id).to eq(nil)
    end
  end
end
