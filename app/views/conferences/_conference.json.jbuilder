json.extract! conference, :id, :name

json.tracks conference.tracks do |track|
  json.partial! 'tracks/track', track: track

  json.lectures track.lectures do |lecture|
    json.partial! 'lectures/lecture', lecture: lecture
  end
end

json.url conference_url(conference, format: :json)
