class UsersController < InheritedResources::Base
	def show
    @user = User.find(params[:id])
    @vagas_aplicadas = @user.resume.applies unless @user.resume.nil?
	end
end