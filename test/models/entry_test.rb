require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_calculate_duration_1
    test "Calculates duration rounded to the nearest second" do
      entry = Entry.new(:start => Time.now, :stop => (Time.now + 1))
        assert entry.calculate_duration == 1.0
    end
  end

  def test_format_time
    test "Formats a time as a string in hh:mm:ss format" do
      t = Time.new(2014, 12, 25, 22, 30, 15)
      x = Entry.new
      result_string = "22:30:15"
        assert_equal x.time_formatted(t), result_string
    end
  end

  def test_format_date
    test "Extracts date from time and formats as day mmm dd, yyyy" do
      d = Time.new(2014, 12, 25, 22, 30, 15)
      result_string = "Thu Dec 25, 2014"
      assert_equal x.format_date(d), result_string
    end
  end

  def test_to_time
    test "Converts a string of the form 'hh:mm' to a Time object" do
      time_string = "10:30"
      assert_equal to_time(time_string), Time.new(Time.now.year, Time.now.month, Time.now.day, 10, 30)
    end
  end

  def convert_seconds_to_time_duration_1
    test "Converts a duration in number of seconds to the form 'hh:mm'" do
      time1 = Time.new(2015, 1, 27, 10, 30)
      time2 = Time.new(2015, 1, 27, 10, 31, 5)
      Entry.new(:duration => time2 - time1)
      time_string = "0:01:05"
      assert_equal duration_format(time2 - time1), time_string
    end
  end

  def convert_seconds_to_time_duration_2
    test "Converts a duration in number of seconds to the form 'hh:mm'" do
      time1 = Time.new(2015, 1, 27, 10, 30)
      time2 = Time.new(2015, 1, 27, 11, 36, 5)
      Entry.new(:duration => time2 - time1)
      time_string = "01:06:05"
      assert_equal duration_format(time2 - time1), time_string
    end
  end

end
