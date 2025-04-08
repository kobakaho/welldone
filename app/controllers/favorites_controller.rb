class FavoritesController < ApplicationController
  def create
    @cloth = current_user.cloths.find(params[:cloth_id])
    current_user.favorite(@cloth)
  end

  def destroy
    @cloth = current_user.favorites.find(params[:id]).cloth
    current_user.unfavorite(@cloth)
  end
end
