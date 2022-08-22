require 'rails_helper'

RSpec.describe "lectures/show", type: :view do
  before(:each) do
    @lecture = assign(:lecture, Lecture.create!(
      title: "Title",
      duration: 2,
      lecturer: "Lecturer"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Lecturer/)
  end
end
