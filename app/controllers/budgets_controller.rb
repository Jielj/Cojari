class BudgetsController < ApplicationController
  before_action :find_budget, only: [:show, :edit, :update]

  def index
    @budgets = Budget.all
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def show
  end

  def new
    @budget = Budget.new
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def create
    @budget = Budget.new(budget_params)
    @coproperty = Coproperty.find(params[:coproperty_id])
    @budget.coproperty = @coproperty
    if @budget.save
    redirect_to syndic_coproperty_budgets_path, :notice => "Successfully created budget."
    else
    render :action => 'new'
    end
  end

  def edit
     @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def update
    if @budget.update(budget_params)
    redirect_to @budget, :notice  => "Successfully updated budget."
    else
    render :action => 'edit'
    end
  end

private

  def budget_params
    params.require(:budget).permit(:budget_type, :budget_status, :budget_start_date, :budget_end_date, :budget_amount, :budget_title, :coproperty_id, :budget_id, photos: [])
  end

  def find_budget
    @budget = Budget.find(params[:id])
  end
end
