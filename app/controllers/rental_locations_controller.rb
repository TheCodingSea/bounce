class RentalLocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rental_location, only: [:show, :edit, :update, :destroy]

  def index
    @rental_locations = RentalLocation.all
  end

  def show
  end

  def new
    @rental_location = RentalLocation.new
  end

  def edit
  end

  def create
    @rental_location = RentalLocation.new(rental_location_params)
    @rental_location.sale_id = current_sale.id

    respond_to do |format|
      if @rental_location.save
        format.html { redirect_to review_and_pay_path }
        #format.html { redirect_to @rental_location, notice: 'Rental location was successfully created.' }
        format.json { render :show, status: :created, location: @rental_location }
      else
        format.html {
          @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(@rental_location.sale_id)
          render "checkout/cart"
        }
        #format.html { render :new }
        format.json { render json: @rental_location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rental_location.update(rental_location_params)
        format.html { redirect_to review_and_pay_path }
        #format.html { redirect_to @rental_location, notice: 'Rental location was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental_location }
      else
        format.html {
          @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(@rental_location.sale_id)
          render "checkout/cart"
        }
        #format.html { render :edit }
        format.json { render json: @rental_location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rental_location.destroy
    respond_to do |format|
      format.html { redirect_to rental_locations_url, notice: 'Rental location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_location
      @rental_location = RentalLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_location_params
      params.require(:rental_location).permit(:first_name, :last_name, :address_1, :address_2, :city, :state, :zip)
    end
end
