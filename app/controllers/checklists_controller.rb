class ChecklistsController < ApplicationController
  before_action :set_checklist, only: %i[ show edit update destroy ]

  def index
    @checklists = current_user.checklists
  end

  def new
    @checklist = current_user.checklists.new
  end

  def show
    @checklist_item = @checklist.checklist_items.new
  end

  def create
    @checklist = current_user.checklists.new(checklist_params)

    respond_to do |format|
      if @checklist.save
        format.html { redirect_to checklist_url(@checklist), notice: I18n.t("defaults.flash_message.created", item: Checklist.model_name.human) }
      else
        flash.now[:danger] = I18n.t("defaults.flash_message.not_created", item: Checklist.model_name.human)
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @checklist.update(checklist_params)
        format.html { redirect_to checklist_url(@checklist), notice: I18n.t("defaults.flash_message.updated", item: Checklist.model_name.human) }
      else
        flash.now[:danger] = I18n.t("defaults.flash_message.not_updated", item: Checklist.model_name.human)
        format.html { render :new, status: :unprocessable_entity }
      end
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
