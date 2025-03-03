class ChecklistItemsController < ApplicationController
  before_action :set_checklist
  before_action :set_checklist_item, only: %i[ edit update destroy ]

  def new
    @checklist_item = @checklist.checklist_items.new
  end

  def create
    @checklist_item = @checklist.checklist_items.new(checklist_item_params)
    @checklist_item.save
  end

  def edit
  end

  def update
    @checklist_item.update(checklist_item_params)
  end

  def destroy
    @checklist_item.destroy!
  end

  private

  def set_checklist
    @checklist = current_user.checklists.find(params[:checklist_id])
  end

  def set_checklist_item
    @checklist_item = @checklist.checklist_items.find(params[:id])
  end

  def checklist_item_params
    params.require(:checklist_item).permit(:name)
  end
end
