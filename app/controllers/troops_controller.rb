class TroopsController < ApplicationController
  before_action :set_troop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_leader!, only: [:new]
  before_action :set_leader, only: [:show]

  respond_to :html

  def index
    @troops = Troop.all
    
    respond_with(@troops)
  end

  def show
    respond_with(@troop)
  end

  def new
    unless current_leader.admin_privileges < 50
      redirect_to(:back)
    end
    @troop = Troop.new
    respond_with(@troop)
  end

  def edit
  end

  def create
    @troop = Troop.new(troop_params)
    @troop.save
    respond_with(@troop)
  end

  def update
    @troop.update(troop_params)
    respond_with(@troop)
  end

  def destroy
    @troop.destroy
    respond_with(@troop)
  end

  private
    def set_troop
      @troop = Troop.find(params[:id])
    end

    def troop_params
      params.require(:troop).permit(:name, :description, :picture, :age_level)
    end
end
