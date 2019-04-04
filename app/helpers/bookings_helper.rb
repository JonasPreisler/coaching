module BookingsHelper

  def times_in_seconds_since_midnight_for_select
    (28800..79400).step(300).map { |n| Time.at(n).utc.strftime("%H:%M") }
  end
end
