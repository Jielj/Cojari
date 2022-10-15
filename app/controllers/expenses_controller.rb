class ExpensesController < ApplicationController
  before_action :find_expense, only: [:show, :edit, :update]

  def index
    @expenses = Expense.all
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
    redirect_to @expense, :notice => "Successfully created expense."
    else
    render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
    redirect_to @expense, :notice  => "Successfully updated expense."
    else
    render :action => 'edit'
    end
  end

private

  def expense_params
    params.require(:expense).permit(:expense_name, :expense_type, :expense_amount, :expense_date, :expense_status, :budget_id)
  end

  def find_expense
    @expense = expense.find(params[:id])
  end
end
