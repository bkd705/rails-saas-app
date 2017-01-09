class Users::RegistrationsController < Devise::RegistrationsController
  before_action :select_plan, only: :new

  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end

  protected
    def after_sign_up_path_for(resource)
      new_user_profile_path(user_id: current_user.id)
    end

  private
    def select_plan
      unless (params[:plan] == '1' || params[:plan] == '2')
        flash[:notice] = "Please select a membership plan to sign up."
        redirect_to root_url
      end
    end
end