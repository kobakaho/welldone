class ChecklistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checklist, only: %i[ show edit update destroy ]

  def index
    @checklists = current_user.checklists.order(created_at: :desc)
  end

  def new
    @checklist = current_user.checklists.new
  end

  def show
    @checklist_item = @checklist.checklist_items.new
    @checklist_items = @checklist.checklist_items
  end

  def create
    @checklist = current_user.checklists.new(checklist_params)

    if @checklist.save
    else
      flash.now[:danger] = I18n.t("defaults.flash_message.not_created", item: Checklist.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @checklist.update(checklist_params)
    else
      flash.now[:danger] = I18n.t("defaults.flash_message.not_updated", item: Checklist.model_name.human)
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  def destroy
    @checklist.destroy!
    redirect_to checklists_path, notice: I18n.t("defaults.flash_message.deleted", item: Checklist.model_name.human), status: :see_other
  end

  private

  def set_checklist
    @checklist = current_user.checklists.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:title)
  end
end
