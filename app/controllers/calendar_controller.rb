class CalendarController < ApplicationController
  def index
    @uploads = Upload.all
    @start_time = Time.zone.now.midnight - 1.day
    @end_time = @start_time + 3.days
    load_events
  end
  
  def day
    @start_time = Time.zone.parse(params[:id].gsub('-', '/'))
    @end_time = @start_time + 1.day
    load_events
    render :partial => 'day', :object => @days[0]
  end
  
  private
  
  def load_events
    @days = Event.by_days(@start_time, @end_time)
  end
end
