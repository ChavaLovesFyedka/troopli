class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def show
    # @idea = Idea.find(params[:id])
    #@badges = Badge.all
  end

  def new
    # if current_user.admin_privileges < 50
    #   @idea = Idea.new
    #   @idea_badge = IdeaBadge.new
    #   @troop_idea = TroopIdea.new
    #   @badges=Badge.all
    #   @age_levels = AgeLevel.all
    #   @troops = Troop.all
    #   @skills = Skill.order(name: :asc)
    # else
    #   redirect_to ideas_path
    # end
  end

  def create
    # @idea = Idea.create(idea_params)
    # @badges = params[:idea][:badge_id][0].split(",")
    # @badges.each do |b|
    #   @badge = Badge.find_by_name(b)
    #   @idea_badge = IdeaBadge.create({:badge_id => @badge.id, :odea_id => @idea.id}) if @badge
    # end
    # @skills = Skill.order(name: :asc)
    # respond_to do |format|
    #   if @idea.save
    #     format.html { redirect_to ideas_path, notice: 'Idea was successfully created.' }
    #   else
    #     @troop_idea = TroopIdea.new
    #     @badges=Badge.all
    #     @age_levels = AgeLevel.all
    #     @troops = Troop.all
    #     @skills = Skill.order(name: :asc)
    #     @ideas = Idea.all.paginate(page: params[:page], per_page: 10)
    #     format.html { render template: "skills/show", notice: 'Idea was not created' }
    #   end
    # end
  end

  def edit
    # if current_user.admin_privileges < 50
    #   @idea = Idea.find(params[:id])
    #   @badges=Badge.all
    #   @age_levels = AgeLevel.all
    #   @skills = Skill.all
    # else
    #   redirect_to ideas_path
    # end
  end

  def update
  #   @idea = Idea.find(params[:id])
  #   @idea.update_attributes(idea_params)
  #   if @idea.save
  #       redirect_to ideas_path, notice: 'Idea updated.'
  #     else
  #       @badges=Badge.all
  #       @age_levels = AgeLevel.all
  #       @skill = Skill.all
  #       format.html { render action: 'edit' }
  #     end
  end

# private

#   def idea_params
#     params.require(:idea).permit(:name, :category, :description, :badge_id, :skill_id, :age_level_ids => [], :badge_ids => [])
#   end

end
