class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.is_syndic?
      @coproperty = Coproperty.find(params[:coproperty_id])
      @requests = Request.where(property_id: @coproperty.properties.ids)
      render 'syndic_index'
    else
      @coproperty = Coproperty.find(params[:coproperty_id])
      @requests = Request.where(property_id: current_user.owner.properties.ids)
      render 'owner_index'
    end
  end

  def show
  end

  def new
    @request = Request.new
    @owner = current_user.owner
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def create
    @request = Request.new(request_params)
    if @request.save!
    redirect_to owner_coproperty_requests_path(current_user.owner, @request.property.coproperty), :notice => "Requête Soumise"
    else
    render :action => 'new'
    end
  end

  def edit
    @owner = current_user.owner
    # @property = Property.find(params[:property_id])
    @coproperty = Coproperty.find(params[:coproperty_id])
  end

  def update
    @coproperty = Coproperty.find(params[:coproperty_id])
    if @request.update(request_params)
      redirect_to syndic_coproperty_requests_path(current_user.syndic, @coproperty), :notice => "Successfully created request."
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
