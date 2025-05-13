class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def top
    @user = current_user
  end

  def terms; end

  def policy; end
end
