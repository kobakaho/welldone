class ItemsController < ApplicationController
  before_action :set_checklist, only: %i[ new create ]

  def new
    @default_items = DefaultItem.all
    @new_original_item = OriginalItem.new
    @original_items = @checklist.original_items.order(created_at: :desc)
  end


  def create
    @new_original_item = @checklist.original_items.build(original_item_params)

    if @new_original_item.save
      original_item_checklist = OriginalItemChecklist.find_or_create_by(checklist: @checklist, original_item: @new_original_item)
      redirect_to new_checklist_item_path(@checklist)
    else
      render :new
    end
  end


  def destroy_original_item
    @original_item = @checklist.original_items.find(params[:id])
    @original_item.destroy!
    redirect_to new_checklist_item_path(@checklist), status: :see_other
  end

  private

  def original_item_params
    params.require(:original_item).permit(:name)
  end

  def set_checklist
    @checklist = current_user.checklists.find(params[:checklist_id])
  end
end
