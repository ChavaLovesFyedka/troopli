class MembersController < ApplicationController
  before_filter :authenticate_admin!

  def send_leader_invitation
    @emails = params[:emails].split(",")

    @emails.each do |email|
      Invitation.leader_invitation(email).deliver
    end

    flash[:notice] = "Sent #{"invitation".pluralize(@emails.count)} to #{@emails.to_sentence}."
    redirect_to admin_panel_path   
  end

  def approve
    update_leadership(params[:id], 'leader')
    Invitation.leader_invitation(Member.find(params[:id]).email).deliver
  end

  def reject
    update_leadership(params[:id], 'member')
  end

  def destroy
    member = Member.find(params[:id])
    member_email = member.email
    member.destroy

    flash[:notice] = "#{member_email} has been removed from the system."
    redirect_to admin_panel_path
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
