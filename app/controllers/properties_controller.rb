class PropertiesController < ApplicationController

  def index
    if current_user.is_syndic?
      @properties = current_user.syndic.coproperties.first.properties
      @coproperty = Coproperty.find(params[:coproperty_id])
    else
      @properties = current_user.owner.properties
    end
  end

  def show
    @property = Property.find(params[:id])
    @requests = @property.requests
  end

  def new
    @property = Property.new
    @coproperty = Coproperty.find(params[:coproperty_id])
    @syndic = current_user.syndic
  end

  def create
    @property = Property.new(property_params)
    @property.coproperty_id = current_user.syndic.coproperties.first.id
    if @property.save
      Link.create(property_id: @property.id)
      redirect_to syndic_coproperty_properties_path(current_user.syndic, Coproperty.find(params[:coproperty_id])), :notice => "Propriété créée!"
    else
      render :action => 'new'
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    if @property.update_attributes(property_params)
      redirect_to @property, :notice  => "Propriété mise à jour!"
    else
      render :action => 'edit'
    end
  end

  def delete
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_url, :notice => "Propriété supprimée!"
  end

private

  def property_params

    params.require(:property).permit(:owner_id, :address, :building, :floor, :property_number, :total_property_area, :payment_frequency, :coproperty_id)

  end

end
