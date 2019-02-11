
    module SessionsHelper
        def log_in(user)
            session[:user_id] = user.id
          end
    
          def current_user
            if (user_id = session[:user_id])
              @current_user ||= User.find_by(id: user_id)
            elsif (user_id = cookies.signed[:user_id])
              user = User.find_by(id: user_id)
              if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
              end
            end
          end
              
          def logged_in?
            !current_user.nil?
          end
    
          def log_out
            session.delete(:user_id)
            @current_user = nil
          end
    
          def current_user?(user)
            user == current_user
          end
    
    #The below two methods are there to enable 'friendly-forwarding'.  If a user is prompted to log in when trying to access a page that requires login, then after providing credentials, the user experience is improved if the user is redirected to the original site they were trying to access.  
          def redirect_back_or(default)
            redirect_to(session[:forwarding_url] || default)
            session.delete(:forwarding_url)
          end
    
          def store_location
            session[:forwarding_url] = request.original_url if request.get?
          end
    
         
    
        end
    