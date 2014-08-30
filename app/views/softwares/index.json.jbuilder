json.array!(@softwares) do |software|
  json.extract! software, :id, :name, :github_link, :description
  json.url software_url(software, format: :json)
end
