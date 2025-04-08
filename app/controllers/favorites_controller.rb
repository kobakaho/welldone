class FavoritesController < ApplicationController
  def create
    cloth = current_user.cloths.find(params[:cloth_id])
    current_user.favorite(cloth)
    redirect_to cloth_path(cloth), notice: "成功"
  end

  def destroy
    cloth = current_user.favorites.find(params[:id]).cloth
    current_user.unfavorite(cloth)
    redirect_to cloth_path, notice: "消した！"
  end
end
