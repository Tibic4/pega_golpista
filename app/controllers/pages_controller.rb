# frozen_string_literal: true

# Pages controller  -  This controller handles the pages of the application
class PagesController < ApplicationController
  def home
    map
    @task = Task.new
    @tasks = Task.all.page(params[:page]).per(10).order("created_at DESC")
  end

  def reporting; end

  def types_of_fraud; end

  def prevention; end

  def about_us; end

  def map
    @zones = Zone.where.not(latitude: nil, longitude: nil) # returns zones with coordinates
    # Mark a zone DDD in google maps
    @markers = @zones.map do |zone|
      {
        lat: zone.latitude,
        lng: zone.longitude,
        ddd: zone.ddd
      }
    end
    # Count total scamers
    @total_scammers = Zone.where.not(count_of_scammers: nil).sum(:count_of_scammers)

    # Count the number of scammers in each ddd
    @countOfScammer = Zone.where.not(count_of_scammers: 0)
    @countOfScammers = @countOfScammer.map do |zone|
      {
        ddd: zone.ddd,
        count_of_scammers: zone.count_of_scammers
      }
    end
  end
end
