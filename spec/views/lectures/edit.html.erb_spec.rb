require 'rails_helper'

RSpec.describe "lectures/edit", type: :view do
  let(:conference) {create(:conference)}
  let(:track) {create(:track, conference_id: conference.id)}
  before(:each) do
    @lecture = assign(:lecture, Lecture.create!(
      title: "MyString",
      duration: 1,
      lecturer: "MyString",
      start_at: "09:00".to_time,
      track_id: track.id
    ))
  end

  it "renders the edit lecture form" do
    render

    assert_select "form[action=?][method=?]", lecture_path(@lecture), "post" do

      assert_select "input[name=?]", "lecture[title]"

      assert_select "input[name=?]", "lecture[duration]"

      assert_select "input[name=?]", "lecture[lecturer]"
    end
  end
end
