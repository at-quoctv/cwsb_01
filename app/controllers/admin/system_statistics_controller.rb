class Admin::SystemStatisticsController < Admin::BaseController

  def index

    @space_count_of_venue = Venue.count_spaces
     @space_count_of_venue_chart = count_values @space_count_of_venue
      
    @booking_count_of_space = Space.count_bookings
    @booking_count_of_space_chart = count_values @booking_count_of_space
  
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  def count_values object
    object.collect{|t| {"#{t.name}": t.quantities}}.reduce Hash.new, :merge  
  end
end
