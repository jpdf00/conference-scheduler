require 'rails_helper'

RSpec.describe "lectures/index", type: :view do
  before(:each) do
    assign(:lectures, [
      Lecture.create!(
        title: "Title",
        duration: 2,
        lecturer: "Lecturer"
      ),
      Lecture.create!(
        title: "Title",
        duration: 2,
        lecturer: "Lecturer"
      )
    ])
  end

  it "renders a list of lectures" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Lecturer".to_s, count: 2
  end
end
