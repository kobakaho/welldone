class CategoriesController < ApplicationController
  def get_children
    @children = Category.find(params[:parent_id]).children
    
    respond_to do |format|
      format.turbo_stream
    end
  end

  def get_grandchildren
    @grandchildren = Category.find(parems[:child_id]).children

    respond_to do |format|
      format.turbo_stream
    end
  end

end
