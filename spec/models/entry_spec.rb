require 'rails_helper'

describe Entry do

  # Let's just test these helper functions I need for the view

  # First I'll need to stub out a fixed time that I can use to test everything
  before do
    start = Time.new(1988, 1, 13, 10, 30, 15, 0)
    stop = Time.new(1988, 1, 13, 15, 10, 15, 0)
    @entry = Entry.new(:start => start, :stop => stop )
  end

  # I need a date_formatted method to give me back the date of the start time in the appropriate format
  # entry.date_formatted should be in format

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
    it 'returns the duration formatted like this: "4:40:0"' do
      expect(@entry.duration_formatted).to eq("4:40:0")
    end
  end

end
