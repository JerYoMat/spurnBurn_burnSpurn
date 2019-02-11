require 'pry'
class TipsController < ApplicationController

  #Nested Routes
  def index
    @tips = Tip.where(:lesson_id => params[:lesson_id])
    
  end 

  def user_tips
    @tips = current_user.tips
    render json: @tips, status: 200
  end 

  def new 
    if logged_in?
      @user = current_user
      @tip = Tip.new(:user_id => current_user.id) 
    elsif params[:tip_id]
      @tip = Tip.new(:lesson_id => params[:id], :user_id => current_user.id) 
      @lesson = Lesson.find(params[:lesson_id])
      @options = [[@lesson.name, @lesson.id]]
    else 
      redirect_to login_path 
    end 
  end 
#End Nested Routes 

 def show 
  @tip = Tip.find(params[:id])
 end 

  def create
    if logged_in?
    @tip = current_user.tips.build(tip_params)
    if @tip.save
      flash[:success] = "Thanks! Your tip has been added."
      redirect_to root_path
    else
      @options = Lesson.all.map{|l| [l.name, l.id]}    
      @feed_items = []  #The empty array  keeps failed submissions from breaking 
      render 'static_pages/home'
    end
    else
      redirect_to login_path
    end  
  end

  def destroy
    if logged_in?
      @tip = Tip.find(params[:id])
      if @tip.user == current_user
            @tip.destroy
            flash[:success] = "Tip deleted"
      end 
    end 
        redirect_to request.referrer || root_url #request.referrer just redirects to the previous url for a better user experience.

  end

  private

    def tip_params
        params.require(:tip).permit(:title, :description, :link, :lesson_id)
    end

    def correct_user
      @tip = current_user.tips.find_by(id: params[:id])
      redirect_to root_url if @tip.nil?
    end
end
