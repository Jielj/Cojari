class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    @owner.user = current_user
    @property = Property.find(params[:owner][:property_id])
    if @owner.save
      @property.owner = @owner
      @property.save
      redirect_to @owner, :notice => "Successfully created owner."
    else
      render :action => 'new'
    end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    if @owner.update_attributes(owner_params)
      redirect_to @owner, :notice  => "Successfully updated owner."
    else
      render :action => 'edit'
    end
  end

  def delete
    @owner = Owner.find(params[:id])
    @owner.destroy
    redirect_to owners_url, :notice => "Successfully destroyed owner."
  end

private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :gender, :card_number, :phone_number, :ownership_date, :birth_date, :user_id)
  end

end
