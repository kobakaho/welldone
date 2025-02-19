class CategoriesController < ApplicationController
  def get_children
    parent_category = Category.find(params[:parent_id])
    @children = parent_category.children

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("get_children", partial: "categories/get_children", locals: { children: @children })
      end
    end
  end
end
