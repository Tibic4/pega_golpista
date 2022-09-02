# frozen_string_literal: true

# Pages controller  -  This controller handles the pages of the application
class PagesController < ApplicationController
  def home
    @task = Task.new
    @tasks = Task.all.page(params[:page]).per(10).order("created_at DESC")
  end

  def reporting; end

  def types_of_fraud; end

  def prevention; end

  def about_us; end

  def map; end
end
