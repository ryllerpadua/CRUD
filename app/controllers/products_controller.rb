class ProductsController < ApplicationController
  def index
    @products = Product.all
    # if params[:query].present?
    #   @products = Product.search_by_title(params[:query])
    # else
    #   @products = Product.all
    # end
  end

  def show
    @product = Product.find(params[:id])
    @order = Order.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
    redirect_to products_path, notice: 'Product was successfully created !'
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product), notice: 'Product was successfully updated !'
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully deleted !'
  end

  private

  def product_params
    params.require(:product).permit(:procutname, :price, :barcode)
  end

end
