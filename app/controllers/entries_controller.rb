class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.all
  end

  def show
  end

  def start
    @entry = Entry.new
  end

  def new
    @entry = Entry.new
  end

  def create_running
    running_entry_params = entry_params
    running_entry_params["start"] = Time.now
    @entry = Entry.all.build(running_entry_params)

    if @entry.save
      redirect_to entries_path
    else
      flash[:error] = "There was a problem creating the entry. Please try again."
      render start_entry_path
    end
  end

  def create
    @entry = Entry.all.build(entry_params)
    if @entry.save
      redirect_to entries_path
    else
      flash[:error] = "There was a problem creating the entry. Please try again."
      render :index
    end
  end

  def edit
  end

  def update
    @entry.update_attributes(entry_params)

    if @entry.save
      redirect_to entries_path
    else
      flash[:error] = "There was a problem updating the entry. Please try again."
      render :edit
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def entry_params
    params.require(:entry).permit(:start, :stop, :notes)
  end
end





