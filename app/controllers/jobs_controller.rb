class JobsController < ApplicationController
  def show
    @job = Job.find_by(user_id: params[:user_id], id: params[:id])
    render json: @job
  end

  # Would we want to get ALL jobs or just a specific user's jobs?
  def index
    @jobs = Job.find_by(user_id: params[:user_id])
    puts @jobs
    render json: @jobs
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = params[:user_id]

    if @job.valid?
      @job.save
      render json: @job, status: 200
    else
      render json: { errors: @job.errors.messages }, status: 400
    end
  end

  def check
    @job = Job.find_by(user_id: params[:user_id], id: params[:id])
    render json: @job.check_it_out
  end

  private

  def job_params
    params.require(:job).permit(:company, :website, :linkedin, :link)
  end
end
