# utf-8
class JobsController < InheritedResources::Base


  def index
    if params[:search]
      @jobs = Job.busca(params[:search]).order("created_at DESC")
    else
      @jobs = Job.order("created_at DESC")
    end

    @search = Job.search(params[:q])
    @jobs = @search.result

    @user = User.find(current_user.id) if current_user
  end

  def new
    @job = current_company.jobs.build
    @categories = Category.all
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
