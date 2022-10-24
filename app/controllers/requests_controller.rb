class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request = Request.new
    @owner = current_user.owner
    @property = Property.find(params[:property_id])
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def create
    @request = Request.new(request_params)
    @request.property = Property.find(params[:property_id])
    if @request.save
    redirect_to owner_coproperty_property_path(current_user.owner,Coproperty.find(params[:coproperty_id]),Property.find(params[:property_id])), :notice => "Successfully created request."
    else
    render :action => 'new'
    end
  end

  def edit
    @owner = current_user.owner
    @property = Property.find(params[:property_id])
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def update
    if @request.update(request_params)
      redirect_to owner_coproperty_property_path(current_user.owner,Coproperty.find(params[:coproperty_id]),Property.find(params[:property_id])), :notice => "Successfully created request."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @request.destroy
    redirect_to coproperties_url, :notice => "Successfully destroyed request."
  end

private

  def request_params
    params.require(:request).permit(:request_title, :request_date, :request_status, :message, :property_id, :budget_id, photos: [])
  end

  def find_request
    @request = Request.find(params[:id])
  end
end
