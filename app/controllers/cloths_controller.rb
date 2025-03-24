class ClothsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cloth, only: %i[ show update destroy ]
  after_action :check_season, only: %i[ create ]

  def index
    @q = current_user.cloths.ransack(params[:q])
    @cloths = @q.result(distinct: true).page(params[:page]) #検索結果に重複を許さない
  end

  def show
  end

  def new
    @cloth = current_user.cloths.new
  end

  def create
    @cloth = current_user.cloths.new(cloth_params)

    respond_to do |format| # 異なるリクエストに対応するための記述
      if @cloth.save
        format.html { redirect_to cloth_url(@cloth), notice: I18n.t("defaults.flash_message.created", item: Cloth.model_name.human) }
      else
        flash.now[:danger] = I18n.t("defaults.flash_message.not_created", item: Cloth.model_name.human)
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cloth = current_user.cloths.find(params[:id])
  end

  def update
    respond_to do |format|
      if @cloth.update(cloth_params)
        format.html { redirect_to cloth_url(@cloth), notice: I18n.t("defaults.flash_message.updated", item: Cloth.model_name.human) }
      else
        flash.now[:danger] = I18n.t("defaults.flash_message.not_updated", item: Cloth.model_name.human)
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cloth.destroy!
    redirect_to cloths_path, notice: I18n.t("defaults.flash_message.deleted", item: Cloth.model_name.human), status: :see_other
  end

  private

  def check_season
    @cloth.season_ids = params[:cloth][:season_ids] if params[:cloth][:season_ids].present?
  end

  def set_cloth
    @cloth = current_user.cloths.find(params[:id])
  end

  def cloth_params
    category_ids = []
    category_ids << params[:parent_id] if params[:parent_id].present?
    category_ids << params[:child_id] if params[:child_id].present?

    params.require(:cloth).permit(:image_file, :image_file_cache, :brand, :body, :purchase_date, :price, { season_ids: [] },).merge(category_ids: category_ids) # モデル名_ids: []複数のidを配列で受け取る
  end
end
