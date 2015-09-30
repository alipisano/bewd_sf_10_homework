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

  def edit
    @message = Message.find(params[:id])
  end

	def create
    @message = Message.new(message_params)
 
    if @message.save
    redirect_to messages_path
    else 
    render 'new'
    end
  end

def update
  @message = Message.find(params[:id])
 
  if @message.update(message_params)
    redirect_to @message
  else
    render 'edit'
  end
end 

def destroy
  @message = Message.find(params[:id])
  @message.destroy
 
  redirect_to messages_path
end

 
private
  def message_params
    params.require(:message).permit(:recipient, :image)
  end
end

