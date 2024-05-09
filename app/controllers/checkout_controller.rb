# app/controllers/checkouts_controller.rb
class CheckoutController < ApplicationController
  def create
    user = current_user
    customer = user.client.update_stripe_customer

    plan_type = params[:plan]

    plan_id = get_plan_price_id(plan_type)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
                     price: plan_id,
                     quantity: 1,
                   }],
      mode: 'subscription',
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
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
    when 'professional_montlhy'
      'price_1PCWsiRpXIS2OKDBowrOw4CT'
    when 'premium_montlhy'
      'price_1PCWuFRpXIS2OKDBlzlZvmWh'
    when 'professional_yearly'
      'price_1PCWwORpXIS2OKDB2Z7wcmWe'
    when 'premium_yearly'
      'price_1PCXVjRpXIS2OKDBRNodCpRx'
    else
      raise "Plano desconhecido: #{plan_type}"
    end
  end
end
