class ChecklistItemsController < ApplicationController

  def create
    @checklist_item = ChecklistItem.build(checklist_item_params)
    @checklist_item.save
  end

  def destroy
    @checklist_item = ChecklistItem.find(params[:id])
    @checklist_item.destroy!
  end

  private

  def checklist_item_params
    params.require(:checklist_item).permit(:name).merge(checklist_id: params[:checklist_id])
  end
end
