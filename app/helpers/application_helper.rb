module ApplicationHelper
  def if_unauthorized_redirect_to(desired_path)
    redirect_to desired_path unless owning_user?
  end 
  
  def log_in(user)
    session[:user_id] = user.id
  end   
  
  def log_in_as(user)
    session[:user_id] = user.id
  end

  def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])  # Same as @current_user = @current_user || User.find_by(id: session[:user_id])
        end 
      end
    
      def owning_user?
      return false if !current_user 
           if @user.id == @current_user.id 
            true 
            else 
              false 
            end 
          end 
    
      def logged_in?
         !current_user.nil?
      end 
      
      def log_out
        session.delete(:user_id)
        @current_user = nil
      end
end
