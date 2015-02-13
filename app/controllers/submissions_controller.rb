class SubmissionsController < ApplicationController
	def index
		@assignment = Assignment.find params[:assignment_id]
		@submissions = @assignment.submissions
	end

	def show
		@assignment = Assignment.find params[:assignment_id]
		@submission = @assignment.submissions.find params[:id]
	end

	def new
		@assignment = Assignment.find params[:assignment_id]
		@submission = @assignment.submissions.new
	end

	def create
		@assignment = Assignment.find params[:assignment_id]
		@submission = @assignment.submissions.create submission_params
		redirect_to assignment_submissions_path
	end	
	
	def edit
		@assignment = Assignment.find params[:assignment_id]
		@submission = @assignment.submissions.find params[:id]
	end

	def update
		@assignment = Assignment.find params[:assignment_id]
		@submission = @assignment.submissions.find params[:id]
		@submission.update_attributes submission_params
		redirect_to assignment_submissions_path	
	end

	def destroy
		@assignment = Assignment.find params[:assignment_id]
		@submission = @assignment.submissions.find params[:id]
		@submission.delete
		redirect_to assignment_submissions_path
	end	

private
	def submission_params
		params.require(:submission).permit(
			:description,
			:name,
			assignment_ids: [],
			submission_ids: []
			)
	end	
end
