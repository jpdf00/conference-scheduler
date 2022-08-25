require 'rails_helper'

RSpec.describe 'lectures/index', type: :view do
  let(:conference) { create(:conference) }
  let(:track) { create(:track, conference_id: conference.id) }
  before(:each) do
    assign(:lectures, [
             Lecture.create!(
               title: 'Title',
               duration: 60,
               lecturer: 'Lecturer',
               start_at: '09:00'.to_time,
               track_id: track.id
             ),
             Lecture.create!(
               title: 'Title',
               duration: 60,
               lecturer: 'Lecturer',
               start_at: '09:00'.to_time,
               track_id: track.id
             )
           ])
  end

  it 'renders a list of lectures' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 60.to_s, count: 2
    assert_select 'tr>td', text: 'Lecturer'.to_s, count: 2
  end
end
