module ApplicationHelper
  def link_to_resume resume
    if resume == nil
      "/users/#{current_user.id}/resumes/new"
    else
      "/users/#{current_user.id}/resumes/#{current_user.resume.id}"
    end
  end
end
