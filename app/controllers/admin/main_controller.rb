class Admin::MainController < ApplicationController
  def panel
    @requests = Member.with_request
  end
end
