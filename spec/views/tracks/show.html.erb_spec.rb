require 'rails_helper'

RSpec.describe "tracks/show", type: :view do
  before(:each) do
    @track = assign(:track, Track.create!(
      name: 2,
      references: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
