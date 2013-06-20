class AppliesController < ApplicationController
  before_filter :authenticate_company!, :except => [:index, :show]

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:resume_id])
    @apply = @job.build_applies
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @resume = Resume.find(params[:resume_id])
    @apply = @resume.applies.find_or_initialize_by_user_id(current_user.id)
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
