class PaymentsController < ApplicationController
  before_action :find_payment, only: [:show, :edit, :update]

  def index
    @coproperty = Coproperty.find(params[:coproperty_id])
    if current_user.is_syndic?
      @payments = Payment.where(property: @coproperty.properties)
    else
      @payments = Payment.where(property: current_user.owner.properties)
    end
  #   if current_user.owner.nil?
  #     render "payments/syndic_index"
  #  else
  #     render "payments/owner_index"
  #   end
  end

  def show
  end

  def new
    @payment = Payment.new
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def create
      @payment = Payment.new(payment_params)
      @coproperty = Coproperty.find(params[:coproperty_id])
      if @payment.save
      redirect_to owner_coproperty_payments_path(current_user.owner, @coproperty), :notice => "Successfully created payment."
      else
      render :action => 'new'
      end
    end


  def edit
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def update
    if @payment.update(payment_params)
    redirect_to syndic_coproperty_payment_path, :notice  => "Successfully updated payment."
    else
    render :action => 'edit'
    end
  end

private

  def payment_params
    params.require(:payment).permit(:payment_amount, :payment_title, :payment_date, :payment_status, :budget_id, :property_id, :budget_id, photos: [])
  end

  def find_payment
    @payment = Payment.find(params[:id])
  end
end
