class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all.page(params[:page]).per(20)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      @categories = Category.all
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :remarks)
  end

end
