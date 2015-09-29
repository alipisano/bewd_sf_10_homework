class MessagesController < ApplicationController
	def show
    @message = Message.find(params[:id])
  	end

	def new
  	end

	def create
  		@message = message.new(message_params)
 
 		#save message to database
  		@message.save
  		redirect_to @message
	end
 
	private
  	def message_params
    params.require(:message).permit(:recipient, :text)
	end
end	

