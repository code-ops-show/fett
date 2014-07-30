class CommentsController < ApplicationController
  def index
  end

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.create(comment_params)
    redirect_to job_path(@job)
  end

  def destroy
    @job = Job.find(params[:job_id])
    @comment = @job.comments.find(params[:id])
    @comment.destroy
    redirect_to job_path(@job)
  end


  def edit
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
