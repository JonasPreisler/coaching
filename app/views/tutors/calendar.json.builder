json.array!(@active_hours) do |hour|   
  json.start hour.from   
  json.end hour.to   
  json.url active_hour_url(active_hour, format: :html) 
end