class Entry < ActiveRecord::Base
  after_initialize :init

  def init
    if self.stop
      self.duration = self.stop - self.start
    else
      self.duration = 0
    end
  end

  def calculate_duration
    self.start - self.stop
  end

  def time
    Time.now
  end

  def to_time(time_string)
    if time_string.class == "Time"
      return time_string
    elsif time_string.class == "String"
      hour = time_string[0..1].sub(":", "")
      minute = time_string[3..4]
      day, month, year = Time.now.day, Time.now.month, Time.now.year
      return Time.new(year, month, day, hour, minute)
    end
  end

  def tomorrow(time)
    time + 24 * 60 * 60
  end

  def date_today
    day = Time.now.day
    year = Time.now.year
    month = Time.now.year
    {:day => day, :year => year, :month => month}
  end

  def second_now
    Time.now.sec
  end

  def start_time_formatted
    format_time(self.start)
  end

  def stop_time_formatted
    format_time(self.stop)
  end

  def date_formatted
    format_date(self.start)
  end

  def convert_seconds_to_time_duration(seconds)
    minutes = seconds.to_i / 60
    hours = minutes / 60
    minutes = minutes % 60
    seconds = (seconds % 60).to_i
    { :seconds => seconds, :minutes => minutes, :hours => hours }
  end

  def format_duration
    duration = self.convert_seconds_to_time_duration(self.duration)
    duration.keys.each do |unit|
      if duration[unit].to_s.length == 1
        duration[unit] = "0#{duration[unit].to_s}"
      else
        duration[unit] = duration[unit].to_s
      end
    end
    "#{duration[:hours]}:#{duration[:minutes]}:#{duration[:seconds]}"
  end

  def format_date(time)
    month_dict = {1 => "Jan", 2 => "Feb", 3 => "Mar", 4 => "Apr", 5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Aug", 9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec"}
    day_dict = { 1 => "Mon", 2 =>"Tue", 3 =>"Wed", 4 =>"Thu", 5 =>"Fri", 6 =>"Sat", 7 => "Sun"}
    day_of_week = day_dict[time.wday]
    year = time.year
    month = month_dict[time.month]
    day = time.day
    "#{day_of_week} #{month} #{day}, #{year}"
  end

#"Fri Jan 09, 2015"

  def format_time(time)
    hour = time.hour
    minute = time.min
    second = time.sec
    "#{hour}:#{minute}:#{second}"
  end

end

