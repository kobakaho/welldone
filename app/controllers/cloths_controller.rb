class ClothsController < ApplicationController
  # current_user.id
  # ログインしないとできないアクションの制限
  # before_action :authenticate_user only:edit,update,destroy
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

    respond_to do |format| #異なるリクエストに対応するための記述
      if @cloth.save
        format.html { redirect_to cloth_url(@cloth), notice: "登録に成功しました"}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cloth = current_user.cloths.find(params[:id])
  end

  def update
    @cloth = Cloth.find(params[:id])
    if @cloth.update(cloth_params)
      redirect_to cloth_path(@board), t("defaults.flash_message.updated", item: Cloth.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_updated", item: Cloth.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cloth = Cloth.find(params[:id])
    @cloth.destroy!
    redirect_to cloths_path, success: t('defaults.flash_message.deleted', item: Board.model_name.human), status: :see_other
  end

  private

  def cloth_params
    params.require(:cloth).permit(:brand, :body, :purchase_date, :price)
  end
end
