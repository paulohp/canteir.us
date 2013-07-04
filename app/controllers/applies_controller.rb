class AppliesController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @apply = @job.applies.build(params[:apply])
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:resume_id])
    @apply = Apply.create :resume_id => @resume.id, :job_id => @job.id
    respond_to do |format|
      if @apply.save
        format.html { redirect_to root_path, notice: 'Vaga criada com sucesso' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
end
