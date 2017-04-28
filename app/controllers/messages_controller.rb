class MessagesController < ApplicationController

  before_action :authenticate_user!, :only => [:create]

  def show
    @user = User.find(params[:id])
    @messages = Message.where(:receiver => @user.id)
    @message = Message.new
  end

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
    else
      flash[:alert] = "無効なユーザー"
    end
    redirect_to :back
  end
end
