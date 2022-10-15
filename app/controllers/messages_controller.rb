class MessagesController < ApplicationController

  def index
    @messages = Message.where(coproperty: params[:coproperty_id])
    @chatroom = Coproperty.find(params[:coproperty_id])
    @message = Message.new
    @user = current_user.get_user_type
  end

  def create
    @coproperty = Coproperty.find(params[:coproperty_id])
    @message = Message.new(message_params)
    @message.coproperty = @coproperty
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @coproperty,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      render "coproperties/show", status: :unprocessable_entity
    end
  end





  private

  def message_params
    params.require(:message).permit(:content)
  end
end
