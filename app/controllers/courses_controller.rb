class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.create course_params
		redirect_to courses_path
	end	
	
	def edit
		@course = Course.find params[:id]
	end

	def update
		@course = Course.find params[:id]
		@course.update_attributes course_params
		redirect_to courses_path	
	end

	def destroy
		@course = Course.find params[:id]
		@course.delete
		redirect_to courses_path
	end	

private
	def course_params
		params.require(:course).permit(
			:name,
			:description,
			course_ids: [],
			location_ids: []
			)
	end	
end
