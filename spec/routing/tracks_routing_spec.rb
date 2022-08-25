require 'rails_helper'

RSpec.describe TracksController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/tracks/1').to route_to('tracks#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tracks').to route_to('tracks#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/tracks/1').to route_to('tracks#destroy', id: '1')
    end
  end
end
