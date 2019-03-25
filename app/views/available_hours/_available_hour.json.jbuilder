date_format = available_hour.all_day_available_hour? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id available_hour.id
json.title available_hour.title
json.start available_hour.start.strftime(date_format)
json.end available_hour.end.strftime(date_format)

json.color available_hour.color unless available_hour.color.blank?
json.allDay available_hour.all_day_available_hour? ? true : false

json.update_url available_hour_path(available_hour, method: :patch)
json.edit_url edit_available_hour_path(available_hour)