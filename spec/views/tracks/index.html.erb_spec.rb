require 'rails_helper'

RSpec.describe 'tracks/index', type: :view do
  let(:conference) { create(:conference) }
  before(:each) do
    assign(:tracks, [
             Track.create!(
               name: 2,
               conference_id: conference.id
             ),
             Track.create!(
               name: 2,
               conference_id: conference.id
             )
           ])
  end

  it 'renders a list of tracks' do
    render
    assert_select 'tr>td', text: 'C', count: 2
  end
end
