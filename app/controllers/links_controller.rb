class LinksController < ApplicationController

  def show
    @link = Link.find(params[:id])
    @property = Property.find(@link.property_id)
    @owner = Owner.new
    @user = current_user
  end
end
