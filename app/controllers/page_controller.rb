class PageController < ApplicationController
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

  def billing; end

  def integrations; end

  def team; end

  def billing
    @recent_invoices = retrieve_recent_invoices_from_stripe
  end

  def notifications; end

  def settings; end

  private

  def retrieve_recent_invoices_from_stripe
    Stripe::Invoice.list(limit: 4)
  end
end
