json.array!(@awards) do |award|
  json.extract! award, :id, :title, :location, :description, :time
  json.url award_url(award, format: :json)
end
