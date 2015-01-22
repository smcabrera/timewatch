class Entry < ActiveRecord::Base

  def calc_duration(start, stop)
    start - stop
  end

  def time
    Time.now
  end

  def date_from_now(time)
    #"#{t.year}-#{t.month}-#{t.day}"
    "#{t.month}-#{t.day}-#{t.year}"
  end

  def tomorrow(time)
    time + 24 * 60 * 60
  end

  def day_formatted
    self.start.start.to_date
  end

  def start_time_formatted
    time_formatted(self.start)
  end

  def stop_time_formatted
    time_formatted(self.stop)
  end

  def time_formatted(time)
    hour = time.hour
    minute = time.min
    "#{hour}:#{minute}"
  end

end

