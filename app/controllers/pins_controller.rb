class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destory]

	def index
		@pins = Pin.all.order("Created_at DESC")
	end

	def show
		
	end

	def new
		@pin = current_user.pins.build
	end

	def create
		@pin = current_user.pins.build(pin_params)
		if @pin.save
			redirect_to @pin, notice: "Success, you've created something"
		else
			render 'new'
		end
	end

	def edit

	end

	def update

		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin was successfully updated"
		else
			render 'edit'
		end
	end


	def destroy
		@pin = Pin.find(params[:id])
		@pin.destroy
		redirect_to root_path
	end

	


	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image)

	end

	def find_pin
		@pin = Pin.find(params[:id])
	end

end
