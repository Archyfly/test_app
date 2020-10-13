class Admin::ProductsController < ApplicationController
  #before_action :find_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    # callback in private - :find_product
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title,
                                    :description,
                                    :price,
                                    :category_id,
                                    :action_category_id,
                                    :user_id,
                                    :remove_image)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def user_id
    @current_user.id
  end

end
