class AssignmentsController < ApplicationController
	def index
		@assignments = Assignment.all
	end

	def new
		@assignment = Assignment.new

	end

	def show
		@assignment = Assignment.find params[:id]
	end

	def create
		@assignment = Assignment.create assignment_params
		redirect_to assignments_path
	end
	
	def edit
		@assignment = Assignment.find params[:id]
	end

	def update
		@assignment = Assignment.find params[:id]
		@assignment.update_attributes assignment_params
		redirect_to assignments_path
	end

	def destroy
		@assignment = Assignment.find params[:id]
		@assignment.delete
		redirect_to assignments_path
	end

private
	def assignment_params
		params.require(:assignment).permit(
			:name,
			:requirements
			)
	end	
end
