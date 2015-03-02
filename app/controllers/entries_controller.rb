class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def start_clock
    @entry = Entry.create(:start  => Time.now)
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = params[:id]
    if @entry.save
      redirect_to entries_path
    else
      flash[:error] = "There was a problem creating the entry. Please try again."
    end
  end

end





