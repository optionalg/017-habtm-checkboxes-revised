class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @categorization = @category.categorizations.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to @category, notice: "Successfully created category."
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to @category, notice: "Successfully created category."
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, notice: "Successfully destroyed category."
  end
end
