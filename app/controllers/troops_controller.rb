class TroopsController < ApplicationController
  before_filter :authenticate_leader!, except: [:index, :show]
  before_filter :authenticate_member!, only: [:show]
  before_action :set_troop, only: [:edit, :update, :destroy]

  def index
    @troops = Troop.all
    render 'index', layout: 'front_page'
  end

  def show
    @troop = Troop.includes(:events, :badges).find(params[:id])
    @events = @troop.events.next_3
    @badges = @troop.badges
  end

  def new
    @troop = Troop.new
  end

  def edit
  end

  def create
    @troop = Troop.new(troop_params)

    if @troop.save
      flash[:notice] = "Troop saved."
      redirect_to troop_path(@troop)
    else
      flash[:alert] = "Could not save troop."
      render 'new'
    end
  end

  def update
    if @troop.update_attributes(troop_params)
     flash[:notice] = "Troop saved."
     redirect_to troop_path(@troop)
    else
      flash[:alert] = "Could not save troop."
      render 'edit'
    end 
  end

  def destroy
    @troop.destroy
    redirect_to troops_path
  end

  private

  def set_troop
    @troop = Troop.find(params[:id])
  end

  def troop_params
    params.require(:troop).permit(:name, :description, :picture, :age_level)
  end
end
