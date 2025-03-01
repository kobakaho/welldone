class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [ :show, :update, :destroy ]
  
  def index
    @checklists = Checklist.all
  end

  def new
    @checklist = Checklist.new
  end

  def show
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
    @checklist = current_user.checklists.find(params[:id])
  end

  def update
    respond_to do |format|
      if @checklist.update
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
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:title)
  end
end
