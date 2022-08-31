class ZonesController < ApplicationController

  def index
    @zones = Zone.all
  end

  # Mark a zone DDD in google maps


end
