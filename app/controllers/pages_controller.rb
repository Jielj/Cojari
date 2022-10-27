class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      if current_user.syndic.nil? && current_user.owner.nil?
        redirect_to new_syndic_path
      else
        if current_user.is_syndic?
          redirect_to syndic_coproperties_path(current_user.syndic)
        else
          redirect_to owner_coproperties_path(current_user.owner)
        end
      end
    end
  end

  def dashboard
    @coproperty = Coproperty.find(params[:coproperty_id])
  end
end
