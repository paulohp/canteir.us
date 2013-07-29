class PlansController < InheritedResources::Base

  def comprar
    purchase_id       = 'UNIQUE_PURCHASE_ID'
    transaction_price = 100.0

    card_attrs = {
     'logo'            => 'visa',
     'card_number'     => '4916654211627608',
     'expiration_date' => '06/15',
     'security_code'   => '000',
     'owner_name'      => 'Juquinha da Rocha',
     'owner_birthday'  => '03/11/1980',
     'owner_phone'     => '5130405060',
     'owner_cpf'       => '52211670695'
    }

    payer_attrs = {
      'id'                    => '1',
      'name'                  => 'Juquinha da Rocha',
      'email'                 => 'juquinha@rocha.com',
      'address_street'        => 'Felipe Neri',
      'address_street_number' => '406',
      'address_street_extra'  => 'Sala 501',
      'address_neighbourhood' => 'Auxiliadora',
      'address_city'          => 'Porto Alegre',
      'address_state'         => 'RS',
      'address_country'       => 'BRA',
      'address_cep'           => '90440150',
      'address_phone'         => '5130405060'
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
