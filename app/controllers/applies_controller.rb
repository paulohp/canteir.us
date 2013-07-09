class AppliesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]  
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
        format.html { redirect_to root_path, notice: 'Aplicada com sucesso' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new", notice: "Deu Erro" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
end
