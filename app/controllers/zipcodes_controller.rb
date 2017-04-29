class ZipcodesController < ApplicationController
  before_action :set_zipcode, only: [:show, :edit, :update, :destroy]

  # GET /zipcodes
  # GET /zipcodes.json
  def index
    @zipcodes = Zipcode.all
  end

  # GET /zipcodes/1
  # GET /zipcodes/1.json
  def show
  end

  # GET /zipcodes/new
  def new
    @zipcode = Zipcode.new
  end

  # GET /zipcodes/1/edit
  def edit
  end

  # POST /zipcodes
  # POST /zipcodes.json
  def create
    @zipcode = Zipcode.find_or_initialize_by(zipcode_params)
    
    if @zipcode.save
      render :show, status: :created, location: @zipcode
    else
      render json: @zipcode.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /zipcodes/1
  # PATCH/PUT /zipcodes/1.json
  def update
    if @zipcode.update(zipcode_params)
      render :show, status: :ok, location: @zipcode 
    else
      render json: @zipcode.errors, status: :unprocessable_entity
    end
  end

  # DELETE /zipcodes/1
  # DELETE /zipcodes/1.json
  def destroy
    @zipcode.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zipcode
      @zipcode = Zipcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zipcode_params
      params.require(:zipcode).permit(:code, :street, :neighbordhood, :city, :state, :ibge)
    end
end
