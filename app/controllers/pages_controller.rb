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
          redirect_to owner_coproperty_path(current_user.owner, current_user.owner.coproperties.first)
        end
      end
    end
  end

  def syndic_dashboard
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def owner_dashboard
    @coproperty = Coproperty.find(params[:coproperty_id])
  end
end
