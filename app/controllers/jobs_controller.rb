class JobsController < ApplicationController
  before_action :authenticate_user!

  # GET /jobs
  # GET /jobs.json
  def index
    @user = User.find(current_user.id)
    @jobs = Job.all
    @my_jobs = current_user.jobs
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id]) 
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.new
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
    redirect_to(jobs_path, notice: "Can't do that homes") unless @job.user_id == current_user.id
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = current_user.jobs.new(job_params)
    if @job.save
      redirect_to(jobs_path, notice: "Job was created succesfully amigo!")
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    if  @job.user_id == current_user.id
      @job.destroy
      redirect_to(jobs_path, notice: "The post was deleted successfully amigo!")
    else
      redirect_to(jobs_path, notice: "Can't do that homes")
  end
end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :price, :currency, :address, :latitude, :longtitude)
    end
end
