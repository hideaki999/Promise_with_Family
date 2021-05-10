# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
   @user = User.new 
  end

  # POST /resource
   def create
     @user = User.new(sign_up_params)
    if @user.valid? && @user[:name].present?
      session["devise.regist_data"] = {user: @user.attributes}
      session["devise.regist_data"][:user]["password"] = params[:user][:password]
      @family = Family.new
      render :new_family
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
   end

   def create_family
    @user = User.new(session["devise.regist_data"]["user"])
    @user.save

    family_params.each do |family|
      family_new = Family.new(family)
      family_new.family_create(family_new,family)
    end

    # unless family_new.valid?
    #     flash.now[:alert] = @family.errors.full_messages
    #     render :new_family and return
    # end
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
    redirect_to root_path
   end

   protected

    def sign_up_params
      # devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    def family_params
      binding.pry
      familys = []
      familys_register = []
      n = 0
      user_id = @user.id

      params_familys = params.require(:family).delete_if{|k,v| v == ""}
      params_familys.each_key {|key|
      familys_register << params_familys.permit(key)
      }

      familys_register_num = familys_register.length/2

      familys_register_num.times do
        if familys_register[n].present? && familys_register[n + 1].present?
          familys << familys_register[n].merge(familys_register[n + 1]).merge(user_id: user_id)
          puts familys
        end
        n += 2
      end

      familys = familys.uniq
      return familys

    end

    # def family_params
    #   familys = []
    #   user_id = @user.id
    #   family_name1 = params.require(:family).permit(:name, :relationship_id).merge(user_id: user_id)
    #   family_name2 = params.require(:family).permit(:name2, :relationship_id2).merge(user_id: user_id)
    #   family_name3 = params.require(:family).permit(:name3, :relationship_id3).merge(user_id: user_id)
    #   family_name4 = params.require(:family).permit(:name4, :relationship_id4).merge(user_id: user_id)
    #   family_name5 = params.require(:family).permit(:name5, :relationship_id5).merge(user_id: user_id)
    #   familys << family_name1
    #   if family_name2[:name2].present? && family_name2[:relationship_id2].present?
    #     familys << family_name2
    #   end
    #   if family_name3[:name3].present? && family_name3[:relationship_id3].present?
    #     familys << family_name3
    #   end
    #   if family_name4[:name4].present? && family_name4[:relationship_id4].present?
    #     familys << family_name4
    #   end
    #   if family_name5[:name5].present? && family_name5[:relationship_id5].present?
    #     familys << family_name5
    #   end
        
    #   familys
    # end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
