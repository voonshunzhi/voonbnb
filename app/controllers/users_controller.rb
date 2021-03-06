class UsersController < Clearance::UsersController
	before_action :require_login, only: [:profile,:edit]
	before_action :find_params,only: [:edit,:show,:update]
	 def create
    @user = user_from_params

	    if @user.save
	      sign_in @user
	      redirect_back_or url_after_create
	      UserMailer.welcome_email(@user).deliver_later
	    else
	      render template: "users/new"
	    end

	end

	 def user_from_params
	    email = user_params.delete(:email)
	    password = user_params.delete(:password)
	    username = user_params.delete(:username)

	    Clearance.configuration.user_model.new(user_params).tap do |user|
	      user.email = email
	      user.password = password
	      user.username = username
	    end
	    
	end

	def profile
		@user = User.find(current_user.id)
	end

	def edit
	end

	def update
		@user.update(edit_params)
		redirect_to profile_page_path
	end

	def show
	end

	private
	def find_params
		@user = User.find(params[:id])
	end
	def edit_params
		params.require(:user).permit(:username,:email,:image)
	end
end