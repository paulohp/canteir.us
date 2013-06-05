class CompaniesController < InheritedResources::Base
  before_filter :authenticate_company!, :except => [:index, :show]
end
