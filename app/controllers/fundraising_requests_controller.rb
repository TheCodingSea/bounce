class FundraisingRequestsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  before_action :set_fundraising_request, only: [:show, :submitted, :edit,
                                                 :update, :destroy]

  def index
    @fundraising_requests = FundraisingRequest.all
  end

  def show
  end

  def submitted
  end

  def new
    @products = Product.all
    @fundraising_request = FundraisingRequest.new
  end

  def edit
  end

  def create
    @fundraising_request = FundraisingRequest.new(fundraising_request_params)

    respond_to do |format|
      if @fundraising_request.save
        format.html { redirect_to fundraising_request_submitted_path(id: @fundraising_request), notice: 'Thank you! Your request was successfully submitted.' }
        format.json { render :show, status: :created, location: @fundraising_request }
      else
        format.html {
          render :new
          @products = Product.all
        }
        format.json { render json: @fundraising_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fundraising_request.update(fundraising_request_params)
        format.html { redirect_to @fundraising_request, notice: 'Fundraising request was successfully updated.' }
        format.json { render :show, status: :ok, location: @fundraising_request }
      else
        format.html { render :edit }
        format.json { render json: @fundraising_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fundraising_request.destroy
    respond_to do |format|
      format.html { redirect_to fundraising_requests_url, notice: 'Fundraising request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fundraising_request
      require 'pp'
      puts "XXXXXXXXXXXXXXXXX"
      pp params
      puts "XXXXXXXXXXXXXXXXX"
      @fundraising_request = FundraisingRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fundraising_request_params
      params.require(:fundraising_request).permit(:name, :organization_name, :email, :event_date, :comments)
    end
end
