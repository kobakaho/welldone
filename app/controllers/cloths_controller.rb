class ClothsController < ApplicationController

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
  end
      
  def edit
    @cloth = Cloth.find(params[:id])
  end
    
  def update
  end
    
  def destroy
  end

  private

  def cloth_params
    params.reqire(:cloth).permit(:image_file, :brand, :body, :purchase_date, :price)
  end
end
