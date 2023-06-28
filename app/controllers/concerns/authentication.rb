module Authentication
  extend ActiveSupport::Concern
    
    included do
      private
  
      def current_user
        if session[:user_id].present?
          @current_user ||= User.find(session[:user_id]) 
        elsif false
          @current_user = User.find(cookies.encrypted[:user_id])
        end
        
      end
      
      def user_signed_in?
        current_user.present?
      end
      
      def admisible_authentification?
        return unless user_signed_in?
        flash[:warning] = 'You are in sistem!'
        redirect_to root_path
      end
      
      def admisible_logout?
        return if user_signed_in?
        flash[:warning] = 'You cant LogOut, you are not in system'
        redirect_to session_new
      end
      
      def sign_in(user)
        session[:user_id] = user.id
        current_user
        flash[:success] = 'You enter in system'
      end
      
      def sign_out
        session.delete :user_id
        flash[:success] = 'See you later!'
      end
      
      helper_method :current_user, :user_signed_in?
    end
    
end