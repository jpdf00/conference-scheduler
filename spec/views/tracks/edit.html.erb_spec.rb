require 'rails_helper'

RSpec.describe 'tracks/edit', type: :view do
  let(:conference) { create(:conference) }
  before(:each) do
    @track = assign(:track, Track.create!(
                              name: 1,
                              conference_id: conference.id
                            ))
  end

  it 'renders the edit track form' do
    render

    assert_select 'form[action=?][method=?]', track_path(@track), 'post' do
      assert_select 'input[name=?]', 'track[name]'
    end
  end
end
