class PropertiesController < ApplicationController
  
  def list
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property, :notice => "Successfully created property."
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
    params.require(:books).permit(:owner_id, :address, :building, :floor, :property_number, :total_property_area, :payment_frequency, :coproperty_id)
  end

end
