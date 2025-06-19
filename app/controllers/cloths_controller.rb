class ClothsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ discarded show_discarded ]
  before_action :set_cloth, only: %i[ show edit update destroy confirm_discard discard]
  after_action :check_season, only: %i[ create ]
  helper_method :prepare_meta_tags

  def index
    if params[:q].present? && params[:q][:brand_or_body_cont].present?
      search_term = params[:q][:brand_or_body_cont].split(/[\p{blank}\s]+/)
      grouping_hash = search_term.reduce({}) do |hash, word|
        hash.merge(word => { brand_or_body_cont: word })
      end
      other_conditions = params[:q].except(:brand_or_body_cont)
      @q = current_user.cloths.kept.ransack(other_conditions.merge({ combinator: "and", groupings: grouping_hash }))
    else
    @q = current_user.cloths.kept.ransack(params[:q])
    end
    @cloths = @q.result(distinct: true).page(params[:page]).order(created_at: :desc) # 検索結果に重複を許さない
  end

  def show
  end

  def new
    @cloth = current_user.cloths.new
  end

  def create
    @cloth = current_user.cloths.new(cloth_params)
    @cloth.title ||= "もっと捨てたい"

    if @cloth.save
    else
      flash.now[:danger] = I18n.t("defaults.flash_message.not_created", item: Cloth.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    selected_category = Category.find(@cloth.category_ids.last)

    if selected_category.present?
      parent_category = selected_category.parent
      if parent_category.present?
        @parents = parent_category.siblings.presence || [ parent_category ]
        @selected_parent_id = parent_category.id

        @children = parent_category.children
        @selected_children_id = selected_category.id
      else
        @parents = selected_category.children
        @selected_parent_id = nil
        @parents = [] # 親がいない場合は空の配列を設定
        @selected_parent_id = nil
      end
    else
      @parents = [] # selected_categoryがない場合も空の配列を設定
      @children = []
      @selected_parent_id = nil
      @selected_children_id = nil
    end
  end

  def update
    if @cloth.update(cloth_params)
      redirect_to cloth_path(@cloth)
    else
      flash.now[:danger] = I18n.t("defaults.flash_message.not_updated", item: Cloth.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cloth.destroy!
    redirect_to cloths_path, notice: I18n.t("defaults.flash_message.deleted", item: Cloth.model_name.human), status: :see_other
  end

  def favorites
    @favorite_cloths = current_user.favorite_cloths.page(params[:page]).order(created_at: :desc)
  end

  def confirm_discard
  end

  def discard
    if @cloth.update(discard_params)
      @cloth.discard!
      render json: { redirect_url: cloths_path }, status: :ok
    else
      render :confirm_discard, status: :unprocessable_entity
    end
  end

  def discarded
    @discarded_cloths = Cloth.includes(:user).discarded.order(discarded_at: :asc)
  end

  def show_discarded
    @cloth = Cloth.discarded.find(params[:id])
    prepare_meta_tags(@cloth)
  end

  def destroy_discarded
    @discarded_cloth = current_user.cloths.discarded.find(params[:id])
    @discarded_cloth.destroy!
    redirect_to discarded_cloths_path, status: :see_other
  end

  private

  def check_season
    @cloth.season_ids = params[:cloth][:season_ids] if params[:cloth][:season_ids].present?
  end

  def set_cloth
    @cloth = current_user.cloths.find(params[:id])
  end

  def cloth_params
    category_ids = []
    category_ids << params[:root_id] if params[:root_id].present?
    category_ids << params[:parent_id] if params[:parent_id].present?
    category_ids << params[:child_id] if params[:child_id].present?

    params.require(:cloth).permit(:image_file, :image_file_cache, :brand, :body, :purchase_date, :price, { season_ids: [] }).merge(category_ids: category_ids) # モデル名_ids: []複数のidを配列で受け取る
  end

  def discard_params
    params.require(:cloth).permit(:title)
  end

  def prepare_meta_tags(cloth)
    image_url = "#{request.base_url}/images/ogp.png?text=#{CGI.escape(cloth.title)}"

    set_meta_tags og: {
      site_name: "well断",
      title: "私は捨てました | well断",
      description: "クローゼットを管理し、断捨離をサポートするサービス",
      type: "website",
      url: request.original_url,
      image: image_url,
      locale: "ja-JP"
    },
    twitter: {
      card: "summary_large_image",
      site: "@",
      image: image_url
    }
  end
end
