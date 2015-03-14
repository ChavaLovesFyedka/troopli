class CalendarsController < ApplicationController
  def show 
    @troop = Troop.find(params[:troop_id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_by_date = Event.order(:start_at)
  end
end
