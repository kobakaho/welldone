class StaticPagesController < ApplicationController
  def top
    @user = current_user
  end

  def terms; end
  
  def policy; end
end
