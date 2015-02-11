class LocationsController < ApplicationController
	def index
		@locations = Location.all
		# @courses = Course.all
	end

	def new
		@location = Location.new

	end

	def show
		@location = Location.find params[:id]
		@course = @location.courses
	end

	def create
		@location = Location.create location_params
		@course = @location.courses
		redirect_to locations_path
	end

	def edit
		@location = Location.find params[:id]
		@courses = Course.all
	end

	def update
		@location = Location.find params[:id]
		@location.update_attributes location_params
		@course = @location.courses
		redirect_to locations_path	
	end

	def destroy
		@location = Location.find params[:id]
		@location.destroy
		redirect_to locations_path
	end

private
	def location_params
		params.require(:location).permit(
		:name,
		:address,
		course_ids: [],
		location_ids: []
		)
	end		
end
