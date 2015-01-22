class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def start_clock
    @entry = Entry.create(:start  => Time.now)
  end
end





