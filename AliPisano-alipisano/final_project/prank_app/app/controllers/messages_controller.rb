class MessagesController < ApplicationController
  
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id]) 
    #use to find the message we're interested in; pass in params to get the ID from the request
  end
 
  def new
    @message = Message.new
  end

	def create
    @message = Message.new(message_params)
 
    if @message.save
    redirect_to messages_path
    else 
    render 'new'
    end
  end
 
private
  def message_params
    params.require(:message).permit(:recipient, :image)
  end
end

