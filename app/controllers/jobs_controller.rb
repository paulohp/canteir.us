# utf-8
class JobsController < InheritedResources::Base
  before_filter :authenticate_company!, :except => [:index, :show]

  def index
    if params[:search]
      @jobs = Job.search(params[:search]).order("created_at DESC")
    else
      @jobs = Job.order("created_at DESC")
    end
  end

  def new
    @job = current_company.jobs.build
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
