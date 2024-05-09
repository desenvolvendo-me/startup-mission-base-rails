# app/controllers/page_controller.rb
class PageController < ApplicationController
  before_action :set_recent_invoices, only: [:billing]

  def activity
    render layout: 'admin'
  end

  def profile
    render layout: 'admin'
  end

  def people
    render layout: 'admin'
  end

  def calendar
    render layout: 'admin'
  end

  def assignments
    render layout: 'admin'
  end

  def message
    render layout: 'admin'
  end

  def messages
    render layout: 'admin'
  end

  def project
    render layout: 'admin'
  end

  def projects
    render layout: 'admin'
  end

  def dashboard
    render layout: 'admin'
  end

  def homepage; end

  def about; end

  def pricing; end

  def faq; end

  def billing
    if @recent_invoices.any?
      first_invoice = @recent_invoices.first
      subscription_id = first_invoice.subscription

      if subscription_id.present?
        subscription = retrieve_subscription(subscription_id)
        @plan_name, @plan_interval, @plan_amount = retrieve_plan_details(subscription)
        @plan_currency = subscription.currency.upcase
        @current_period_end = format_time(subscription.current_period_end)
      else
        set_default_plan_details
      end
    else
      set_default_plan_details
    end
    render layout: 'admin'
  end

  def integrations; end

  def team; end

  def notifications; end

  def settings; end

  private

  def set_recent_invoices
    @recent_invoices = retrieve_recent_invoices_from_stripe
  end

  def retrieve_recent_invoices_from_stripe
    Stripe::Invoice.list(limit: 4).data
  rescue Stripe::StripeError => e
    Rails.logger.error("Stripe Error: #{e.message}")
    []
  end

  def retrieve_subscription(subscription_id)
    Stripe::Subscription.retrieve(subscription_id)
  rescue Stripe::StripeError => e
    Rails.logger.error("Stripe Error: #{e.message}")
    nil
  end

  def retrieve_plan_details(subscription)
    if subscription.items.data.any?
      plan = subscription.items.data.first.plan
      product = Stripe::Product.retrieve(plan.product)
      plan_name = product.name
      plan_interval = plan.interval
      plan_amount = plan.amount / 100.0  # Converte de centavos para unidades monetárias
      [plan_name, plan_interval, plan_amount]
    else
      ["Desconhecido", "Desconhecido", "Indisponível"]
    end
  rescue Stripe::StripeError => e
    Rails.logger.error("Stripe Error: #{e.message}")
    ["Erro ao recuperar o plano", "Desconhecido", "Indisponível"]
  end

  def format_time(timestamp)
    Time.at(timestamp).strftime("%d de %B, %Y")
  rescue
    "Indisponível"
  end

  def set_default_plan_details
    @plan_name = "Não disponível"
    @plan_currency = "USD"
    @plan_amount = "Indisponível"
    @current_period_end = "Indisponível"
    @plan_interval = "Desconhecido"
  end
end
