class CalendarController < ApplicationController
  include CalendarHelper

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
