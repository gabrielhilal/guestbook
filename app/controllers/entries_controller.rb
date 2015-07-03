class EntriesController < ApplicationController
  def new
    @entries = Entry.order(created_at: :desc)
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:success] = 'The entry was created succesfully'
      redirect_to root_path
    else
      @entries = Entry.order(created_at: :desc)
      render :new
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    flash[:success] = 'The entry was deleted succesfully'
    redirect_to root_path
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :message)
  end
end
