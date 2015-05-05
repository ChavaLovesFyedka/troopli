class SearchController < ApplicationController

  def autocomplete
    @badges = Badge.order(:name).where("name ILIKE ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html
      format.json { 
        render json: @badges.map(&:name)
      }
    end
  end

  def index 

  end

  def results
    if params[:type] == 'Age Level'
      @ideas = Idea.order(:name).where("age_level ILIKE ?", "%#{params[:term]}%")
    elsif params[:type] == 'Category'
      @ideas = Idea.order(:name).where("category ILIKE ?", "%#{params[:term]}%")
    elsif params[:type] == 'Badge'
      badge = Badge.order(:name).where("name ILIKE ?", "%#{params[:badge]}%").first
      @ideas = badge.ideas
    end
  end
end
