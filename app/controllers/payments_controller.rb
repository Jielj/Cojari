class PaymentsController < ApplicationController
  before_action :find_payment, only: [:show, :edit, :update]

  def index
    @payments = Payment.all
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
    redirect_to @payment, :notice => "Successfully created payment."
    else
    render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @payment.update(payment_params)
    redirect_to @payment, :notice  => "Successfully updated payment."
    else
    render :action => 'edit'
    end
  end

private

  def payment_params
    params.require(:payment).permit(:payment_amount, :payment_title, :payment_date, :payment_status, :budget_id, :property_id)
  end

  def find_payment
    @payment = payment.find(params[:id])
  end
end
