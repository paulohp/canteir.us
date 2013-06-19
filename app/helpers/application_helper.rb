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

  #acao que verifica se o cidadao tem ou nao cv cadastrado
  def btn_criar_editar_curriculo resume
    if resume == nil
      link_to "Curriculo", "/users/#{current_user.id}/resumes/new", :class => "btn btn-danger btn-block"
    else
      link_to "Editar Curriculo", "/users/#{current_user.id}/resumes/#{current_user.resume.id}/edit", :class => "btn btn-danger btn-block"
    end
  end

  def btn_editar_perfil user
    if user.name == nil || user.bio == nil || user.location == nil
      link_to "Completar Perfil", "/users/#{current_user.id}/edit", :class => "btn btn-danger btn-block"
    else
      link_to "Editar Perfil", "/users/#{current_user.id}/edit", :class => "btn btn-danger btn-block"
    end
  end
end
