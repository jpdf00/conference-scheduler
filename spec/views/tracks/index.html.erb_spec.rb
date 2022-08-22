require 'rails_helper'

RSpec.describe "tracks/index", type: :view do
  before(:each) do
    assign(:tracks, [
      Track.create!(
        name: 2,
        references: ""
      ),
      Track.create!(
        name: 2,
        references: ""
      )
    ])
  end

  it "renders a list of tracks" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
