class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end

