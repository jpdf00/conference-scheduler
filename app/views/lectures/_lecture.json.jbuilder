json.extract! lecture, :id, :title, :duration, :lecturer, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
