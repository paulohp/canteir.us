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

  #link de submit da vaga
  def link_to_submit text, args
    link_to_function text, "$(this).closest('form').submit()", args
  end

  def ejob_applied? ejob_id
    if user_signed_in?
      applicados = current_user.resume.applies
      if applicados == []
        return link_to 'Aplicar', "/jobs/#{ejob_id}/applies/new", :class => 'btn btn-block btn-success'
      else
        applicados.each do |aplicado|
          unless aplicado.job_id == ejob_id
            return link_to 'Aplicar', "/jobs/#{ejob_id}/applies/new", :class => 'btn btn-block btn-success'
          else
            return link_to 'Já Enviada', "#", :class => 'btn btn-block btn-danger'
          end
        end
      end
    else
      return link_to 'Aplicar', "/jobs/#{ejob_id}/applies/new", :class => 'btn btn-block btn-success'
    end
  end

  def vd (*args)
    unless true #Rails.env.production?
      p '                          '
      p '   DEBUGGER START (VIEW)  '
      p '   -   '
      p '   -   '
      args.each do |arg|
        p arg
        p '============================================='
      end
      p '   -   '
      p '   -   '
      p '   DEBUGGER END (VIEW)    '
      p '                          '
    end
  end
end
