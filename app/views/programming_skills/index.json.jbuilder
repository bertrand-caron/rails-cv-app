json.array!(@programming_skills) do |programming_skill|
  json.extract! programming_skill, :id, :title, :skill_type, :description, :details, :hyperlink, :rank, :ranking
  json.url programming_skill_url(programming_skill, format: :json)
end
