json.array!(@referees) do |referee|
  json.extract! referee, :id, :name, :email, :title
  json.url referee_url(referee, format: :json)
end
