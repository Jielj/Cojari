class SyndicsController < ApplicationController
  before_action :find_syndic, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @syndic = Syndic.new
  end

  def create
    @syndic = Syndic.new(syndic_params)
    if @syndic.save
    redirect_to @syndic, :notice => "Successfully created coproperty."
    else
    render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @syndic.update_attributes(syndic_params)
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

  def coproperty_params
    params.require(:syndic).permit(:syndic_name; :creation_date; :user_id)
  end

  def find_syndic
    @syndic = Syndic.find(params[:id])
  end

end
