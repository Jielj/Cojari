class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
    redirect_to @request, :notice => "Successfully created request."
    else
    render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @request.update(request_params)
    redirect_to @request, :notice  => "Successfully updated request."
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
    params.require(:request).permit(:object, :request_title, :request_date, :request_status, :property_id, :budget_id, photos: [])
  end

  def find_request
    @request = Request.find(params[:id])
  end
end
