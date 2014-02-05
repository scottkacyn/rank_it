class RevenueModelsController < ApplicationController
  before_action :set_revenue_model, only: [:show, :edit, :update, :destroy]

  # GET /revenue_models
  # GET /revenue_models.json
  def index
    @revenue_models = RevenueModel.all
  end

  # GET /revenue_models/1
  # GET /revenue_models/1.json
  def show
  end

  # GET /revenue_models/new
  def new
    @revenue_model = RevenueModel.new
  end

  # GET /revenue_models/1/edit
  def edit
  end

  # POST /revenue_models
  # POST /revenue_models.json
  def create
    @revenue_model = RevenueModel.new(revenue_model_params)

    respond_to do |format|
      if @revenue_model.save
        format.html { redirect_to @revenue_model, notice: 'Revenue model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @revenue_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @revenue_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /revenue_models/1
  # PATCH/PUT /revenue_models/1.json
  def update
    respond_to do |format|
      if @revenue_model.update(revenue_model_params)
        format.html { redirect_to @revenue_model, notice: 'Revenue model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @revenue_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revenue_models/1
  # DELETE /revenue_models/1.json
  def destroy
    @revenue_model.destroy
    respond_to do |format|
      format.html { redirect_to revenue_models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revenue_model
      @revenue_model = RevenueModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revenue_model_params
      params.require(:revenue_model).permit(:title)
    end
end
