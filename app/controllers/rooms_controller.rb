class RoomsController < ApplicationController
  def index
  	@rooms = Room.all
  end

  def new
  	@room = Room.new
  end

  def create
  	@room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = 'Room has been added!'
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def show
  	@room = Room.find(params[:id])
		@messages = @room.messages
	end

	private
		def room_params
			params.require(:room).permit(:topic)
		end
end
