class ResumesController < InheritedResources::Base

  def show
    @resume = Resume.find(params[:id])
    @formacao_academica = @resume.academics
    @experiencia_profissional = @resume.experiences
  end

  def new
    @user = current_user
    @resume = @user.build_resume

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume }
    end
  end

  # GET /tasks/1/edit
  def edit
    @resume = Resume.find(params[:id])
    @formacao_academica = @resume.academics
    @experiencia_profissional = @resume.experiences
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @user = current_user
    @resume = @user.create_resume(params[:resume])

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Task was successfully created.' }
        format.json { render json: @resume, status: :created, location: @resume }
      else
        format.html { render action: "new" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @resume = Resume.find(params[:id])

    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        format.html { redirect_to @resume, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end
end
