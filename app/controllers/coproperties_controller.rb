class CopropertiesController < ApplicationController
  before_action :find_coproperty, only: [:show, :edit, :update, :destroy]

  def index
    @coproperties = Coproperty.all
  end

  def show
  end

  def new
    @coproperty = Coproperty.new
  end

  def create
    @coproperty = Coproperty.new(coproperty_params)
    if @coproperty.save
    redirect_to @coproperty, :notice => "Successfully created coproperty."
    else
    render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @coproperty.update_attributes(coproperty_params)
    redirect_to @coproperty, :notice  => "Successfully updated coproperty."
    else
    render :action => 'edit'
    end
  end

  def destroy
    @coproperty.destroy
    redirect_to coproperties_url, :notice => "Successfully destroyed coproperty."
  end

private

  def coproperty_params
    params.require(:coproperty).permit(:coproperty_name; :number_properties; :address; :expense_method; :coprop_private_area; :coprop_common_area; :bank_account; :syndic_id)
  end

  def find_coproperty
    @coproperty = Coproperty.find(params[:id])
  end

end
