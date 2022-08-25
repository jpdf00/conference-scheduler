require 'rails_helper'

RSpec.describe 'tracks/show', type: :view do
  let(:conference) { create(:conference) }
  before(:each) do
    @track = assign(:track, Track.create!(
                              name: 1,
                              conference_id: conference.id
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/B/)
  end
end
