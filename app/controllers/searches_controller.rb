class SearchesController < ApplicationController
  def index
    # Result search from Elasticsearch
    @tasks = Task.all.search(params[:query]).records.per(10).page(params[:page]).order("created_at DESC")
    @tasks = Task.all.page(params[:page]).per(10).order("created_at DESC")
    # @scammers = Scammer.all
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
