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
    @budget = Budget.first
    @expenses = Expense.first
    @properties = Property.first
    @requests = Request.first
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
    redirect_to syndic_coproperties_path, :notice => "Successfully created coproperty."
    else
    render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @coproperty.update(coproperty_params)
    redirect_to syndic_coproperty_path(current_user.syndic, @coproperty), :notice  => "Successfully updated coproperty."
    else
    render :action => 'edit'
    end
  end

  def destroy
    @coproperty.destroy
    redirect_to syndic_coproperties_path, :notice => "Successfully destroyed coproperty."
  end

private

  def coproperty_params
    params.require(:coproperty).permit(:coproperty_name, :number_properties, :address, :expense_method, :coprop_private_area, :coprop_common_area, :photo, :bank_account, :syndic_id)
  end

  def find_coproperty
    @coproperty = Coproperty.find(params[:id])
  end

end
