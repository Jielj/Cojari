class SyndicsController < ApplicationController
  before_action :find_syndic, only: [:show, :edit, :update, :destroy]

  def show
    @coproperties = Coproperty.all
    @requests = Request.where(property_id: params[:id])

  end

  def new
    @syndic = Syndic.new
  end

  def create
    @syndic = Syndic.new(syndic_params)
    @syndic.user = current_user
    if @syndic.save
    redirect_to syndic_coproperties_path(@syndic.id), :notice => "Successfully created Syndic."
    else
    render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @syndic.update(syndic_params)
    redirect_to @syndic, :notice  => "Successfully updated coproperty."
    else
    render :action => 'edit'
    end
  end

  def destroy
    @syndic.destroy
    redirect_to #home, :notice => "Successfully destroyed coproperty."
  end

private

  def syndic_params
    params.require(:syndic).permit(:syndic_name, :creation_date)
  end

  def find_syndic
    @syndic = Syndic.find(params[:id])
  end

end
