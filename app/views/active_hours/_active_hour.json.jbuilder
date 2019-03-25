date_format = active_hour.all_day_active_hour? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id active_hour.id
json.title active_hour.title
json.start active_hour.start.strftime(date_format)
json.end active_hour.end.strftime(date_format)

json.color active_hour.color unless active_hour.color.blank?
json.allDay active_hour.all_day_active_hour? ? true : false

json.update_url active_hour_path(active_hour, method: :patch)
json.edit_url edit_active_hour_path(active_hour)