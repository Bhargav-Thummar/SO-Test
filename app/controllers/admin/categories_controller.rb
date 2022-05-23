class Admin::CategoriesController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :set_admin_category, only: %i[ show edit update destroy ]

  def index
    @categories_datatable = CategoriesDatatable.new
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(admin_category_params)

    if @category.save
      redirect_to admin_categories_path(@category), notice: "Category was successfully created."
    else
      render :new
    end
  end

  def update
    if @category.update(admin_category_params)
      redirect_to admin_categories_path(@category), notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
      redirect_to admin_categories_url, notice: "Category was successfully destroyed."
  end

  private
    def set_admin_category
      @category = Category.find(params[:id])
    end

    def admin_category_params
      params.require(:category).permit(:title)
    end
end
