class ProductsController < ApplicationController

  # Authentication, except index, show
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  caches_page :show
  caches_action :index, layout: false

  # GET /products
  # GET /products.json
  def index
    @q = Product.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @products = @q.result(distinct: true)
    @product = Product.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    respond_to do |format|
      format.html
      format.json { render json: @product, status: :ok, location: @product }
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        expire_page action: 'show', id: @product.id
        expire_fragment :all
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json
      else
        format.html { render :edit }
        format.json { render json: @product.errors.full_messages.join(', '), status: :error }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :description)
    end
end
