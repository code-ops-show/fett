class ResumesController < ApplicationController

  def index
    @resume = Resume.last
    @userxx = current_user
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def edit
  end

  def create
   @resume = current_user.build_resume(resume_params)
    if @resume.save
      redirect_to resumes_path
    end   
  end

  def update
  end

  def destroy
  end

  # private

  def resume_params
    params.require(:resume).permit(:personality_traits, :summary, :languages, :education_history, :work_history)
  end

end



