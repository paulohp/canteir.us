class UsersController < InheritedResources::Base
	def show
    @user = User.find(params[:id])
    @vagas_aplicadas = @user.resume.applies
	end
end