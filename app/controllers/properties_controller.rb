class PropertiesController < ApplicationController

  def index
    @properties = Property.all
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def show
    @property = Property.find(params[:id])
    @request = Request.all
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
      redirect_to syndic_coproperty_property_path(current_user.syndic, Coproperty.find(params[:coproperty_id]), @property), :notice => "Successfully created property."
    else
      render :action => 'new'
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    if @property.update_attributes(property_params)
      redirect_to @property, :notice  => "Successfully updated property."
    else
      render :action => 'edit'
    end
  end

  def delete
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_url, :notice => "Successfully destroyed property."
  end

private

  def property_params

    params.require(:property).permit(:owner_id, :address, :building, :floor, :property_number, :total_property_area, :payment_frequency, :coproperty_id)

  end

end
