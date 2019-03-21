json.array!(@available_hours) do |hour|   
  json.start hour.from   
  json.end hour.to   
  json.url available_hour_url(available_hour, format: :html) 
end