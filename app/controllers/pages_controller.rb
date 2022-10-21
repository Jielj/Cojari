class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      redirect_to syndic_coproperties_path(current_user.syndic)
    end
  end
end
