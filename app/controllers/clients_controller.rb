class ClientsController < ApplicationController
  def index
    @clients = Client.all

    # if params[:query].present?
    #   @products = Product.search_by_title(params[:query])
    # else
    #   @products = Product.all
    # end
  end

  def show
    @client = Client.find(params[:id])
    # @order = Order.new
  end

  def new
    @client = Client.new
    # authorize @product
  end

  def create
    @client = Client.new(client_params)
    # authorize @product
    # @product.user = current_user
    @client.save
    redirect_to clients_path, notice: 'Product was successfully created !'
  end

  def edit
  end

  def update
    @client.update(client_params)
    redirect_to client_path(@client), notice: 'Product was successfully updated !'
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'Product was successfully deleted !'
  end

  private

  def client_params
    params.require(:client).permit(:clientname, :cpf, :email)
  end
end
