class CopropertiesController < ApplicationController
  before_action :find_coproperty, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.is_syndic?
      @coproperties = current_user.syndic.coproperties
    else
      @coproperties = current_user.owner.coproperties
    end
  end

  def show
    @coproperty = Coproperty.find(params[:id])
    @budget = @coproperty.budgets.first
    if current_user.is_syndic?
      render "pages/syndic_dashboard"
    else
      render "pages/owner_dashboard"
    end
  end

  def new
    @coproperty = Coproperty.new
  end

  def create
    @coproperty = Coproperty.new(coproperty_params)
    @coproperty.syndic = current_user.syndic
    if @coproperty.save
    redirect_to syndic_coproperties_path, :notice => "Copropriété créée !"
    else
    render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @coproperty.update(coproperty_params)
    redirect_to syndic_coproperty_path(current_user.syndic, @coproperty), :notice  => "Copropriété mise à jour!"
    else
    render :action => 'edit'
    end
  end

  def destroy
    @coproperty.destroy
    redirect_to syndic_coproperties_path, :notice => "Copropriété supprimée !"
  end

private

  def coproperty_params
    params.require(:coproperty).permit(:coproperty_name, :number_properties, :address, :expense_method, :coprop_private_area, :coprop_common_area, :photo, :bank_account, :syndic_id)
  end

  def find_coproperty
    @coproperty = Coproperty.find(params[:id])
  end

end
