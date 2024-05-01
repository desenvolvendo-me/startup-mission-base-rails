# app/controllers/checkouts_controller.rb
class CheckoutController < ApplicationController
  def create
    plan_id = get_plan_price_id(params[:plan])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
                     price: plan_id,
                     quantity: 1,
                   }],
      mode: 'subscription',
      success_url: root_url + 'checkout_success',  # Ajuste conforme necessário
      cancel_url: root_url + 'checkout_cancel',    # Ajuste conforme necessário
      )

    redirect_to session.url, allow_other_host: true
  end

  def success
    flash[:notice] = "Pagamento concluído com sucesso!"
    redirect_to about_path # Modifique para o caminho desejado após sucesso
  end

  def cancel
    flash[:alert] = "O pagamento foi cancelado!"
    redirect_to pricing_path # Modifique para retornar à página de preços ou outra
  end

  private

  def get_plan_price_id(plan_type)
    case plan_type
    when 'startup'
      'price_1P9dyVRpXIS2OKDB32fpKBJy'  # Substitua pelo seu Price ID real do Stripe
    when 'professional'
      'price_1P9dqJRpXIS2OKDBsXqKCdr1'
    when 'premium'
      'price_1P9dnjRpXIS2OKDBoqfghETT'
    else
      raise "Plano desconhecido: #{plan_type}"
    end
  end
end
