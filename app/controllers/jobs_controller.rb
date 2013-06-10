# utf-8
class JobsController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @job = current_company.jobs.build
    @project = Project.find(params[:project_id])
    @rewards = @project.rewards
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @job = current_company.jobs.build(params[:job])
    respond_to do |format|
      if @job.save
        format.html { redirect_to root_path, notice: 'Vaga criada com sucesso' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
end
