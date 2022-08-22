require 'rails_helper'

RSpec.describe "lectures/edit", type: :view do
  before(:each) do
    @lecture = assign(:lecture, Lecture.create!(
      title: "MyString",
      duration: 1,
      lecturer: "MyString"
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
