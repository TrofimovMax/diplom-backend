require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  let!(:gym1) do
    Gym.create(id: 1, title: 'Йога', address: 'Петровская 51 корп 1', capacity: 25,owner_id: nil)
  end

  let!(:gym2) do
    Gym.create(id: 2, title: 'Бодибилдинг', address: 'Петровская 51 корп 2', capacity: 20, owner_id: nil)
  end

  describe 'fetchGyms' do
    it 'returns a list of two gyms' do
      query = <<~GRAPHQL
        query {
          fetchGyms (page: 1, limit: 10) {
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
      gyms = response_body['data']['fetchGyms']

      expected_gyms = [
        {
          'id' => gym1.id.to_s,
          'title' => gym1.title,
          'address' => gym1.address,
          'capacity' => gym1.capacity,
          'ownerId' => nil
        },
        {
          'id' => gym2.id.to_s,
          'title' => gym2.title,
          'address' => gym2.address,
          'capacity' => gym2.capacity,
          'ownerId' =>  nil
        }
      ]

      expect(gyms).to contain_exactly(*expected_gyms)
    end
  end
end