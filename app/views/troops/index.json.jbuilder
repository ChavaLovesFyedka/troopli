json.array!(@troops) do |troop|
  json.extract! troop, :id, :name, :description, :picture, :age_level
  json.url troop_url(troop, format: :json)
end
