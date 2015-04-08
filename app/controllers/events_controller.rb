class EventsController < ApplicationController
  before_filter :authenticate_leader!, except: [:show]
  before_filter :authenticate_member!, only: [:show]

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_member.troop.events.build
  end

  def create
    @event = current_member.troop.events.build(event_params)

    if @event.save
      flash[:notice] = "Added event to calendar."
      redirect_to troop_calendar_path(troop_id: current_member.troop.id)
    else
      flash[:alert] = "Could not add event to calendar."
      render 'new'
    end
  end

  def edit
    @event = current_member.troop.events.find(params[:id])
  end

  def update
    @event = current_member.troop.events.find(params[:id])

    if @event.update_attributes(event_params)
      flash[:notice] = "Changed event."
      redirect_to troop_calendar_path(troop_id: current_member.troop.id)
    else
      flash[:alert] = "Could not change event."
      render 'edit'
    end
  end

  def destroy
    @event = current_member.troop.events.find(params[:id])
    @event.destroy
    redirect_to troop_calendar_path(troop_id: current_member.troop.id)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_at, :end_at)
  end
end
