class ClothsController < ApplicationController
  before_action :set_cloth, only: [ :show, :update, :destroy ]
  before_action :authenticate_user!, except: [ :show, :index ]

  def index
    @cloths = Cloth.all
  end

  def show
  end

  def new
    @cloth = Cloth.new
  end

  def create
    @cloth = current_user.cloth.new(cloth_params)
    @cloth.season_ids = params[:cloth][:season_ids] if params[:cloth][:season_ids].present? 

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
    respond_to do |format|
      if @cloth.update(cloth_params)
        format.html { redirect_to cloth_url(@cloth), notice: "更新に成功しました" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cloth.destroy!
    redirect_to cloths_path, success: t("defaults.flash_message.deleted", item: Cloth.model_name.human), status: :see_other
  end

  private

  def set_cloth
    @cloth = Cloth.find(params[:id])
  end

  def cloth_params
    category_ids = []
    category_ids << params[:parent_id] if params[:parent_id].present?
    category_ids << params[:child_id] if params[:child_id].present?

    params.require(:cloth).permit(:image_file, :image_file_cache, :brand, :body, :purchase_date, :price, { season_ids: [] },).merge(category_ids: category_ids) # モデル名_ids: []複数のidを配列で受け取る
  end
end
