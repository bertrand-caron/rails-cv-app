json.array!(@skills) do |skill|
  json.extract! skill, :id, :title, :skill_type, :description, :details, :hyperlink, :rank, :level
  json.url skill_url(skill, format: :json)
end
