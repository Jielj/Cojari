class OwnersController < ApplicationController
  def index
    @coproperty = Coproperty.find(params[:coproperty_id])
    if current_user.is_syndic?
      @owners = @coproperty.owners
    else
      @owners = current_user.owner.coproperties.first.owners
    end
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
      redirect_to owner_path @owner, :notice => "Résident créé !"
    else
      render :action => 'new'
    end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      redirect_to owner_path(current_user.owner), :notice  => "Résident mis à jour!"
    else
      render :action => 'edit'
    end
  end

  def delete
    @owner = Owner.find(params[:id])
    @owner.destroy
    redirect_to owners_url, :notice => "Résident supprimé !"
  end

private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :gender, :card_number, :phone_number, :ownership_date, :birth_date, :user_id, :photo)
  end

end
