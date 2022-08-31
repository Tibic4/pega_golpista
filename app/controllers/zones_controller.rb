class ZonesController < ApplicationController
  def index
    @zones = Zone.where.not(latitude: nil, longitude: nil) # returns zones with coordinates
    # Mark a zone DDD in google maps
    @markers = @zones.map do |zone|
      {
        lat: zone.latitude,
        lng: zone.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { zone: }),
        # image_url: helpers.asset_url('https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m2.png')
      }
    end
  end
end
