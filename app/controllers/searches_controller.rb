class SearchesController < ApplicationController
  def index
    @tasks = Task.all
    @scammers = Scammer.all
  end

  def create
    @message = "Yay! You selected the #{selected_record_model} with id: #{selected_record_id}"
  end

  def autocomplete
    @results = Autocompleter.call(params[:query])
  end

  private

  def selected_record_id
    params[:record_to_assign].split(",").last
  end

  def selected_record_model
    params[:record_to_assign].split(",").first
  end
end
