require 'rails_helper'

describe Entry do

  before do
    start = Time.new(1988, 1, 13, 10, 30, 15, 0)
    stop = Time.new(1988, 1, 13, 15, 10, 15, 0)
    @entry = Entry.new(:start => start, :stop => stop )
  end

  describe '#date_formatted' do
    it 'returns the start time in this format: "Mon Mar 02, 2015"' do
      expected =  "Wed Jan 13, 1988"
      expect(@entry.date_formatted).to eq(expected)
    end
  end

  # I need a start_time_formatted to give me back the start date formatted in the correct way
  describe '#start_time_formatted' do
    it 'returns the start time formatted like this: "10:30:15"' do
      expect(@entry.start_time_formatted).to eq("10:30:15")
    end
  end

  describe '#stop_time_formatted' do
    it 'returns the stop time formatted like this: "15:10:15"' do
      expect(@entry.stop_time_formatted).to eq("15:10:15")
    end
  end

  # I also need to create a duration and format it
  describe '#duration' do
    it "returns the number of seconds between start and stop times" do
      #seconds = (4 * 60 + 40) * 60 # 4 hours and 40 minutes in seconds
      seconds = 16800
      expect(@entry.duration).to eq(Duration.new(seconds))
    end
  end

  describe '#duration_formatted' do
    it 'formats "4 hours, 40 minutes and 0 seconds" as "04:40:00"' do
      expect(@entry.duration_formatted).to eq("04:40:00")
    end

    it 'formats 2 hours, 6 minutes and 30 seconds as "02:06:30"' do
      start = Time.new(1988, 1, 13, 10, 30, 15, 0)
      stop  = Time.new(1988, 1, 13, 12, 36, 45, 0)
      entry = Entry.new(:start => start, :stop => stop )
      expect(entry.duration_formatted).to eq("02:06:30")
    end

    it 'formats 10 hours, 10 minutes and 5 seconds as "10:10:05"' do
      start = Time.new(1988, 1, 13, 10, 30, 15, 0)
      stop  = Time.new(1988, 1, 13, 20, 40, 20, 0)
      entry = Entry.new(:start => start, :stop => stop )
      expect(entry.duration_formatted).to eq("10:10:05")
    end

    it 'formats 103 hours, 10 minutes and 5 seconds as "103:10:05"' do
      start = Time.new(1988, 1, 13, 10, 30, 15, 0)
      stop  = start + Duration.new(
        :hours   => 103,
        :minutes => 10,
        :seconds => 5
      ).total
      entry = Entry.new(:start => start, :stop => stop )
      expect(entry.duration_formatted).to eq("103:10:05")
    end
  end

end
