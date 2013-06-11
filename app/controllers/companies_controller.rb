class CompaniesController < InheritedResources::Base
  before_filter :authenticate_company!, :except => [:index, :show]

  def show
    @company = Company.find(params[:id])
    @jobs = @company.jobs
  end
end
