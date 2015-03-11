class CalendarController < ApplicationController
  include CalendarHelper

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_by_date = Event.order(:start_at)
  end
end
