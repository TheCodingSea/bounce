class LineItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    @sale = current_sale
    @line_item = LineItem.new(line_item_params)

    respond_to do |format|
      if @line_item.valid?
        @sale.save
        set_current_sale(@sale.id)
        @line_item.sale_id = @sale.id
        @line_item.save
        #FIXME Check that date is available
        date = Date.parse( params[:rental].to_a.sort.collect{|c| c[1]}.join("-") )
        @rental = Rental.create(line_item_id: @line_item.id,
                                product_id: @line_item.product_id, start_date: date)

        format.html { redirect_to cart_path, notice: 'Product was added to your cart.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render "products/show" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
