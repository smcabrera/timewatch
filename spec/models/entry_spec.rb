require 'rails_helper'

describe Entry do

  before do
    #todo: Get rid of this. It's just confusing because you keep changing it later on and it's hard to remember what it's initial values are in the describe blocks
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

    it 'formats "three o five in the afternoon with five seconds as "15:05:15"' do
      @entry.start  = Time.new(1988, 1, 13, 15, 05, 05, 0)
      expect(@entry.start_time_formatted).to eq("15:05:05")
    end
  end

  describe '#stop_time_formatted' do
    it 'returns the start time formatted like this: "10:30:15"' do
      expect(@entry.start_time_formatted).to eq("10:30:15")
    end

    it 'formats "three o five in the afternoon with five seconds" as "15:05:15"' do
      @entry.stop  = Time.new(1988, 1, 13, 15, 05, 05, 0)
      expect(@entry.stop_time_formatted).to eq("15:05:05")
    end

    it 'formats the stop time for a running entry (which has no stop time yet) as "--"' do
      @entry.stop  = nil
      expect(@entry.stop_time_formatted).to eq("--")
    end
  end


  # I also need to create a duration and format it
  describe '#duration' do
    it 'returns the number of seconds between start and stop times' do
      #seconds = (4 * 60 + 40) * 60 # 4 hours and 40 minutes in seconds
      seconds = 16800
      expect(@entry.duration).to eq(Duration.new(seconds))
    end

    it 'returns duration from start time to current time when stop time is blank' do
      start = Time.new(1988, 1, 13, 10, 30, 0, 0 )
      stop = nil
      entry = Entry.new(:start => start, :stop => stop)
      expect(entry.duration).to eq(Duration.new(Time.now - start))
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
