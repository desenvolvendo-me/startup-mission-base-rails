# app/controllers/checkouts_controller.rb
class CheckoutController < ApplicationController
  def create
    plan_id = get_plan_price_id(params[:plan])
    mode = params[:payment_type]
    puts "plan_id #{plan_id}"

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price: plan_id,
        quantity: 1
      }],
      mode: mode,
      success_url: checkout_success_url,  # Ajuste conforme necessário
      cancel_url: checkout_cancel_url    # Ajuste conforme necessário
    )

    redirect_to session.url, allow_other_host: true
  end

  def success
    flash[:notice] = 'Pagamento concluído com sucesso!'
    render 'checkout/success'
  end

  def cancel
    flash[:alert] = 'O pagamento foi cancelado!'
    render 'checkout/cancel'
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
