class ItemsController < ApplicationController
  def new
    @checklist = current_user.checklists.find(params[:checklist_id])
    @original_item = OriginalItem.new
    @original_items = @checklist.original_items.order(created_at: :desc)
    @default_items = DefaultItem.all
  end


  def create
    @checklist = current_user.checklists.find(params[:checklist_id])
    @original_item = @checklist.original_items.build(original_item_params)

    if @original_item.save
      @checklist.original_items << @original_item
    end
  end

  def destroy
    @original_item = OriginalItem.find(params[:id])
    @original_item.destroy!
  end

  private

  def original_item_params
    params.require(:original_item).permit(:name)
  end
end
