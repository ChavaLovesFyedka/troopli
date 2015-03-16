class CalendarsController < ApplicationController
  def show 
    @troop = Troop.includes(:events).find(params[:troop_id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_by_date = @troop.events.order(:start_at)
  end
end
