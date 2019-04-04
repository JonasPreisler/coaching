module BookingsHelper

  def times_in_seconds_since_midnight_for_select
    (36000..72000).select { |n| Time.at(n).utc.strftime("%H:%M") if n % 300 == 0 }
  end
end
