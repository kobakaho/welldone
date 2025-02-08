class ClothsController < ApplicationController
  #before_action :authenticate_user!, only: [:edit, :update, :destroy]
  #create,show,index,newは未ログインでもおけ
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
    #if user_signed_in? #未ログインでも作成可能
    @cloth = current_user.cloth.new(cloth_params)
    #else #ログイン前の場合、clothのデータを保持する
    #  session[:cloth_data] = cloth_params
    #end

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
    params.require(:cloth).permit(:brand, :body, :purchase_date, :price)
  end
end
