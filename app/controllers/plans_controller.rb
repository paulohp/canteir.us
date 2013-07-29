class PlansController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:show, :index]
  def comprar
    @user = current_user
  end

  def confirmation
    dt = DateTime.now.to_i
    purchase_id       = "CANT#{Random.new(dt.hash + current_user.hash).rand(10000)}"
    transaction_price = 100.0

    card_attrs = {
     'logo'            => params[:logo],
     'card_number'     => params[:card_number],
     'expiration_date' => params[:expiration_date],
     'security_code'   => params[:security_code],
     'owner_name'      => params[:cho_owner_name],
     'owner_birthday'  => params[:cho_owner_birthday],
     'owner_phone'     => params[:cho_owner_phone],
     'owner_cpf'       => params[:cho_owner_cpf]
    }

    payer_attrs = {
      'id'                    => params[:cho_id],
      'name'                  => params[:cho_name],
      'email'                 => params[:cho_email],
      'address_street'        => params[:cho_address_street],
      'address_street_number' => params[:cho_address_street_number],
      'address_street_extra'  => params[:cho_address_street_extra],
      'address_neighbourhood' => params[:cho_address_neighbourhood],
      'address_city'          => params[:cho_address_city],
      'address_state'         => params[:cho_address_state],
      'address_country'       => params[:cho_address_country],
      'address_cep'           => params[:cho_address_cep],
      'address_phone'         => params[:cho_address_phone]
    }

    purchase = MyMoip::Purchase.new(
      id:          purchase_id,
      price:       transaction_price,
      reason:      'Payment of my product',
      credit_card: card_attrs,
      payer:       payer_attrs
    )
    respond_to do |format|
      if purchase.checkout!
        flash[:notice] = "Transação Criada com o numero => #{purchase.code }";
        format.html {redirect_to :controller => "jobs", :action => "index"}
      else
        flash[:notice] = "O contato com o Moip foi falhou, tente novamente.#{purchase.code }";
        format.html {redirect_to :controller => "plans", :action => "index"}
      end
    end
    if purchase.checkout! # => true OR false (succesfull state)

    else
    end
    purchase.code # Moip code or nil, depending of the checkout's return
  end

  def notification
    done     { puts 'runs in done notifications' }
    canceled { puts 'runs in canceled notifications' }
    reversed { puts 'runs in reversed notifications' }
    refunded { puts 'runs in refunded notifications' }
  end
end
