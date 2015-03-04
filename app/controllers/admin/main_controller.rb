class Admin::MainController < ApplicationController
  before_filter :authenticate_admin!
  
  def panel
    @requests = Member.with_request
  end
end
