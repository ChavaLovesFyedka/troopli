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
    if params[:commit] == 'Search via Age and Category'
      @ideas = Idea.order(:name)
      if params[:age_level].present?
        if !params[:age_level].include?('All')
          params[:age_level] = params[:age_level].push('All')
          @ideas = @ideas.where("age_level in (?)", params[:age_level])
        else
          @ideas = @ideas.all
        end
      end
      if params[:category].present?
        @ideas = @ideas.where("category in (?)", params[:category])
      end
    elsif params[:commit] == 'Search using Badge'
      badge = Badge.order(:name).where("lower(name) = lower(?)", params[:badge]).first
      @ideas = badge.ideas rescue []
    else
      @ideas = []
    end
  end
end
