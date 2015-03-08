class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def start
    @entry = Entry.new
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update_attributes(entry_params)

    if @entry.save
      redirect_to entries_path
    else
      flash[:error] = "There was a problem updating the entry. Please try again."
      render :edit
    end
  end

  def create_running
    running_entry_params = entry_params
    running_entry_params["start"] = Time.now
    running_entry_params["running"] = true
    @entry = Entry.all.build(running_entry_params)

    if @entry.save
      redirect_to entries_path
    else
      flash[:error] = "There was a problem creating the entry. Please try again."
      render start_entry_path
    end
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.all.build(entry_params)

    if @entry.save
      redirect_to entries_path
    else
      flash[:error] = "There was a problem creating the entry. Please try again."
      render :new
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def entry_params
    params.require(:entry).permit(:start, :stop, :notes)
  end
end





