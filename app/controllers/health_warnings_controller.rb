class HealthWarningsController < ApplicationController
  before_action :set_health_warning, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [ :update, :destroy]


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
    if current_user
  @user = User.find(session[:user_id])
  @health_warning = current_user.health_warnings.build(health_warning_params)
      
        if @health_warning.save
           redirect_to @health_warning
        else
          render :new 
      end 
    else  
      redirect_to root_path 
    end 
    end

  # PATCH/PUT /health_warnings/1
  # PATCH/PUT /health_warnings/1.json
  def update
    if @health_warning.user == current_user
    respond_to do |format|
      if @health_warning.update(health_warning_params)
        format.html { redirect_to @health_warning, notice: 'Health warning was successfully updated.' }
        format.json { render :show, status: :ok, location: @health_warning }
      else
        format.html { render :edit }
        format.json { render json: @health_warning.errors, status: :unprocessable_entity }
      end
    end 
    else 
      redirect_to health_warnings_url
    end
  end

  # DELETE /health_warnings/1
  # DELETE /health_warnings/1.json
  def destroy
    if @health_warning.user == current_user 
    @health_warning.destroy
    respond_to do |format|
      format.html { redirect_to health_warnings_url, notice: 'Health warning was successfully destroyed.' }
      format.json { head :no_content }
    end
  else 
    redirect_to root_path
  end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_warning
      @health_warning = HealthWarning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_warning_params
      params.require(:health_warning).permit(:name, :link, :user_id, :product_id)
    end
end
