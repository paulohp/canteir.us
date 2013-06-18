module ApplicationHelper

  #metodo que define qual link do curriculo, se cria um novo ou se pega o existente
  def link_to_resume resume
    if resume == nil
      "/users/#{current_user.id}/resumes/new"
    else
      "/users/#{current_user.id}/resumes/#{current_user.resume.id}"
    end
  end

  #metodo que capitura a foto do gravatar
  def avatar_url(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

end
