class Entry < ActiveRecord::Base

  validates :start, presence: true
  validates :notes, presence: true

  def duration
    Duration.new(self.stop - self.start)
  end

  def start_time_formatted
    format_time(self.start)
  end

  def stop_time_formatted
    format_time(self.stop)
  end

    # I don't want to deal with days so I'd rather just handle hours greater than a day with an integer number of hours
    # As a side note, it's pretty cool how he made this formatting work
      # See docs here: http://www.rubydoc.info/github/peleteiro/ruby-duration/master/Duration

  def duration_formatted
    if self.duration.days > 0
      hours = self.duration.total / 60 / 60
      self.duration.format "#{hours}:%M:%S"
    else
      self.duration.format "%H:%M:%S"
    end
  end

  def date_formatted
    format_date(self.start)
  end

  private

  def format_time(time)
    hour = time.hour
    minute = time.min
    second = time.sec
    "#{hour}:#{minute}:#{second}"
  end

  def format_date(time)
    month_dict = { 1 => "Jan", 2 => "Feb", 3 => "Mar", 4 => "Apr", 5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Aug", 9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec" }
    day_dict = { 1 => "Mon", 2 =>"Tue", 3 =>"Wed", 4 =>"Thu", 5 =>"Fri", 6 =>"Sat", 7 => "Sun" }
    day_of_week = day_dict[time.wday]
    year = time.year
    month = month_dict[time.month]
    day = time.day
    "#{day_of_week} #{month} #{day}, #{year}"
  end

  def to_time(time_string)
    if time_string.class == Time
      return time_string
    elsif time_string.class == String
      hour = time_string[0..1].sub(":", "")
      minute = time_string[3..4]
      day, month, year = Time.now.day, Time.now.month, Time.now.year
      return Time.new(year, month, day, hour, minute)
    end
  end

end

