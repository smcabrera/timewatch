class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def start
    @entry = Entry.create(:start  => Time.now)
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





