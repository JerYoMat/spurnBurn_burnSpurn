class PagesController < ApplicationController
  def home 
    if logged_in?
      @options = Lesson.all.map{|l| [l.name, l.id]}  
      @tip  = current_user.tips.build
     
    end
  end 

end
