class AppliesController < ApplicationController
	def  create
		@job = Job.find(params[:job_id])
		current_user.resume.jobs.push(@job) unless current_user.resume.jobs.include?(@job)
		redirect_to :back
	end

	def destroy

	end

end
