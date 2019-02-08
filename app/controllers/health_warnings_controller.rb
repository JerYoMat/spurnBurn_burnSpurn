class HealthWarningsController < ApplicationController
  before_action :set_health_warning, only: [:show, :edit, :update, :destroy]

  # GET /health_warnings
  # GET /health_warnings.json
  def index
    @health_warnings = HealthWarning.all
  end

  # GET /health_warnings/1
  # GET /health_warnings/1.json
  def show
  end

  # GET /health_warnings/new
  def new
    @health_warning = HealthWarning.new
  end

  # GET /health_warnings/1/edit
  def edit
  end

  # POST /health_warnings
  # POST /health_warnings.json
  def create
    @health_warning = HealthWarning.new(health_warning_params)

    respond_to do |format|
      if @health_warning.save
        format.html { redirect_to @health_warning, notice: 'Health warning was successfully created.' }
        format.json { render :show, status: :created, location: @health_warning }
      else
        format.html { render :new }
        format.json { render json: @health_warning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_warnings/1
  # PATCH/PUT /health_warnings/1.json
  def update
    respond_to do |format|
      if @health_warning.update(health_warning_params)
        format.html { redirect_to @health_warning, notice: 'Health warning was successfully updated.' }
        format.json { render :show, status: :ok, location: @health_warning }
      else
        format.html { render :edit }
        format.json { render json: @health_warning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_warnings/1
  # DELETE /health_warnings/1.json
  def destroy
    @health_warning.destroy
    respond_to do |format|
      format.html { redirect_to health_warnings_url, notice: 'Health warning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_warning
      @health_warning = HealthWarning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_warning_params
      params.require(:health_warning).permit(:name, :link)
    end
end
