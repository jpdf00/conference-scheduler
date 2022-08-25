require 'rails_helper'

RSpec.describe "lectures/show", type: :view do
  let(:conference) {create(:conference)}
  let(:track) {create(:track, conference_id: conference.id)}
  before(:each) do
    @lecture = assign(:lecture, Lecture.create!(
      title: "Title",
      duration: 60,
      lecturer: "Lecturer",
      start_at: "09:00".to_time,
      track_id: track.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/60/)
    expect(rendered).to match(/Lecturer/)
    expect(rendered).to match(/09:00/)
  end
end
