class MembersController < ApplicationController
  before_filter :authenticate_admin!

  def approve
    update_leadership(params[:id], 'leader')
  end

  def reject
    update_leadership(params[:id], 'member')
  end

  private

  def update_leadership(id, role)
    member = Member.find(id)
    member.role = role

    if member.save
      flash[:notice] = notice(role, member)
      redirect_to admin_panel_path
    end
  end

  def notice(role, member)
    if role == 'leader'
      "#{member.email} is now a leader."
    else
      "#{member.email}'s request to be a leader has been rejected."
    end  
  end
end
