class ClothsController < ApplicationController
  before_action :authenticate_user!, except: [ :show, :index ]

  def index
    @cloths = Cloth.all
  end

  def show
    @cloth = Cloth.find(params[:id])
  end

  def new
    @cloth = Cloth.new
  end

  def create
    @cloth = current_user.cloth.new(cloth_params)
    @cloth.season_ids = params[:cloth][:season_ids] if params[:cloth][:season_ids].present? # :season_idsのデータが渡ってきたら@clothとseasonを関連付ける
    @cloth.category_ids = params[:cloth][:category_ids] if params[:cloth][:category_ids].present? # :category_idsのデータが渡ってきたら@clothとcategoryを関連付ける

    respond_to do |format| # 異なるリクエストに対応するための記述
      if @cloth.save
        format.html { redirect_to cloth_url(@cloth), notice: "登録に成功しました" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cloth = current_user.cloth.find(params[:id])
  end

  def update
    @cloth = Cloth.find(params[:id])

    respond_to do |format|
      if @cloth.update(cloth_params)
        format.html { redirect_to cloth_url(@cloth), notice: "更新に成功しました" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cloth = Cloth.find(params[:id])
    @cloth.destroy!
    redirect_to cloths_path, success: t("defaults.flash_message.deleted", item: Cloth.model_name.human), status: :see_other
  end

  private

  def cloth_params
    params.require(:cloth).permit(:category_ids, :image_file, :image_file_cache, :brand, :body, :purchase_date, :price, season_ids: []) # モデル名_ids: []複数のidを配列で受け取る
  end
end
